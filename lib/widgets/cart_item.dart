import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:smart_crop/models/products.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartitem});

  final Product cartitem;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          IconlyLight.delete,
          color: Colors.white,
        ),
      ),
      confirmDismiss: (direction) async {
        final completer = Completer<bool>();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 4),
            content: Text("Remove from cart?"),
            action: SnackBarAction(label: "Keep", onPressed: (){
              completer.complete(false);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            }),
          ),
        );
        Timer(Duration(seconds: 4), () {
          if(!completer.isCompleted) {
            completer.complete(true);
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
        }
        });

        return await completer.future;
      },
      child: SizedBox(
        height: 130,
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0.8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(
              width: 0.4,
              color: Colors.grey,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: double.infinity,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(cartitem.image),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartitem.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(height: 2),
                      Text(
                        cartitem.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${cartitem.price}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.green.shade800),
                          ),
                          SizedBox(
                            height: 30,
                            child: ToggleButtons(
                              onPressed: (index) {
                                if (index == 2) {
                                } else if (index == 0) {}
                              },
                              borderRadius: BorderRadius.circular(99),
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 20,
                                ),
                                Text("2"),
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                )
                              ],
                              isSelected: [
                                true,
                                false,
                                true,
                              ],
                              selectedColor:
                                  Theme.of(context).colorScheme.primary,
                              constraints: const BoxConstraints(
                                minHeight: 30,
                                minWidth: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
