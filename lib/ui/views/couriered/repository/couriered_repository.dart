import 'package:thuprai_delivery/base/model/order_model.dart';

abstract class CourieredRepository {
  Future<List<Order>> getCourieredOrders();
}
