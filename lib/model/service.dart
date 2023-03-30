import 'package:shemsu_suk/model/item.dart';

import 'local.dart';


class Service {
  Repository? _repository;

  Service() {
    _repository = Repository();
  }

  saveAsbeza(item asbeza) async {
    return await _repository!.insertData('asbeza', asbeza.toJson());
  }

  readAsbeza() async {
    return await _repository!.readData('asbeza');
  }

  updateAsbeza(item asbeza) async {
    return await _repository!.updateData('asbeza', asbeza.toJson());
  }

  deleteAsbeza(dispatchId) async {
    return await _repository!.deleteData('asbeza', dispatchId);
  }

  wipeDate() async {
    await _repository!.deleteAllData('asbeza');
  }
}