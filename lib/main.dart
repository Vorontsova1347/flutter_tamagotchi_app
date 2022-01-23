import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/bloc/tama_events/btn_bloc.dart';
import 'package:flutter_app/pages/tama_splash.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/user/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(create: (BuildContext context) => UserBloc()),
          BlocProvider<BtnBloc>(create: (BuildContext context) => BtnBloc())
        ],
        child: MaterialApp(
          //title: 'Flutter Demo',
          theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFEEBD17)),
          //home: const MyHomePage(title: 'Flutter Demo Home Page'),
          //home: const MyHomePage(),
          home: TamaSplash(),
        ));
  }
}

