import 'package:thuprai_delivery/ui/views/dispatched/model/order_disptached_model.dart';

abstract class OrderDispatchedRepository {
  Future<List<OrderDispatch>> getDispatchedOrders();
}
