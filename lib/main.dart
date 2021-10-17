import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopapp/Login/Login.dart';

void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(

        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            elevation: 0.0,

            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.red,
                statusBarIconBrightness: Brightness.light
            )
        ),

        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          //selectedItemColor: Colors.

        )

    ),
    home: Login(),
  ));
}