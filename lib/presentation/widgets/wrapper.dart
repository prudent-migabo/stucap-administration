import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/presentation/presentation.dart';

class Wrapper extends StatefulWidget {
  static const String routeName = '/Wrapper';
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStreamCubit, AuthStreamState>(
        builder: (context, state) {
          if (state.userAuthStatus == UserAuthStatus.unauthenticated){
            return const LoginScreen();
          } else {
            return WelcomeScreen();
          }
        });
  }
}