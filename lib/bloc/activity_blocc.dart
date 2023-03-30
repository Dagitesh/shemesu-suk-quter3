import 'package:shemsu_suk/model/service.dart';
import 'package:shemsu_suk/model/local.dart';
import 'package:shemsu_suk/model/database.dart';
import 'package:bloc/bloc.dart';
import 'package:shemsu_suk/model/item.dart';
import '../Service/apiService.dart';

import 'activity_event.dart';
import 'activity_state.dart';

// ignore: camel_case_types
class itemBloc extends Bloc<itemEvent, itemState> {
  final _apiServiceProvider = ApiServiceProvider();
  final service = Service();
  List purchaseHistory = [];
  List history = [];
  itemBloc() : super(itemInitialState()) {
    on<GetDataButtonPressed>((event, emit) async {
      emit(itemLoadingState());
      final activity = await _apiServiceProvider.fetchActivity();
      await service.readAsbeza().then((val) => {
           history = val,
         });
     purchaseHistory = item.historyList(history);
      
      emit(itemSuccessState(activity!, purchaseHistory));
    });
    on<PurchaseHistoryEvent>((event, emit) => {
          purchaseHistory.add(event.data),
          event.data.available = 1,
          service.saveAsbeza(event.data),
        });

    on<incrementalEve>((event, emit) => {
          purchaseHistory[event.data].counter++,
          service.updateAsbeza(
            purchaseHistory[event.data],
          )
        });
    on<decrementalEve>((event, emit) => {
          if (purchaseHistory[event.data].counter <= 1)
            {
              purchaseHistory[event.data].available = 0,
              service.deleteAsbeza(purchaseHistory[event.data].id),
              purchaseHistory.removeAt(event.data),
            }
          else
            {
              purchaseHistory[event.data].counter--,
              service.updateAsbeza(
                purchaseHistory[event.data],
              )
            },
        });
    on<RemoveEve>((event, emit) => {
          purchaseHistory[event.data].available = 0,
          purchaseHistory[event.data].counter = 1,
          service.deleteAsbeza(purchaseHistory[event.data].id),
          purchaseHistory.removeAt(event.data),
        });
  }
}
