import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:thuprai_delivery/app/app.router.dart';

class TestMaterial extends StatelessWidget {
  const TestMaterial({
    required this.home,
    super.key,
  });
  final String home;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      initialRoute: home,
    );
  }
}
