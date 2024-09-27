import 'package:thuprai_delivery/base/model/order_model.dart';

abstract class OrderDispatchedRepository {
  Future<List<Order>> getDispatchedOrders();
}
