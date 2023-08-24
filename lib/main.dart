import 'package:flutter/material.dart';
import 'package:stucap_admin/config/router.dart';
import 'package:stucap_admin/config/theming.dart';

import 'presentation/presentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stucap Admin',
      theme: AppThemeData.lightTheme,
      onGenerateRoute: RouteGenerator.onGeneratedRoutes,
      initialRoute: LoginScreen.routeName,
    );
  }
}
