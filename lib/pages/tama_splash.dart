import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home.dart';

class TamaSplash extends StatefulWidget{
  const TamaSplash({Key? key}) : super(key: key);

  @override
  State<TamaSplash> createState() => _TamaSplashState();
}

class _TamaSplashState extends State<TamaSplash> {
  @override
  void initState(){
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(Duration(microseconds: 1000), (){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color(0xFFEEBD17),
    resizeToAvoidBottomInset: true,
    body: Center(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10, // to apply margin in the main axis of the wrap
            runSpacing: 10, // to apply margin in the cross axis of the wrap
            children: [
              SizedBox(
                  width: 500,
                  height: 500,
                  child: Image.asset('assets/lego_enter.png')
              ),
            ],
          ),
        ),
      ),
    );
    }
}
