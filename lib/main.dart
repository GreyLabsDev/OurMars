import 'package:flutter/material.dart';
import 'package:our_mars/resources/strings.dart';
import 'package:our_mars/screens/screen_main/screen_main.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.screen_app_name,
      home: ScreenMain(),
      navigatorObservers: [routeObserver],
    );
  }
}