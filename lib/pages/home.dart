import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

import 'log_in.dart';

class MyHomePage extends StatefulWidget {
  //const MyHomePage({Key? key, required this.title}) : super(key: key);
  const MyHomePage({Key? key}) : super(key: key);
  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/lego_enter.png')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LogInScreen()));
                  },
                  child: Text('LOG IN',
                      style: GoogleFonts.righteous(
                          fontSize: 24,
                          textStyle: const TextStyle(color: Colors.white))),
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Colors.black))),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignInScreen()));
                  },
                  child: Text('SIGN UP',
                      style: GoogleFonts.righteous(
                          fontSize: 24,
                          textStyle: const TextStyle(color: Colors.black))))
            ]),
      ),
    );
  }
}