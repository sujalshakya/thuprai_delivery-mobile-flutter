import 'package:thuprai_delivery/base/model/order_model.dart';

abstract class PendingRepository {
  Future<List<Order>> getPendingOrders();
}
