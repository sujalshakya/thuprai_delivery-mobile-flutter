import 'package:flutter_test/flutter_test.dart';
import 'package:thuprai_delivery/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CourieredViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
