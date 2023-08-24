import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal:25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DataValues.loginTitle,
                style: TextStyle(
                  color: AppThemeData.primaryColor,
                  fontSize:
                  AppThemeData.lightTheme.textTheme.displayMedium!.fontSize,
                  fontWeight:
                  AppThemeData
                      .lightTheme.textTheme.titleLarge!.fontWeight,
                ),
              ),
              Text(
                DataValues.loginDescription,
                style: TextStyle(
                  color: AppThemeData.primaryColor,
                  fontSize:
                  AppThemeData.lightTheme.textTheme.titleMedium!.fontSize,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: const InputDecoration(
                  hintText: DataValues.emailHintAndLabel,
                  labelText: DataValues.emailHintAndLabel,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                controller: _password,
                decoration: const InputDecoration(
                  hintText: DataValues.passwordHintAndLabel,
                  labelText: DataValues.passwordHintAndLabel,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButton(
            onPressed: (){},
            text: DataValues.loginElevatedButtonTitle,
          ),
            ],
          ),
        ),
      ),
    );
  }
}
