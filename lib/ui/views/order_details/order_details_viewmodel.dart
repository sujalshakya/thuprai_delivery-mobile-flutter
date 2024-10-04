import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';
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
