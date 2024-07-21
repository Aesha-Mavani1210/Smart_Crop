import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smart_crop/models/order.dart';
import 'package:smart_crop/widgets/order_product.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order,this.visibleProducts = 2});
  final Order order;
  final int visibleProducts;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalPrice = order.products.fold(0.0, (acc, e) => acc + e.price);
    final products = order.products.take(visibleProducts).toList();
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Order: ${order.id}",
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  '(${order.products.length}, items)',
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: Colors.grey.shade500, fontSize: 13),
                ),
                SizedBox(width: 5),
                Text("\$${totalPrice.toStringAsFixed(2)}"),
              ],
            ),
            SizedBox(height: 20),
            ...List.generate(
              products.length,
              (index) {
                return OrderProduct(
                  order: order,
                  product: products[index],
                );
              },
            ),
            if (order.products.length > 2)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      showDragHandle: true,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            itemCount: order.products.length,
                            padding: EdgeInsets.all(14),
                            itemBuilder: (context, index) {
                            final product = order.products[index];
                            return OrderProduct(order: order, product: product);
                          },),
                        );
                      },
                    );
                  },
                  icon: Icon(IconlyBold.arrowRight),
                  label: Text("View all"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
