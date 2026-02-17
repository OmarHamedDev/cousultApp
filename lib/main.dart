import 'package:flutter/material.dart';

import 'config/localization/flutter_localization_service.dart';
import 'consult_app.dart' show ConsultApp;
import 'dependency_injection/di.dart' show configureDependencies;

void main() async {
  await _appInlizeApp();
  runApp(const ConsultApp());
}

Future<void> _appInlizeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  await FlutterLocalizationService().init();
}
