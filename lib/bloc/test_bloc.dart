import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_implement/bloc/test_event.dart';
import 'package:bloc_implement/bloc/test_state.dart';
import 'package:bloc_implement/service/apiService.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(TestInitialState());

  @override
  TestState? get initialState => TestInitialState();

  final _apiServiceProvider = ApiServiceProvider();

  @override
  Stream<TestState> mapEventToState(TestEvent event) async* {
    if (event is GetDataButtonPressed) {
      yield TestLoadingState();
      try {
        final activity = await _apiServiceProvider.fetchActivity();
        yield TestSuccessState(activity!);
      } catch (e) {
        yield TestFailState(e.toString());
      }
    }
  }
}
