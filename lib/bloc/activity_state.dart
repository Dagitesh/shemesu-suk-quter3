import 'package:bloc_implement/model/Activity.dart';
import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';

abstract class ActivityState extends Equatable {
  const ActivityState();

  @override
  List<Object> get props => [];
}

class TestInitialState extends ActivityState {}

class ActivityLoadingState extends ActivityState {}

class ActivitySuccess extends ActivityState {
  final List grocery;
  const ActivitySuccess(Activity activity, {required this.grocery});
}

class ActivityFailState extends ActivityState {}
