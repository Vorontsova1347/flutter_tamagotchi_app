import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TamaGender extends StatefulWidget {
  bool flag_boy = true;

  @override
  State<TamaGender> createState() => _TamaGenderState();
}

class _TamaGenderState extends State<TamaGender>{

  @override

  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
                right: 20.0),
            child: ElevatedButton(
                onPressed:(){
                  setState(() {
                    widget.flag_boy = true;
                  });
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.black)),
                child:
                Text(
                    'BOY',
                    style: GoogleFonts.righteous(
                        fontSize: 24,
                        textStyle: const TextStyle(
                            color: Colors.white))
                )
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(
                left: 20.0),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    widget.flag_boy = false;
                  });
                },
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.black)),
                child:
                Text(
                    'GIRL',
                    style: GoogleFonts.righteous(
                        fontSize: 24,
                        textStyle: const TextStyle(
                            color: Colors.white))
                )
            ),
          ),
        ),
      ],
    );
  }

}