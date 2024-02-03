import 'package:active_system/data/service/remote/sub_data.dart';

var res = await SubData().add(
  {
    "name": text,
    "type": type,
    "specialization": ,
    "price": note,
    "day": powers,
    "sessions_number": text,
    "frezz_day": type,
    "frezz_number": sha1(password.text),
    "max_frezz_day": note,
    "invitations_number": powers,
    "max_invitation": text,
    "service_number": type,
    "max_service": sha1(password.text),
    "allowed_number": note,
    "notes": powers,
  },
);

var res = await SubData().edit(
  {
   "id": id,
    "name": text,
    "type": type,
    "specialization": ,
    "price": note,
    "day": powers,
    "sessions_number": text,
    "frezz_day": type,
    "frezz_number": sha1(password.text),
    "max_frezz_day": note,
    "invitations_number": powers,
    "max_invitation": text,
    "service_number": type,
    "max_service": sha1(password.text),
    "allowed_number": note,
    "notes": powers,
  }

);
var res = await SubData().delete(
  {
   "id": id
  }
  
);
