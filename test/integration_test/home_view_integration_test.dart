// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:thuprai_delivery/app/app.bottomsheets.dart';
// import 'package:thuprai_delivery/app/app.dialogs.dart';
// import 'package:thuprai_delivery/app/app.locator.dart';
// import 'package:thuprai_delivery/app/app.router.dart';

// import 'key_strings.dart';
// import 'test_material.dart';

// void main() async {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();
//   await setupLocator();
//   setupBottomSheetUi();
//   setupDialogUi();
//   FlutterSecureStorage.setMockInitialValues(
//       {'token': 'e0d32c801a4320128ab033ad28232c38c0dfa62f'});
//   Get.testMode = true;
//   group('Home View integration test', () {
//     testWidgets('first test', (tester) async {
//       await tester.pumpWidget(
//         const ScreenUtilInit(child: TestMaterial(home: Routes.homeView)),
//       );

//       /// Check if tab bar and title bar appears.
//       expect(find.text("Dispatched"), findsAtLeast(2));

//       /// Check if tapping on a tabbar changes the title of the appbar.
//       final processing = find.text("Processing");
//       expect(processing, findsOneWidget);
//       await tester.tap(pickup);
//       await tester.pumpAndSettle();
//       expect(processing, findsAtLeast(2));

//       /// Test search bar
//       await Future.delayed(const Duration(seconds: 2));
//       await tester.tap(search);
//       await Future.delayed(const Duration(seconds: 1));
//       await tester.pumpAndSettle();

//       await tester.enterText(find.byType(TextField), "a");
//       await Future.delayed(const Duration(seconds: 1));
//       await tester.pumpAndSettle();

//       /// Open order details view from searched orders.
//       await Future.delayed(const Duration(seconds: 3));
//       await tester.ensureVisible(orderlist.first);
//       await tester.tap(orderlist.first);
//       await tester.pumpAndSettle();

//       await Future.delayed(const Duration(seconds: 2));
//       await tester.tap(find.byIcon(Icons.arrow_back));
//       await tester.pumpAndSettle();

//       /// Go back to home page.
//       await Future.delayed(const Duration(seconds: 3));
//       await tester.tap(find.byIcon(Icons.arrow_back));
//       await tester.pumpAndSettle();

//       /// Check if tapping on the logout button navigates user to login view.
//       expect(logout, findsOneWidget);
//       await tester.tap(logout);
//       await tester.pumpAndSettle();
//     });
//   });
// }
