import 'package:flutter/material.dart';
import 'package:qr_scanner/src/views/screens/home_screen.dart';
import 'package:qr_scanner/src/views/screens/splash_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/splash": (context) => SplashScreen(),
        "/home": (context) => HomeScreen(),
      },
      initialRoute: "/splash",
      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
