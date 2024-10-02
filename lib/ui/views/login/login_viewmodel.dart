import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.bottomsheets.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/ui/views/login/login_view.form.dart';
import 'package:thuprai_delivery/ui/views/login/repository/login_repository_implementation.dart';

class LoginViewModel extends FormViewModel with $LoginView {
  final formKey = GlobalKey<FormState>();
  final _loginRepo = locator<LoginRepositoryImplementation>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  bool passwordVisible = true;
  Icon suffixIcon = const Icon(Icons.visibility);

  /// Toggle visibility
  suffixIconTap() {
    passwordVisible = !passwordVisible;
    suffixIcon = passwordVisible
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    rebuildUi();
  }

  bool isOdd(int num) {
    return num % 2 == 0 ? false : true;
  }

  Future<bool> login(String email, String password) async {
    if (hasEmailValidationMessage || hasPasswordValidationMessage) {
      return false;
    } else {
      try {
        await _loginRepo.loginApiRequest(email, password);
        _navigationService.replaceWithHomeView();
        _bottomSheetService.showCustomSheet(
            variant: BottomSheetType.floatingBoxBottom,
            description: "Login Successful");
        return true;
      } catch (e) {
        _dialogService.showCustomDialog(
            variant: DialogType.errorAlert, description: e.toString());
        return false;
      }
    }
  }
}
