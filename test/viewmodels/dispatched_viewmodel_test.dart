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

    test('Fetch Orders', () async {
      final orderService = getAndRegisterOrderRepositoryImplementation();
      when(orderService.getOrders("type"))
          .thenAnswer((realInvocation) async => [Order()]);
      await orderService.getOrders("type");
      List<Order> orders = await orderService.getOrders("type");

      expect(orders.toString(), [Order()].toString());
    });

    tearDown(() => locator.reset());
  });
}
