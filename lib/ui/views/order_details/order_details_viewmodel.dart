import 'package:thuprai_delivery/app/app.bottomsheets.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
import 'package:thuprai_delivery/ui/views/order_details/models/order_status_change.dart';
import 'package:thuprai_delivery/ui/views/order_details/repository/order_details_repository_implementation.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderDetailsViewModel extends BaseViewmodelWrapper {
  int quantity = 0;
  final Order order;

  OrderDetailsViewModel(this.order);

  void leadingTap() {
    navigationService.back();
  }

  getQuanity() {
    for (int i = 0; i < order.lines!.length; i++) {
      quantity += order.lines?[i].quantity ?? 0;
    }
    rebuildUi();
  }

  Future<bool> changeOrderStatus(String id, String type) async {
    final orderRepo = locator<OrderDetailsRepositoryImplementation>();

    OrderStatusChangeResponse response =
        await orderRepo.changeOrderStatus(id.toString(), type);

    if (response.error == null) {
      bottomSheetService.showCustomSheet(
          variant: BottomSheetType.floatingBoxBottom,
          description: "Order Status Changed Sucessfull");
      return true;
    } else {
      bottomSheetService.showCustomSheet(
          variant: BottomSheetType.floatingBoxBottom,
          description: "Order Status Change Error");
      return false;
    }
  }

  Future<void> sms({required String phoneNumber}) async {
    final Uri urlParsed = Uri.parse('sms:$phoneNumber');

    if (await canLaunchUrl(urlParsed)) {
      await launchUrl(urlParsed);
    } else {
      dialogService.showCustomDialog(
          variant: DialogType.errorAlert, description: "Could not open sms");
    }
  }

  Future<void> openMap(String location) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$location';
    if (await canLaunchUrl(Uri.parse(googleUrl))) {
      await launchUrl(Uri.parse(googleUrl));
    } else {
      throw 'Could not open the map.';
    }
  }
}
