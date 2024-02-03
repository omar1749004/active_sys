class AttendModel {
  String usersName;
  int usersId;
  String usersPhone;
  DateTime usersCreate;
  int renewalId;
  String renewalNote;
  int barcodeId;
  int barcode;
  DateTime renewalCreate;
  int renewalAdminId;
  DateTime renewalStart;
  DateTime renewalEnd;
  int renewalSessionAttend;
  int subscriptionsId;
  String subscriptionsName;
  double subscriptionsPrice;
  int subscriptionsDay;
  int sessionsNumber;
  int subscriptionsSpecialization;
  int subscriptionsInvitationsNumber;
  int subscriptionsMaxInvitation;
  int subscriptionsServiceNumber;
  int subscriptionsMaxService;

  AttendModel({
    required this.usersName,
    required this.usersId,
    required this.usersPhone,
    required this.usersCreate,
    required this.renewalId,
    required this.renewalNote,
    required this.barcodeId,
    required this.barcode,
    required this.renewalCreate,
    required this.renewalAdminId,
    required this.renewalStart,
    required this.renewalEnd,
    required this.renewalSessionAttend,
    required this.subscriptionsId,
    required this.subscriptionsName,
    required this.subscriptionsPrice,
    required this.subscriptionsDay,
    required this.sessionsNumber,
    required this.subscriptionsSpecialization,
    required this.subscriptionsInvitationsNumber,
    required this.subscriptionsMaxInvitation,
    required this.subscriptionsServiceNumber,
    required this.subscriptionsMaxService,
  });

  factory AttendModel.fromJson(Map<String, dynamic> json) {
    return AttendModel(
      usersName: json['users_name'],
      usersId: json['users_id'],
      usersPhone: json['users_phone'],
      usersCreate: DateTime.parse(json['users_create']),
      renewalId: json['renewal_id'],
      renewalNote: json['renewal_note'],
      barcodeId: json['barcode_id'],
      barcode: json['barcode'],
      renewalCreate: DateTime.parse(json['renewal_create']),
      renewalAdminId: json['renewal_adminId'],
      renewalStart: DateTime.parse(json['renewal_start']),
      renewalEnd: DateTime.parse(json['renewal_end']),
      renewalSessionAttend: json['renewal_session_attend'],
      subscriptionsId: json['subscriptions_id'],
      subscriptionsName: json['subscriptions_name'],
      subscriptionsPrice: json['subscriptions_price'].toDouble(),
      subscriptionsDay: json['subscriptions_day'],
      sessionsNumber: json['sessions_number'],
      subscriptionsSpecialization: json['subscriptions_specialization'],
      subscriptionsInvitationsNumber: json['subscriptions_invitations_number'],
      subscriptionsMaxInvitation: json['subscriptions_max_invitation'],
      subscriptionsServiceNumber: json['subscriptions_service_number'],
      subscriptionsMaxService: json['subscriptions_max_service'],
    );
  }
}
