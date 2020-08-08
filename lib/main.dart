import 'package:flutter/material.dart';
import 'package:musictask/Core/constants/app_contstant.dart';
import 'package:musictask/Core/constants/router.dart';
import 'package:musictask/locator.dart';

void main() {

  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        initialRoute: RoutePaths.Splash,
        onGenerateRoute: Router.generateRoute,
     // home: Splash()
    );
  }
}
