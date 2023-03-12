import 'package:bloc_implement/bloc/activity_bloc.dart';
import 'package:bloc_implement/second.dart';
import 'package:bloc_implement/views/home.dart';
import 'package:bloc_implement/views/main_page.dart';
import 'package:bloc_implement/views/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/second': (context) => main_page(),
          '/cart': ((context) => cart()),
          '/profile': (context) => profile()
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => activityBloc(),
          child: const Activities(),
        ));
  }
}
