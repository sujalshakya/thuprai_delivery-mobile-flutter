import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/base/service/secure_storage_service.dart';
import 'package:thuprai_delivery/ui/views/home/home_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  FlutterSecureStorage.setMockInitialValues({'token': "random string"});
  Get.testMode = true;
  final viewModel = HomeViewModel();
  final tokenService = locator<SecureStorageService>();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());

    test("When logout method is called, token is deleted in secure storage",
        () async {
      viewModel.logout();
      final token = await tokenService.getToken('token');
      expect(token, null);
    });

    test("The final price is properly calculated and returned", () async {
      final result = viewModel.getFinalPrice("1000", "1000");
      expect(result, 0.00);
    });

    test('When logout method is called, user is navigated to login page',
        () async {
      final navigation = getAndRegisterNavigationService();
      final viewModel = HomeViewModel();

      await viewModel.logout();

      verify(navigation.replaceWith(Routes.loginView));
    });

    tearDown(() => locator.reset());
  });
}
