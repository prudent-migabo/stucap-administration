import 'package:flutter/material.dart';
import 'package:stucap_admin/config/theming.dart';
import 'package:stucap_admin/presentation/presentation.dart';
import 'package:stucap_admin/statics/statics.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const Wrapper()), (route) => false);
      // Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeData.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(DataValues.splashTitle, style: TextStyle(
                color: AppThemeData.textWhite,
                fontSize: AppThemeData.lightTheme.textTheme.displayMedium!.fontSize,
                fontWeight: AppThemeData.lightTheme.textTheme.displaySmall!.fontWeight,
              ),),
              const SizedBox(height: 5),
              Text(DataValues.splashDescription, style: TextStyle(
                color: AppThemeData.textWhite,
                fontSize: AppThemeData.lightTheme.textTheme.titleMedium!.fontSize,
                fontWeight: AppThemeData.lightTheme.textTheme.titleSmall!.fontWeight,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
