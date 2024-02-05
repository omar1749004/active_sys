import 'package:intl/intl.dart';

class AttendModel {
  int attendanceId;
  DateTime attendanceDay;
  // String attendanceStart;
  // String attendanceEnd;
  // int? attendanceBarcodeId;
  // int barcode;
  // int attendanceType;
  // String? usersName;
  // String? usersPhone;
  // String? usersNote;
  // String? usersImage;
  // String? adminSysName;
  // String? subscriptionsName;
  // int? subscriptionsSessionsNumber;
  // double renewAmountOwed;
  // int renewalSessionAttend;
  // int? isOwed;
  // int? isClose;

  AttendModel({
    required this.attendanceId,
    required this.attendanceDay,
    // required this.attendanceStart,
    // required this.attendanceEnd,
    // this.attendanceBarcodeId,
    // required this.barcode,
    // required this.attendanceType,
    // this.usersName,
    // this.usersPhone,
    // this.usersNote,
    // this.usersImage,
    // this.adminSysName,
    // this.subscriptionsName,
    // this.subscriptionsSessionsNumber,
    // required this.renewAmountOwed,
    // required this.renewalSessionAttend,
    // this.isOwed,
    // this.isClose,
  });

  factory AttendModel.fromJson(Map<String, dynamic> json) {
    return AttendModel(
      attendanceId: json['attendance_id'],
      attendanceDay: DateTime.parse(json['attendance_day']),
      // attendanceStart: json['attendance_start'],
      // attendanceEnd: json['attendance_end'],
      // attendanceBarcodeId: json['attendance_barcodeId'],
      // barcode: json['barcode'],
      // attendanceType: json['attendance_type'],
      // usersName: json['users_name'],
      // usersPhone: json['users_phone'],
      // usersNote: json['users_note'],
      // usersImage: json['users_image'],
      // adminSysName: json['adminSys_name'],
      // subscriptionsName: json['subscriptions_name'],
      // subscriptionsSessionsNumber: json['subscriptions_sessions_number'],
      // renewAmountOwed: json['renew_amount_owed'],
      // renewalSessionAttend: json['renewal_session_attend'],
      // isOwed: json['isowed'],
      // isClose: json['isclose'],
    );
  }
}
