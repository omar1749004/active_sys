import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {

  if (min != 0) {
    if (val.isEmpty) {
      return "لا يمكن أن يكون فارغًا";
    }
    if (val.length < min) {
      return "لا يمكن أن يكون أقل من $min";
    }
    if (val.length > max) {
      return "لا يمكن أن يكون أكبر من $max";
    }
    if (type == "username") {
      if (!GetUtils.isUsername(val)) {
        return "اسم المستخدم غير صالح";
      }
    }
    if (type == "email") {
      if (!GetUtils.isEmail(val)) {
        return "البريد الإلكتروني غير صالح";
      }
    }
    if (type == "num") {
      int? valid = int.tryParse(val);
      if (valid == null || valid < 1) {
        return "غير متاح إدخال الرقم 0";
      }
    }
    if (type == "phone") {
      if (!GetUtils.isPhoneNumber(val)) {
        return "رقم الهاتف غير صالح";
      }
    }
  }
}
