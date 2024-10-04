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

  group('Full App Integration test', () {
    testWidgets('Test', (tester) async {
      await tester.pumpWidget(
        const ScreenUtilInit(
          child: TestMaterial(
            home: Routes.startupView,
          ),
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      /// Check if all the required widgets are available.
      expect(emailTextfield, findsOneWidget);
      expect(passwordTextfield, findsOneWidget);
      expect(loginButton, findsOneWidget);

      await Future.delayed(const Duration(seconds: 2));

      /// Check if login is allowed when valid credentials are inputted.
      await tester.enterText(emailTextfield, 'timalsinasuman876@gmail.com');
      await tester.enterText(passwordTextfield, 'suman@#123');
      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);
      await Future.delayed(const Duration(seconds: 3));

      /// Tap logout icon to dismiss bottomsheet.
      await tester.pumpAndSettle();
      await tester.tap(logout);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      /// Open order details view.
      await Future.delayed(const Duration(seconds: 3));
      await tester.ensureVisible(orderlist.first);
      await tester.tap(orderlist.first);
      await tester.pumpAndSettle();

      /// Go back to home page.
      await Future.delayed(const Duration(seconds: 5));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      /// Go to pick up page.
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.text("Picking Up"));
      await tester.pumpAndSettle();

      /// Open pick up details page.
      await Future.delayed(const Duration(seconds: 1));
      await tester.ensureVisible(pickup.first);
      await tester.tap(pickup.first);
      await tester.pumpAndSettle();

      /// Go back to home page.
      await Future.delayed(const Duration(seconds: 5));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      /// Go to processing page
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.text("Processing"));
      await tester.pumpAndSettle();

      /// Open order details view.
      await Future.delayed(const Duration(seconds: 3));
      await tester.ensureVisible(orderlist.first);
      await tester.tap(orderlist.first);
      await tester.pumpAndSettle();

      /// Go back to home page.
      await Future.delayed(const Duration(seconds: 5));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      /// Go to returned page
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.text("Returned"));
      await tester.pumpAndSettle();

      /// Test search bar
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(search);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), "a");
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      /// Open order details view from searched orders.
      await Future.delayed(const Duration(seconds: 3));
      await tester.ensureVisible(orderlist.first);
      await tester.tap(orderlist.first);
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      /// Go back to home page.
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      /// Go to Couriered tab.
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.text("Couriered"));
      await tester.pumpAndSettle();

      /// Open order details view.
      await Future.delayed(const Duration(seconds: 3));
      await tester.ensureVisible(orderlist.first);
      await tester.tap(orderlist.first);
      await tester.pumpAndSettle();

      /// Go back to home page.
      await Future.delayed(const Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      /// Logout.
      await tester.tap(logout);
      await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();
    });
  });
}
