import 'package:flutter/material.dart';

import 'package:taskat_apk/screens/dashboard_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const TaskatApp());
}

class TaskatApp extends StatelessWidget {
  const TaskatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en'), const Locale('fa')],
      debugShowCheckedModeBanner: false,
      home: DashBoardScreen(),
    );
  }
}
