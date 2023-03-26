import 'package:equatable/equatable.dart';
import 'package:shemsu_suk/model/item.dart';

abstract class itemEvent extends Equatable {
  const itemEvent();

  @override
  List<Object> get props => [];
}

class GetDataButtonPressed extends itemEvent {
  const GetDataButtonPressed();
  @override
  List<Object> get props => [];
}

class PurchaseHistoryEvent extends itemEvent {
  final item asbeza;
  const PurchaseHistoryEvent({required this.asbeza});

  @override
  List<Object> get props => [];

  get data => asbeza;
}

class incrementalEve extends itemEvent {
  final int input;
  const incrementalEve(
    this.input,
  );

  @override
  List<Object> get props => [];

  get data => input;
}

class decrementalEve extends itemEvent {
  final int input;
  decrementalEve(
    this.input,
  );

  @override
  List<Object> get props => [];

  get data => input;
}

class RemoveEve extends itemEvent {
  final int input;
  RemoveEve(
    this.input,
  );


  @override
  List<Object> get props => [];

  get data => input;
}
