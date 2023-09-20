import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stucap_admin/business_logic/business_logic.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';
import 'package:stucap_admin/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  onSubmit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<LoginCubit>().login(email: _email.text.trim(), password: _password.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          Navigator.pushNamedAndRemoveUntil(
              context, WelcomeScreen.routeName, (route) => false);
        } else if (state is LoginError) {
          errorDialog(context, content: state.message);
        }
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      DataValues.loginTitle,
                      style: TextStyle(
                        color: AppThemeData.primaryColor,
                        fontSize: AppThemeData
                            .lightTheme.textTheme.displayMedium!.fontSize,
                        fontWeight: AppThemeData
                            .lightTheme.textTheme.titleLarge!.fontWeight,
                      ),
                    ),
                    Text(
                      DataValues.loginDescription,
                      style: TextStyle(
                        color: AppThemeData.primaryColor,
                        fontSize: AppThemeData
                            .lightTheme.textTheme.titleMedium!.fontSize,
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
                      validator: (val) => val!.isEmpty
                          ? 'Ce champ ne peut pas etre vide'
                          : !val.contains('@')
                          ? 'Email invalide'
                          : null,
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
                      validator: (val) => val!.isEmpty
                          ? 'Ce champ ne peut pas etre vide'
                          : null,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return CustomButton(
                          onPressed: state is LoginLoading ? () {} : onSubmit,
                          text: state is LoginLoading ? 'Patientez...' : DataValues.loginElevatedButtonTitle,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
