import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pacotes/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('pt', 'BR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('pt', 'BR'),
      child: const MyApp()));
}
