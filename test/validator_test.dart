import 'package:flutter_test/flutter_test.dart';
import 'package:thuprai_delivery/app/app.locator.dart';
import 'package:thuprai_delivery/base/common/validators.dart';

import 'helpers/test_helpers.dart';

void main() {
  group('Validator Tests', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test('fail validate login test while value is empty', () {
      const value = "";
      final result = Validators.validateLogin(value);
      expect(result, 'Please enter some text');
    });
    test('pass validate login test', () {
      const value = "bro";
      final result = Validators.validateLogin(value);
      expect(result, null);
    });

    test('fail validate email test while value is empty', () {
      const value = "";
      final result = Validators.validateEmail(value);
      expect(result, 'Please enter your email');
    });
    test('fail validate email test while value has no @ and . ', () {
      const value = "bro";
      final result = Validators.validateEmail(value);
      expect(result, 'Please enter a viable email address');
    });

    test('pass email validator', () {
      const value = "bro@gmail.com";
      final result = Validators.validateEmail(value);
      expect(result, null);
    });

    test('fail password validator when value has no small letter', () {
      const value = "BR0@HOME";
      final result = Validators.validatePassword(value);
      expect(
          result, 'Requires small letter, capital letter, number and symbol');
    });

    test('fail password validator when value has no capital letter', () {
      const value = "br0@home";
      final result = Validators.validatePassword(value);
      expect(
          result, 'Requires small letter, capital letter, number and symbol');
    });
    test('fail password validator when value has no number', () {
      const value = "Bro@home";
      final result = Validators.validatePassword(value);
      expect(
          result, 'Requires small letter, capital letter, number and symbol');
    });
    test('fail password validator when value has no symbol', () {
      const value = "BroAhome";
      final result = Validators.validatePassword(value);
      expect(
          result, 'Requires small letter, capital letter, number and symbol');
    });
    test('pass password validator', () {
      const value = "Br0@home";
      final result = Validators.validatePassword(value);
      expect(result, null);
    });
  });
}
