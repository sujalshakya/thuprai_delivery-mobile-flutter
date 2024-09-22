import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.bottomsheets.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/ui/views/login/repository/login_repository_implementation.dart';

class LoginViewModel extends BaseViewModel {
  final _loginRepo = locator<LoginRepositoryImplementation>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  bool passwordVisible = true;
  late Icon suffixIcon;
  suffixIconTap() {
    passwordVisible = !passwordVisible;
    suffixIcon = passwordVisible
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    rebuildUi();
  }

  Future<void> login(String email, String password) async {
    try {
      await _loginRepo.loginApiRequest(email, password);
      _navigationService.replaceWithHomeView();
      _bottomSheetService.showCustomSheet(
          variant: BottomSheetType.floatingBoxBottom,
          description: "Login Successful");
    } catch (e) {
      rethrow;
    }
  }
}
