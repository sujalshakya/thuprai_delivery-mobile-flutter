import 'package:thuprai_delivery/base/model/order_model.dart';

abstract class ProcessingRepository {
  Future<List<Order>> getDispatchedOrders();
}
