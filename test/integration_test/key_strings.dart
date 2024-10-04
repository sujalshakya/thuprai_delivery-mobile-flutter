import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final loginButton = find.byKey(
  const Key('login'),
);
final passwordTextfield = find.byKey(const Key('password'));
final emailTextfield = find.byKey(const Key('email'));
final logout = find.byIcon(Icons.logout_outlined);
final search = find.byIcon(Icons.search);
final pickup = find.byKey(const Key("pickup"));
final orderlist = find.byKey(const Key("OrderList"));
