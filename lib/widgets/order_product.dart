import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_crop/models/order.dart';
import 'package:smart_crop/models/products.dart';
import 'package:smart_crop/order_details_page.dart';

class OrderProduct extends StatelessWidget {
  const OrderProduct({super.key, required this.order, required this.product});
  final Order order;
  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => OrderDetailPage(order: order),
          ),
        );
      },
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: 90,
            margin: EdgeInsets.only(right: 10, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  product.image,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  product.description,
                  style: theme.textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: theme.textTheme.titleSmall?.copyWith(
                          color: Colors.green.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("Qty: ${Random().nextInt(4) + 1}"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
