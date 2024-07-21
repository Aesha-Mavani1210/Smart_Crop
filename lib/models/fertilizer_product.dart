// class Fertilizer {
//   final String name;
//   final String description;
//   final String image;
//   final double price;
//   final String unit;
//   final double rating;

//   const Fertilizer(
//       {required this.name,
//       required this.description,
//       required this.image,
//       required this.price,
//       required this.rating,
//       required this.unit});
// }

// class Cart {
//   List<Fertilizer> items = [];

//   // Add fertilizer to the cart
//   void addToCart(Fertilizer fertilizer) {
//     items.add(fertilizer);
//   }

//   // Remove fertilizer from the cart
//   void removeFromCart(Fertilizer fertilizer) {
//     items.remove(fertilizer);
//   }

//   // Get the total price of items in the cart
//   double getTotalPrice() {
//     double totalPrice = 0.0;
//     for (var item in items) {
//       totalPrice += item.price;
//     }
//     return totalPrice;
//   }
// }

// class Seed {
//   final String name;
//   final String description;
//   final String image;
//   final double price;
//   final String unit;
//   final double rating;

//   const Seed(
//       {required this.name,
//       required this.description,
//       required this.image,
//       required this.price,
//       required this.rating,
//       required this.unit});
// }

// class Machinery {
//   final String name;
//   final String description;
//   final String image;
//   final double price;
//   final String unit;
//   final double rating;

//   const Machinery(
//       {required this.name,
//       required this.description,
//       required this.image,
//       required this.price,
//       required this.rating,
//       required this.unit});
// }


import 'package:flutter/material.dart';

abstract class CartItem {
  String get itemName;
  String get itemImage;
  double get itemPrice;
}

class Fertilizer implements CartItem {
  final String name;
  final String description;
  final String image;
  final double price;
  final String unit;
  final double rating;

  Fertilizer({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.unit,
  });

  @override
  String get itemName => name;

  @override
  String get itemImage => image;

  @override
  double get itemPrice => price;
}

class Seed implements CartItem {
  final String name;
  final String description;
  final String image;
  final double price;
  final String unit;
  final double rating;

  Seed({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.unit,
  });

  @override
  String get itemName => name;

  @override
  String get itemImage => image;

  @override
  double get itemPrice => price;
}

class Machinery implements CartItem {
  final String name;
  final String description;
  final String image;
  final double price;
  final String unit;
  final double rating;

  Machinery({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.rating,
    required this.unit,
  });

  @override
  String get itemName => name;

  @override
  String get itemImage => image;

  @override
  double get itemPrice => price;
}

class Cart extends ChangeNotifier{

  List<CartItem> items = [];

  void addToCart(CartItem item) {
    items.add(item);
    print("Item added to cart: ${item.itemName}");
  }

  void removeFromCart(CartItem item) {
    items.remove(item);
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var item in items) {
      totalPrice += item.itemPrice;
    }
    return totalPrice;
  }
}


class Categories {
  final String image;
  final String name;

  const Categories(
      {
      required this.image,
        required this.name,
     });
}