import 'package:flutter/material.dart';
import 'package:smart_crop/data/fertilizer_product.dart';
import 'package:smart_crop/fertilizer_cart.dart';

class Machinery extends StatelessWidget {
  const Machinery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Shopping",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: Machinerys.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.77,
            ),
            itemBuilder: (context, index) {
              return MachineryCart(machinery: Machinerys[index],);
            },
          ),
        ],
      ),
    );
  }
}