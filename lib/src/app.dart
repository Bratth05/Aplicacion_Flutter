import 'package:aplicacion_flutter/src/form.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calculadora',
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: AplicacionForm());
  }
}
