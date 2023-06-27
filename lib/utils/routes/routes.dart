import 'package:flutter/material.dart';
import 'package:ninjanews/utils/routes/routes_name.dart';
import 'package:ninjanews/view/home_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final argume = settings.arguments;
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());

      // case RoutesName.forgotPassword:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const PasswordScreen());

      // case RoutesName.guestUser:
      //   return MaterialPageRoute(
      //       builder: (BuildContext context) => const GuestScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No Route Defined'),
            ),
          );
        });
    }
  }
}
