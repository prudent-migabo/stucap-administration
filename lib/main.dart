import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/config/router.dart';
import 'package:stucap_admin/config/theming.dart';

import 'firebase_options.dart';
import 'presentation/presentation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => LogoutCubit()),
        BlocProvider(create: (context) => StudentCubit()),
        BlocProvider(create: (context) => AuthStreamCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Stucap Admin',
        theme: AppThemeData.lightTheme,
        onGenerateRoute: RouteGenerator.onGeneratedRoutes,
        initialRoute: Wrapper.routeName,
      ),
    );
  }
}
