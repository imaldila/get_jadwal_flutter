import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_jadwal/app/features/check_in/views/check_in_view.dart';
import 'package:get_jadwal/app/features/schedule/views/schedule_view/schedule_view.dart';

import 'app_names.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    log('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const CheckInView());
      case Routes.schedule:
        return MaterialPageRoute(
            builder: (context) => ScheduleView(
                  user: settings.arguments as String,
                ));
      // case Routes.onboarding:
      //   return MaterialPageRoute(builder: (context) => const OnBoardingView());
      // case Routes.registration:
      //   return MaterialPageRoute(
      //       builder: (context) => const RegistrationView());
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
      ),
    );
  }
}
