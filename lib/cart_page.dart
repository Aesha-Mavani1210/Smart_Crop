import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:smart_crop/models/fertilizer_product.dart';
import 'package:pdf/widgets.dart' as pw;

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Razorpay? _razorpay;
  late Cart cart;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    cart = Provider.of<Cart>(context, listen: false);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay!.clear();
  }

  void _startPayment() async {
    var options = {
      'key': 'rzp_test_cfTVsUAB5c2IBw',
      'amount': '${cart.getTotalPrice() * 100}',
      'name': 'Smart Crop',
      'description': 'Payment for a product',
      'prefill': {'contact': '7984327489', 'email': 'test@example.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay!.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print('Payment Successful: ${response.paymentId}');

    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final User? user = _auth.currentUser;

      if (user != null) {
        final DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        final String firstName = userDoc['firstName'] ?? 'Guest';
        final String userEmail = userDoc['email'];

        final pdf = pw.Document();

        pdf.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Stack(
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Header(
                        text: '$firstName\'s Invoice'.toUpperCase(),
                        textStyle: pw.TextStyle(
                          fontSize: 35,
                          color: PdfColor.fromHex('#000000'),
                        ),
                      ),
                      pw.SizedBox(height: 20),
                      pw.Table(
                        border: pw.TableBorder.all(
                            color: PdfColor.fromHex('#000000'), width: 2),
                        children: [
                          pw.TableRow(
                            children: [
                              pw.Container(
                                padding: const pw.EdgeInsets.all(20),
                                child: pw.Text(
                                  'INVOICE FOR PAYMENT',
                                  style: pw.Theme.of(context).header4.copyWith(
                                        color: PdfColor.fromHex('#000000'),
                                        fontWeight: pw.FontWeight.bold,
                                      ),
                                  textAlign: pw.TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          ...cart.items.map(
                            (e) => pw.TableRow(
                              children: [
                                pw.Expanded(
                                  child: pw.Container(
                                    padding: const pw.EdgeInsets.all(10),
                                    color: const PdfColor.fromInt(0xFFF0F0F0),
                                    child: pw.Text(
                                      e.itemName,
                                      textAlign: pw.TextAlign.left,
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  flex: 2,
                                ),
                                pw.Expanded(
                                  child: pw.Container(
                                    padding: const pw.EdgeInsets.all(10),
                                    color: const PdfColor.fromInt(0xFFF0F0F0),
                                    child: pw.Text(
                                      '${e.itemPrice.toString()}',
                                      textAlign: pw.TextAlign.right,
                                      style: pw.TextStyle(
                                        fontWeight: pw.FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                  flex: 1,
                                ),
                              ],
                            ),
                          ),
                          pw.TableRow(
                            children: [
                              pw.Container(
                                padding: const pw.EdgeInsets.all(10),
                                child: pw.Text(
                                  'TAX',
                                  textAlign: pw.TextAlign.right,
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              pw.Container(
                                padding: const pw.EdgeInsets.all(10),
                                child: pw.Text(
                                  '${(cart.getTotalPrice() * 0.1).toStringAsFixed(2)}',
                                  textAlign: pw.TextAlign.right,
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          pw.TableRow(
                            children: [
                              pw.Container(
                                padding: const pw.EdgeInsets.all(10),
                                child: pw.Text(
                                  'TOTAL',
                                  textAlign: pw.TextAlign.right,
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              pw.Container(
                                padding: const pw.EdgeInsets.all(10),
                                child: pw.Text(
                                  '${cart.getTotalPrice()}',
                                  textAlign: pw.TextAlign.right,
                                  style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20,
                                    color: PdfColor.fromHex(
                                        '#f44336'), // Set your desired text color
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      pw.Footer(
                        margin: const pw.EdgeInsets.only(top: 150),
                        title: pw.Text(
                          '     THANK YOU FOR YOUR PURCHASE',
                          style: pw.TextStyle(
                            fontSize: 16,
                            color: PdfColor.fromHex(
                                '#000000'), // Set your desired text color
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
        const Text('Send to Email');
        TextButton(
          onPressed: () {
            // OpenFile.open(file.path);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('PDF downloaded successfully!')),
            );
            Navigator.of(context).pop();
          },
          child: const Text('Download'),
        );
      }
    } catch (error) {
      print(error);
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print('Payment Error: ${response.code} - ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('External Wallet: ${response.walletName}');
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: cart.items.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        final item = cart.items[index];
                        return Dismissible(
                          key: Key(item.itemName),
                          onDismissed: (direction) {
                            setState(() {
                              cart.removeFromCart(item);
                            });
                          },
                          child: Card(
                            elevation: 2,
                            child: ListTile(
                              leading: Image.asset(
                                item.itemImage,
                                width: 100,
                              ),
                              title: Text(item.itemName),
                              subtitle: Text(
                                'Price: ₹${item.itemPrice}',
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.green.shade800,
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '₹${cart.getTotalPrice()}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      _startPayment();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Row(
                        children: [
                          Text(
                            'Buy Now',
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
