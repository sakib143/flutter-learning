import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testing/utils/MyRoutes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(
          context, MyRoutess.homeRoute);
      //Restore if user back
      setState(() {
        changeButton = false;
      });
    }
  }

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
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'images/login.png',
                    fit: BoxFit.cover,
                  ),
                  Text("Welcome $name", style: TextStyle(fontSize: 20.0)),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 32.0),
                    child: Column(children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter user name", labelText: "User name"),
                        onChanged: (value) {
                          name = value;
                          setState(() {}); // refresh UI
                        },
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'User name can not be empty';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter user password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if(value!.isEmpty) {
                            return 'Please enter password';
                          } else if (value.length < 6) {
                            return 'Password lengh must be greater than 6';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ]),
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        alignment: Alignment.center,
                        width: changeButton ? 50 : 150,
                        height: 50.0,
                        child: changeButton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
