import 'package:thuprai_delivery/base/model/order_model.dart';

abstract class OrderRepository {
  Future<List<Order>> getOrders(String type);
}
