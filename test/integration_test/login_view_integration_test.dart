import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.bottomsheets.dart';
import 'package:thuprai_delivery/app/app.dialogs.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/ui/views/login/login_view.dart';

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
        ScreenUtilInit(
          child: MaterialApp(
            onGenerateRoute: StackedRouter().onGenerateRoute,
            navigatorKey: StackedService.navigatorKey,
            navigatorObservers: [
              StackedService.routeObserver,
            ],
            home: const LoginView(),
          ),
        ),
      );

      /// Check if all the required widgets are available.
      expect(find.text("Forgot Password?"), findsOneWidget);
      expect(find.byKey(const Key('password')), findsOneWidget);
      expect(find.byKey(const Key('email')), findsOneWidget);
      expect(find.byKey(const Key('login')), findsOneWidget);

      /// Check if login is prevented when it fails validation and validation messages can be seen
      await tester.enterText(find.byKey(const Key('email')), '');
      await tester.enterText(find.byKey(const Key('password')), '');
      final login = find.byKey(
        const Key('login'),
        skipOffstage: false,
      );
      await tester.ensureVisible(login);
      await tester.tap(
        login,
      );
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Requires small letter, number and symbol'),
          findsOneWidget);

      /// Check if login is allowed when valid credentials are inputted.
      await tester.enterText(
          find.byKey(const Key('email')), 'timalsinasuman876@gmail.com');
      await tester.enterText(find.byKey(const Key('password')), 'suman@#123');
      await tester.ensureVisible(login);
      await tester.tap(
        login,
      );
    });
  });
}
