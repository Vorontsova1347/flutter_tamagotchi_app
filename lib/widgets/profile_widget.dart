import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 120,
      child: Center(
        child: Container(
          margin: const EdgeInsets.only(
             top: 20.0, bottom: 20.0),
          child: Column(
            children: [
              SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/lego_enter.png')
              ),
              Text('TAMA NAME'),
            ],
          ),
        ),
      ),
    );
  }

}