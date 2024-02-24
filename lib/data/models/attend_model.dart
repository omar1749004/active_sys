class AttendModel {
  int? attendanceId;
  DateTime? attendanceDay;
  String? attendanceStart;
  String? attendanceEnd;
  int? attendanceBarcodeId;
  int? attendanceRenewalid;
  int? barcode;
  int attendanceType;
  String? usersName;
  String? usersPhone;
  String? usersNote;
  String? usersImage;
  DateTime? renewalEnd;
  DateTime? brithDay;
  String? adminSysName;
  String? subscriptionsName;
  int? subscriptionsSessionsNumber;
  String? renewAmountOwed;
  int? safeId;
  int? renewalSessionAttend;
  int? isOwed;
  int? isClose;

  AttendModel({
    required this.attendanceId,
    required this.attendanceDay,
    required this.attendanceStart,
    required this.attendanceEnd,
    this.attendanceBarcodeId,
    required this.barcode,
    required this.attendanceType,
    this.attendanceRenewalid,
    this.usersName,
    this.renewalEnd,
    this.brithDay,
    this.usersPhone,
    this.usersNote,
    this.usersImage,
    this.adminSysName,
    this.subscriptionsName,
    this.subscriptionsSessionsNumber,
    this.renewAmountOwed,
    this.safeId,
    this.renewalSessionAttend,
    this.isOwed, //owes money
    this.isClose, //close to renew
  });

  factory AttendModel.fromJson(Map<String, dynamic> json) {
    return AttendModel(
      attendanceId: json['attendance_id'],
      attendanceDay: DateTime.parse(json['attendance_day']),
      attendanceStart: json['attendance_start'],
      attendanceEnd: json['attendance_end'],
      attendanceBarcodeId: json['attendance_barcodeId'],
      attendanceRenewalid: json["attendance_renewalid"],
      barcode: json['barcode'],
      attendanceType: json['attendance_type'],
      usersName: json['users_name'],
      usersPhone: json['users_phone'],
      renewalEnd: DateTime.tryParse(json['renewal_end'] ?? ''),
      brithDay: DateTime.tryParse(json['users_date'] ?? ''),
      usersNote: json['users_note'],
      usersImage: json['users_image'],
      adminSysName: json['adminSys_name'],
      subscriptionsName: json['subscriptions_name'],
      subscriptionsSessionsNumber: json['subscriptions_sessions_number'],
      renewAmountOwed: json['renew_amount_owed'],
      renewalSessionAttend: json['renewal_session_attend'],
      safeId: json["attendance_safeId"],
      isOwed: json['isowed'],
      isClose: json['isclose'],
    );
  }
}
