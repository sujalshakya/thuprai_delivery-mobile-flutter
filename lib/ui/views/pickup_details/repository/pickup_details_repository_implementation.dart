import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/network/api_service.dart';
import 'package:thuprai_delivery/ui/views/order_details/models/order_status_change.dart';

class PickupDetailsRepositoryImplementation {
  final apiService = locator<ApiService>();
  Future<OrderStatusChangeResponse> changePickupStatus(String id) async {
    return await apiService.markAsPickedUp(id);
  }
}
