import 'package:active_system/core/class/api.dart';
import 'package:active_system/link_api.dart';

class FrezzeData {
  FrezzeData();
  add(Map data) async {
    var res = await Api().post(
      uri: linkFreezeAdd,
      body: data,
    );
    return res;
  }

  view(Map data) async {
    var res = await Api().post(uri: linkFreezeView, body: data);
    return res;
  }

  delete(Map data) async {
    var res = await Api().post(uri: linkAdminDelete, body: data);
    return res;
  }
}
