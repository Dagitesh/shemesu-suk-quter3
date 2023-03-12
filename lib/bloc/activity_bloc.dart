import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_implement/bloc/activity_event.dart';
import 'package:bloc_implement/bloc/activity_state.dart';
import 'package:bloc_implement/data_provider/apiService.dart';

class activityBloc extends Bloc<ActivityEvent, ActivityState> {
  final _apiServiceProvider = ApiServiceProvider();
  List purchase_History = [];
  activityBloc() : super(TestInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(ActivityLoadingState());
      final activity = await _apiServiceProvider.fetchActivity();
      emit(ActivitySuccess(activity!, purchase_History, Activity: null));
    });
    on<PurchaseHistoryEvent>(
        (event, emit) => {purchase_History.add(event.data)});
  }
}
