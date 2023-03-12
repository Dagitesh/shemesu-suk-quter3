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
  List purchase_History;

  ActivitySuccess(this.grocery, this.purchase_History, {required Activity});
}

class ActivityFailState extends ActivityState {
  String message;

  ActivityFailState(this.message);
}
