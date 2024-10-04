import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/app/app.router.dart';
import 'package:thuprai_delivery/ui/views/startup/startup_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    test('startup navigation test to homeView', () async {
      FlutterSecureStorage.setMockInitialValues({'token': "random string"});
      final navigation = getAndRegisterNavigationService();
      final model = StartupViewModel();
      await model.runStartupLogic();
      verify(navigation.replaceWithHomeView()).called(1);
    });

    test('startup navigation test to loginView', () async {
      FlutterSecureStorage.setMockInitialValues({});
      final navigation = getAndRegisterNavigationService();
      final model = StartupViewModel();
      await model.runStartupLogic();
      verify(navigation.replaceWithLoginView()).called(1);
    });
    tearDown(() => locator.reset());
  });
}
