import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/tama_events/btn_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfControlBtnWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Container(
          margin: const EdgeInsets.only(
              left: 20.0, right: 20.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,),
                    onPressed: (){BlocProvider.of<BtnBloc>(context).add(AddPercentageEvent(Param.play));}, child: Text('+')),
                ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,),
                    onPressed: (){BlocProvider.of<BtnBloc>(context).add(AddPercentageEvent(Param.healthe));}, child: Text('+')),
                ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.green,),
                    onPressed: (){BlocProvider.of<BtnBloc>(context).add(AddPercentageEvent(Param.satiety));}, child: Text('+')),
                ElevatedButton(style: ElevatedButton.styleFrom(
                    primary: Colors.blue,),
                    onPressed: (){BlocProvider.of<BtnBloc>(context).add(AddPercentageEvent(Param.cheerfulness));}, child: Text('+')),
              ],
            ),
          ),
        )
    );
  }

}