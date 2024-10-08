import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';
import 'package:thuprai_delivery/base/repository/order_repository_implementation.dart';
import 'package:thuprai_delivery/base/service/secure_storage_service.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class BaseViewmodelWrapper extends BaseViewModel {
  final navigationService = locator<NavigationService>();
  final dialogService = locator<DialogService>();
  final bottomSheetService = locator<BottomSheetService>();
  final orderRepo = locator<OrderRepositoryImplementation>();
  final tokenService = locator<SecureStorageService>();

  Future<void> call({required String phoneNumber}) async {
    final Uri urlParsed = Uri.parse('tel:$phoneNumber');

    if (await canLaunchUrl(urlParsed)) {
      await launchUrl(urlParsed);
    } else {
      dialogService.showCustomDialog(
          variant: DialogType.errorAlert, description: "Could not open call");
    }
  }

  void logout() async {
    tokenService.deleteToken('token');
    navigationService.replaceWith(Routes.loginView);
  }

  double getFinalPrice(payment, price) {
    return double.parse(price!) - double.parse(payment ?? '0');
  }

  void tapOnBarcode() async {
    navigationService.navigateToBarcodeView();
  }

  void navigate(Order order, String price, bool orderDispatch) {
    navigationService.navigateToOrderDetailsView(
        order: order, price: price, orderDispatch: orderDispatch);
  }
}
