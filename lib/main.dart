import 'package:flutter/material.dart';
import 'package:myewallet/routes.dart';
import 'package:myewallet/screens/splash/splash_screen.dart';
import 'package:myewallet/theme.dart';
import 'package:provider/provider.dart';

import 'mydata.dart';


void main() {
  runApp(ChangeNotifierProvider<MyData>(
      create: (context) => MyData(),
      child:MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
