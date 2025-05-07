import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_checking/constants/app_colors.dart';
import 'package:weather_checking/constants/sizes.dart';
import 'package:weather_checking/features/dashboard/domain/user_location.dart';
import 'package:weather_checking/features/dashboard/presentation/providers/get_weather_provider.dart';
import 'package:weather_checking/features/dashboard/presentation/widgets/weather_widget.dart';

import '../../../../routing/routes_strings.dart';
import '../providers/location_provider.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key, required this.name});

  final String name;

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen>
    with TickerProviderStateMixin {
  Color weatherBackgroundColor = AppColors.surfaceColor;
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getWeatherStatusProvider);
    final locationProviderState = ref.watch(locationProvider);
    ref.listen(locationProvider, (_, next) {
      next.whenOrNull(
        error: (error, stackTrace) => debugPrint('ERRADO ${error.toString()}'),
        data: (data) {
          if (data != null) {
            ref.read(getWeatherQueryProvider.notifier).state = Some(
              UserLocation(latitude: data.latitude, longitude: data.longitude),
            );
            _slideController.reverse();
          }
        },
      );
    });

    ref.listen(getWeatherStatusProvider, (_, next) {
      next.whenData((weather) {
        if (weather != null) {
          setState(() {
            weatherBackgroundColor = switch (weather.temperature) {
              > 20 => AppColors.backgroundColor,
              < 20 => AppColors.coolBlue,
              _ => AppColors.surfaceColor,
            };
            SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                  statusBarColor: weatherBackgroundColor,
                  statusBarIconBrightness: Brightness.dark),
            );
          });
        }
      });
    });

    return Scaffold(
      backgroundColor: weatherBackgroundColor,
      floatingActionButton: OutlinedButton.icon(
        icon: const Icon(Icons.logout),
        onPressed: () {
          context.goNamed(RoutesStrings.login);
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
                statusBarColor: AppColors.surfaceColor,
                statusBarIconBrightness: Brightness.dark),
          );
        },
        label: const Text('Logout'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: Sizes.p64,
                child: Text(
                  'Hi ${widget.name}',
                  style: const TextStyle(
                      fontSize: Sizes.p32, fontWeight: FontWeight.w500),
                ),
              ),
              gapH64,
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 350),
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 400),
                      opacity: locationProviderState.isLoading ? 1 : 0.25,
                      child: locationProviderState.isLoading
                          ? SlideTransition(
                              position: _slideAnimation,
                              child: FadeTransition(
                                opacity: _slideController,
                                child: const Column(children: [
                                  Text(
                                    'Getting your location. . . ',
                                    style: TextStyle(fontSize: Sizes.p32),
                                  ),
                                  CircularProgressIndicator(),
                                ]),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                  ),
                  state.when(
                      data: (weather) {
                        if (weather != null) {
                          return WeatherWidget(weather: weather);
                        } else {
                          return const Text('No weather conditions');
                        }
                      },
                      error: (error, _) => Text('error $error'),
                      loading: () => const LinearProgressIndicator()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
