import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:thuprai_delivery/app/app.bottomsheets.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/ui/views/login/login_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  setupBottomSheetUi();
  setupDialogUi();
  FlutterSecureStorage.setMockInitialValues({});

  Get.testMode = true;

  group('LoginViewModel Tests -', () {
    setUp(
      () => registerServices(),
    );
    final viewModel = LoginViewModel();

    test('toggle visibilty when suffixIconTap method is called', () {
      viewModel.suffixIconTap();
      bool visibility = viewModel.passwordVisible;
      expect(visibility, false);
    });
    test('login request is success', () async {
      String email = 'sujalshakya387@gmail.com';
      String password = 'sxfum21m';
      final login = await viewModel.login(email, password);
      expect(login, true);
    });
    test('login request is fail', () async {
      String email = 'sujalshakya7@gmail.com';
      String password = 'sxfum21';
      final login = await viewModel.login(email, password);
      expect(login, false);
    });

    tearDown(() => locator.reset());
  });
}
