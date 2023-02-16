import 'package:bloc_implement/bloc/test_bloc.dart';
import 'package:bloc_implement/bloc/test_event.dart';
import 'package:bloc_implement/bloc/test_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Activities extends StatefulWidget {
  const Activities({super.key});

  @override
  State<Activities> createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activities')),
      body: BlocBuilder<TestBloc, TestState>(builder: (context, state) {
        if (state is TestInitialState) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<TestBloc>(context)
                      .add(GetDataButtonPressed());
                },
                child: const Text('Get Activity')),
          );
        } else if (state is TestLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TestFailState) {
          return Text(state.message);
        } else if (state is TestSuccessState) {
          return Text(state.activity.activity);
        }
        return Container();
      }),
    );
  }
}
