import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeFilterLogicCubit(),
        ),
        BlocProvider(
          create: (context) => HomeListStudentsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stucap Admin',
        theme: AppThemeData.lightTheme,
        onGenerateRoute: RouteGenerator.onGeneratedRoutes,
        initialRoute: WelcomeScreen.routeName,
      ),
    );
  }
}
