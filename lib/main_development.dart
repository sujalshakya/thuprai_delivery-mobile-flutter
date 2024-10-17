import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:thuprai_delivery/firebase_options_development.dart';

import 'flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  F.appFlavor = Flavor.development;
  await runner.main();
}
