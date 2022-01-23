import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/tama_events/btn_bloc.dart';
import 'package:flutter_app/bloc/user/user_bloc.dart';
import 'package:flutter_app/widgets/profile_control_btns.dart';
import 'package:flutter_app/widgets/profile_widget.dart';
import 'package:flutter_app/widgets/status_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../main.dart';
import 'home.dart';
import 'log_in.dart';

class TamaProfScreen extends StatelessWidget{
  Widget build(BuildContext context) {
    return BlocBuilder<BtnBloc, BtnState>(
        builder: (context, state) {
           return Scaffold(
              body: ListView(
                children: [Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      color: Colors.red,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.red,),
                        onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MyHomePage()));},
                            child: Icon(Icons.close, color: Colors.white)
                    ),
                    Container(
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                        child: Column(
                          children: [
                            Text('GENERAL STATE'),
                            LinearProgressIndicator(
                              value: 0.7,
                              valueColor: new AlwaysStoppedAnimation<Color>(Colors.tealAccent),
                            ),
                          ],
                        )
                    ),
                    //alignment: WrapAlignment.center,
                    //spacing: 10, // to apply margin in the main axis of the wrap
                    //runSpacing: 10,
                    //children: [
                      state is AddPercentageSuccessful?
                        StatusWidget(value_1: state.tamagotchi.play,
                          value_2: state.tamagotchi.healthe,
                          value_3: state.tamagotchi.satiety,
                          value_4: state.tamagotchi.cheerfulness):LinearProgressIndicator(),
                        ProfileWidget(),
                        ProfControlBtnWidget()
                    //],
                  ]
                ),]
              ),
            );
      });
    }
}