import 'package:equatable/equatable.dart';

abstract class ActivityEvent extends Equatable {}

class GetDataButtonPressed extends ActivityEvent {
  @override
  List<Object> get props => [];
}
