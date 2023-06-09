import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shemsu_suk/view/cart.dart';
import 'package:flutter/services.dart';
import 'package:shemsu_suk/view/Home.dart';

import 'bloc/activity_blocc.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
  
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => itemBloc(),
      child: MaterialApp(theme: ThemeData(), home: const item()),
    );
  }
}
