import 'local.dart';
import 'item.dart';

class db{
  Repository? _repo;

  db() {
    _repo = Repository();
  }

  saveitem(item groceries) async {
    return await _repo!.insertData('asbeza', groceries.toJson());
  }

  readitem() async {
    return await _repo!.readData('asbeza');
  }

  updateitem(item grocerices) async {
    return await _repo!.updateData('asbeza', grocerices.toJson());
  }

  deleteitem(discon_ctId) async {
    return await _repo!.deleteData('asbeza', discon_ctId);
  }

  wipeDate() async {
    await _repo!.deleteAllData('asbeza');
  }
}