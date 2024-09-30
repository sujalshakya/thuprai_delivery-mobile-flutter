import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/base/service/secure_storage_service.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _tokenService = locator<SecureStorageService>();
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    final token = await _tokenService.getToken('token');
    debugPrint("token is $token");
    if (token == null) {
      _navigationService.replaceWithLoginView();
    } else {
      _navigationService.replaceWithHomeView();
    }
  }
}
