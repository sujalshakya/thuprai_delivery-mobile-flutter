import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.bottomsheets.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/ui/views/login/repository/login_repository_implementation.dart';

class LoginViewModel extends FormViewModel {
  final formKey = GlobalKey<FormState>();
  final _loginRepo = locator<LoginRepositoryImplementation>();
  final _navigationService = locator<NavigationService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  bool passwordVisible = true;
  late Icon suffixIcon;

  /// Toggle visibility
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
    } on DioException catch (e) {
      _dialogService.showCustomDialog(
          variant: DialogType.errorAlert,
          description: e.response!.data['non_field_errors'][0]);
    }
  }
}
