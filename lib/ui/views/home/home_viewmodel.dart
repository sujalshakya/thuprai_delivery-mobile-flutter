import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/service/secure_storage_service.dart';
import 'package:thuprai_delivery/base/wrapper/base_viewmodel_wrapper.dart';

class HomeViewModel extends BaseViewmodelWrapper {
  final _tokenService = locator<SecureStorageService>();
  final List<String> titleList = [
    "Dispatched",
    "Picking Up",
    "Processing",
    "Pending",
    "Returned",
    "Couriered",
    "Fulfilled",
  ];
  String currentTitle = "Dispatched";

  setTitle(index) {
    currentTitle = titleList[index];
    notifyListeners();
  }

  void logout() {
    _tokenService.deleteToken('token');
    navigationService.replaceWithLoginView();
  }
}
