import 'package:bloc_implement/model/Activity.dart';
import 'package:equatable/equatable.dart';

abstract class ActivityEvent extends Equatable {}

class GetDataButtonPressed extends ActivityEvent {
  @override
  List<Object> get props => [];
}

class PurchaseHistoryEvent extends ActivityEvent {
  final Activity grocery;
  PurchaseHistoryEvent({required this.grocery});

  @override
  List<Object> get props => [];

  get data => grocery;
}
