import 'package:bloc_form_validation/form_validate/views/home/home_page.dart';
import 'package:bloc_form_validation/helpers/routs.dart';
import 'package:bloc_form_validation/helpers/theme.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Validations',
      theme: themeData(),
      initialRoute: HomePage.routeName,
      routes: routes,
    );
  }
}
