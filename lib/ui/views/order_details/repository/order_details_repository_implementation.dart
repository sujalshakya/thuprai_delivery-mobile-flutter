import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/ui/views/order_details/models/order_status_change.dart';

class OrderDetailsRepositoryImplementation {
  final apiService = locator<ApiService>();
  Future<OrderStatusChangeResponse> changeOrderStatus(
      String id, String type) async {
    if (type == "returned") {
      return await apiService.markAsReturned(id);
    } else {
      return await apiService.markAsDelivered(id);
    }
  }
}
