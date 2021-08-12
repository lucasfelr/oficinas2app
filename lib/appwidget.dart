import 'package:flutter/material.dart';
import 'package:ola_mundo/bt2.dart';
import 'appcontroller.dart';
import 'bluetoothapp.dart';
import 'homepage.dart';
import 'crianca.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: AppController.instance.isDartTheme
                ? Brightness.dark
                : Brightness.light,
          ),
          home: MyHomePage(),
        );
      },
    );
  }
}
