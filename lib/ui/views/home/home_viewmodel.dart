import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/service/secure_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _tokenService = locator<SecureStorageService>();
  final _navigationService = locator<NavigationService>();
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
    _navigationService.replaceWithLoginView();
  }
}
