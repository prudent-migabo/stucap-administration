import 'package:flutter/material.dart';
import 'package:stucap_admin/presentation/presentation.dart';

class RouteGenerator {
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case Wrapper.routeName :
        return MaterialPageRoute(builder: (context) => const Wrapper());
      case LoginScreen.routeName :
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case WelcomeScreen.routeName :
        return MaterialPageRoute(builder: (context) =>  WelcomeScreen());
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Page non trouvée'),
        ),
      );
    }
    );
  }
}