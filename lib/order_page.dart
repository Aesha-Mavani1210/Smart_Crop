import 'package:flutter/material.dart';
import 'package:smart_crop/data/orders.dart';
import 'package:smart_crop/utils/order.dart';
import 'package:smart_crop/widgets/order_item.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = OrderStatus.values.map((e) => e.name).toList();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Your Orders",
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
              tabs.length,
              (index) {
                return Tab(text: tabs[index]);
              },
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(tabs.length, (index) {
            final fileredOrders = orders
                .where(
                  (order) => order.status == OrderStatus.values[index],
                )
                .toList();
            return ListView.separated(
              padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final order = fileredOrders[index];
                  return OrderItem(order: order,);
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: fileredOrders.length,
            );
          }),
        ),
      ),
      );
  }
}
