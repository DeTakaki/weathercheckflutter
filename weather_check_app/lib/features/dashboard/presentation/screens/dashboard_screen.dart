import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_checking/routing/routes_strings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hi $name'),
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
