import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'configs/analytics.dart';
import 'configs/settings.dart';
import 'configs/database.dart';
import 'configs/remote_config.dart';
import 'configs/performance_monitoring.dart';

import 'splash_screen.dart';
import 'app.dart';

void main() async {
  debugPrint('App Starting: ${DateTime.now()}');

  runApp(const SplashScreen());

  await Future.wait([
    Settings.instance.initialize(),
    Database.open(table: 'notes'),

    // Setup Remote Config & AB Tests
    RemoteConfig.instance.getConfigs(),
    RemoteConfig.instance.loadExperiments(),

    // Setup Crash & Performance Monitoring
    PerformanceMonitoring.instance.start(env: Enviroment.production),
    Analytics.instance.initialize(),
  ]);

  runApp(const ProviderScope(
    child: App(),
  ));
}
