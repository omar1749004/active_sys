import 'package:active_system/data/service/remote/admin_data.dart';

var res = await AdminData().add(
  {
    "name": text,
    "type": type,
    "password": sha1(password.text),
    "note": note,
    "powers": powers,
  },
);

var res = await AdminData().edit(
  {
   "id": id,
  "name": name,
  "type": type,
  "password": sha1(password.text),
  "note": note,
  "powers": powers,
  }

);
var res = await AdminData().delete(
  {
   "id": id
  }
  
);
