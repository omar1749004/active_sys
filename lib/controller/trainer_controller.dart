import 'package:active_system/data/service/remote/trainer_data.dart';

var res = await TrainerData().add(
  {
    "id": text,
    "name": type,
    "phone": sha1(password.text),
    "adress": note,
    "note": powers,
  },
);

var res = await TrainerData().edit(
  {
    "id": text,
    "name": type,
    "phone": sha1(password.text),
    "adress": note,
    "note": powers,
  }

);
var res = await TrainerData().search(
  {
    "search": id,
  }
  
);
