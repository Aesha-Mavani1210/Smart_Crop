import 'package:smart_crop/models/products.dart';
import 'package:smart_crop/utils/order.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime orderingDate;
  final DateTime deliveryDate;
  final OrderStatus status;

  Order({
    required this.id,
    required this.products,
    required this.orderingDate,
    required this.deliveryDate,
    required this.status,
  });
}
