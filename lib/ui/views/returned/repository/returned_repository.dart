import 'package:thuprai_delivery/base/model/order_model.dart';

abstract class ReturnedRepository {
  Future<List<Order>> getReturnedOrders();
}
