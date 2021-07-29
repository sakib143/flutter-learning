import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/utils/MyRoutes.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      theme: ThemeData(primaryTextTheme: GoogleFonts.latoTextTheme()),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login '),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset(
                  'images/login.png',
                  fit: BoxFit.cover,
                ),
                Text("Welcome", style: TextStyle(fontSize: 20.0)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 32.0),
                  child: Column(children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter user name", labelText: "User name"),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter user password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                  ]),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Button clicked !!!');
                    Navigator.pushNamed(context, MyRoutess.homeRoute);
                  },
                  child: Text('Login'),
                  style: TextButton.styleFrom(minimumSize: Size(150, 40)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
