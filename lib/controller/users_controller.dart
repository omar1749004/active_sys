
import 'package:active_system/data/service/remote/users_data.dart';

var res = await UsersData().add(
  {
    "id": text,
    "name": text,
    "phone": type,
    "adress": ,
    "note": note,
    "gender": powers,
    "date": text,
    "image": type,
    "captinId": sha1(password.text),
    "subscriptionsId": note,
    "adminId": powers,
    "active": text,
    "barcodeNum": type,
  },
);

var res = await UsersData().edit(
  {
    "id": text,
    "name": text,
    "phone": type,
    "adress": ,
    "note": note,
    "gender": powers,
    "date": text,
    "image": type,
    "captinId": sha1(password.text),
    "subscriptionsId": note,
    "adminId": powers,
    "active": text,
    "barcodeNum": type,
    "barcodeId": powers,
    "renewId": text,

  }

);
var res = await UsersData().delete(
  {
   "id": id,
   "barcode": id
  }
  
);
var res = await UsersData().search(
  {
    "creat": text,
    "seller": text,
    "borrowed": type,
    "active": ,
    "expire": note,
    "subscroption": powers,
    "search": text,
  }
  
);