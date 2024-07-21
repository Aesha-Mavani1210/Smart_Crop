import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smart_crop/models/order.dart';
import 'package:smart_crop/utils/extention/date.dart';
import 'package:smart_crop/utils/order.dart';
import 'package:smart_crop/widgets/order_item.dart';

class OrderDetailPage extends StatelessWidget {
  const OrderDetailPage({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    const steps = OrderStatus.values;
    final activeStep = steps.indexOf(order.status);
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          EasyStepper(
            activeStep:
                activeStep == steps.length - 1 ? activeStep + 1 : activeStep,
            stepRadius: 10,
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: Theme.of(context).colorScheme.primary,
            lineStyle: LineStyle(
              defaultLineColor: Colors.green.shade300,
              lineLength:
                  (MediaQuery.of(context).size.width * 0.7) / steps.length,
            ),
            steps: List.generate(
              steps.length,
              (index) {
                return EasyStep(
                  icon: Icon(Icons.local_shipping),
                  finishIcon: Icon(Icons.done),
                  title: steps[index].name,
                  topTitle: true,
                );
              },
            ),
          ),
          Card(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order: ${order.id}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Chip(
                          shape: StadiumBorder(),
                          side: BorderSide.none,
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primaryContainer
                              .withOpacity(0.4),
                          labelPadding: EdgeInsets.zero,
                          avatar: Icon(Icons.fire_truck),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          label: Text(steps[activeStep].name),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Delivery Estimate"),
                      Text(
                        order.deliveryDate.formatDate,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Hello",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(IconlyLight.home, size: 20),
                      SizedBox(width: 6),
                      Expanded(
                        child:
                            Text("112,Abc Heights,\n Varachha,Surat,\n 394101"),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(IconlyLight.call, size: 20),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text("+91 8976758743"),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Methods"),
                      Text(
                        "Credit Card **123",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 30),
          OrderItem(order: order,visibleProducts: 1,),
        ],
      ),
    );
  }
}
