import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/user/user_bloc.dart';
import 'package:flutter_app/pages/tamagotchi_profile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TamagotchiMaker extends StatelessWidget{
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is AuthSuccessful) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) {
                  return TamaProfScreen();
                }), (route) => true);
          }
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: AppBar(
              backgroundColor: const Color(0xFFEEBD17),
              elevation: 0.0,
              bottomOpacity: 0.0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
                onPressed: () => Navigator.of(context).pop(),),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    // to apply margin in the main axis of the wrap
                    runSpacing: 10,
                    // to apply margin in the cross axis of the wrap
                    children: [
                      SizedBox(
                          width: 200,
                          height: 200,
                          child: Image.asset('assets/lego_enter.png')
                      ),
                      Text(
                          'SELECT TAMAGOTCHI\'S GENDER AND NAME',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.righteous(
                              fontSize: 24,
                              textStyle: const TextStyle(color: Colors.black))
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                              hintText: "NAME",
                              //helperText: "Input your name",
                              border: OutlineInputBorder(),
                              labelStyle: GoogleFonts.righteous(
                                  fontSize: 24
                              )
                          )),
                      SizedBox(
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    right: 20.0),
                                child: ElevatedButton(
                                    onPressed: () {},
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
                                    onPressed: () {},
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
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        margin: const EdgeInsets.only(
                            top: 10.0),
                        child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<UserBloc>(context)
                                  .add(AuthorizationEvent(
                                  password: passwordController.text.trim(),
                                  login: loginController.text.trim()));
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.black)),
                            child:
                            Text(
                                'NEXT',
                                style: GoogleFonts.righteous(
                                    fontSize: 24,
                                    textStyle: const TextStyle(
                                        color: Colors.white))
                            )
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
    );
  }

}