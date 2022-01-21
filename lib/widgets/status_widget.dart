import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusWidget extends StatelessWidget {

  StatusWidget({ this.value_1=0.5, this.value_2=0.5, this.value_3=0.5, this.value_4=0.5 });
  final double value_1;
  final double value_2;
  final double value_3;
  final double value_4;

  @override
  Widget build(BuildContext context) {
/*    return Container(
      margin: const EdgeInsets.only(
          left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: value,
            valueColor: new AlwaysStoppedAnimation<Color>(Colors.deepOrange),
          ),
          Text('Status'),
        ],
      ),
    );*/
    return Column(
      children: [
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                    child: Column(
                      children: [
                        Text('PLAY'),
                        LinearProgressIndicator(
                          value: value_1,
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
                        ),
                      ],
                    )
                  ),
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                      child: Column(
                        children: [
                          Text('SATIETY'),
                          LinearProgressIndicator(
                            value: value_3,
                            valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                      child: Column(
                        children: [
                        Text('HEALTHE'),
                        LinearProgressIndicator(
                          value: value_2,
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow),
                          ),
                        ],
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                      child: Column(
                        children: [
                        Text('CHEERFULNESS'),
                        LinearProgressIndicator(
                          value: value_4,
                          valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        ],
                      )
                    ),
                  ),
              ],
            ),
          )
      ],
    );

  }
}
