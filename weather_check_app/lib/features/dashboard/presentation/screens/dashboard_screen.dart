import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_checking/routing/routes_strings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('main screen'),
          ElevatedButton(
              onPressed: () {
                context.goNamed(RoutesStrings.login);
              },
              child: Text('logout')),
        ],
      ),
    );
  }
}
