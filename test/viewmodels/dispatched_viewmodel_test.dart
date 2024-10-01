import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/model/order_model.dart';

import '../helpers/test_helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  group('DispatchedViewModel Tests -', () {
    setUp(() => registerServices());

    test('Fetch Dispatched Orders', () async {
      final orderService =
          getAndRegisterOrderDispatchedRepositoryImplementation();
      when(orderService.getDispatchedOrders())
          .thenAnswer((realInvocation) async => [Order()]);
      await orderService.getDispatchedOrders();
      List<Order> orders = await orderService.getDispatchedOrders();

      expect(orders.toString(), [Order()].toString());
    });

    tearDown(() => locator.reset());
  });
}
