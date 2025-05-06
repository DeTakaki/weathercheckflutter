import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/routes_strings.dart';
import '../providers/location_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final test = ref.watch(locationProvider);
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
