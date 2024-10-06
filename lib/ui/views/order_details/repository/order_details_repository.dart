import 'package:thuprai_delivery/ui/views/order_details/models/order_status_change.dart';

abstract class OrderDetailsRepository {
  Future<OrderStatusChangeResponse> changeOrderStatus();
}
