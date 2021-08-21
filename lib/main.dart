import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/pages/Login_page.dart';
import 'package:testing/pages/home_page.dart';
import 'package:testing/utils/MyRoutes.dart';
import 'package:testing/widgets/MyTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutess.homeRoute,
      routes: {
        "/": (context) => Homepagge(),
        MyRoutess.loginRoute: (context) => LoginPage(),
        MyRoutess.homeRoute: (context) => Homepagge(),
      },
    );
  }

}
