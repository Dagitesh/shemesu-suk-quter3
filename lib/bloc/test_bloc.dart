import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_implement/bloc/test_event.dart';
import 'package:bloc_implement/bloc/test_state.dart';
import 'package:bloc_implement/service/apiService.dart';



class TestBloc extends Bloc<TestEvent, TestState> {
  final _apiServiceProvider = ApiServiceProvider();

  TestBloc() : super(TestInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(TestLoadingState());
      final activity = await _apiServiceProvider.fetchActivity();
      emit(TestSuccessState(activity!));
    });
  }
}
