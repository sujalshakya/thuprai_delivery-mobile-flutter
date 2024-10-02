import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:thuprai_delivery/app/app.bottomsheets.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'key_strings.dart';
import 'test_material.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupBottomSheetUi();
  setupDialogUi();
  FlutterSecureStorage.setMockInitialValues({});
  Get.testMode = true;

  group('Login View integration test', () {
    testWidgets('first test', (tester) async {
      await tester.pumpWidget(
        const ScreenUtilInit(
          child: TestMaterial(
            home: Routes.loginView,
          ),
        ),
      );

      /// Check if all the required widgets are available.
      expect(emailTextfield, findsOneWidget);
      expect(passwordTextfield, findsOneWidget);
      expect(loginButton, findsOneWidget);

      /// Check if login is prevented when it fails validation and validation messages can be seen
      await tester.enterText(find.byKey(const Key('email')), '');
      await tester.enterText(find.byKey(const Key('password')), '');

      await tester.ensureVisible(loginButton);
      await tester.tap(
        loginButton,
      );
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Requires small letter, number and symbol'),
          findsOneWidget);
      await Future.delayed(const Duration(seconds: 2));

      /// Check if login is allowed when valid credentials are inputted.
      await tester.enterText(emailTextfield, 'timalsinasuman876@gmail.com');
      await tester.enterText(passwordTextfield, 'suman@#123');
      await tester.tap(loginButton);
      await Future.delayed(const Duration(seconds: 3));

      await tester.pumpAndSettle();
    });
  });
}
