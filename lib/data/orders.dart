import 'package:smart_crop/data/products.dart';
import 'package:smart_crop/models/order.dart';
import 'package:smart_crop/utils/order.dart';

List<Order> orders = [
  Order(
      id: "402ajf5",
      products: Products.reversed.take(3).toList(),
      orderingDate: DateTime.utc(2023,12,1),
      deliveryDate: DateTime.utc(2023,11,1),
      status: OrderStatus.Delivered,
  ),
  Order(
    id: "203hfy4",
    products: Products.take(1).toList(),
    orderingDate: DateTime.utc(2023,12,1),
    deliveryDate: DateTime.utc(2023,11,1),
    status: OrderStatus.Processing,
  ),
  Order(
    id: "465hrf6",
    products: Products.reversed.skip(3).toList(),
    orderingDate: DateTime.utc(2023,8,1),
    deliveryDate: DateTime.utc(2023,6,6),
    status: OrderStatus.Processing,
  ),
  Order(
    id: "402fhg5",
    products: Products.reversed.skip(3).toList(),
    orderingDate: DateTime.utc(2023,12,1),
    deliveryDate: DateTime.utc(2023,6,3),
    status: OrderStatus.Processing,
  ),
  Order(
    id: "402ajf5",
    products: Products.skip(3).take(2).toList(),
    orderingDate: DateTime.utc(2023,12,1),
    deliveryDate: DateTime.utc(2023,11,1),
    status: OrderStatus.Picking,
  ),
  Order(
    id: "402ajf5",
    products: Products.skip(3).take(2).toList(),
    orderingDate: DateTime.utc(2023,12,10),
    deliveryDate: DateTime.utc(2023,10,6),
    status: OrderStatus.Shipping,
  ),
];
