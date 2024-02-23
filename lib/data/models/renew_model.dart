class RenewModel {
  String? usersName;
  String? captainNamme;
  int? usersId;
  String? usersPhone;
  int? usersCaptiantid;
  DateTime? usersCreate;
  int? renewalId;
  String? renewalNote;
  int? barcodeId;
  int? barcode;
  DateTime? renewalCreate;
  int? renewalAdminId;
  DateTime? renewalStart;
  DateTime? renewalEnd;
  int? renewalSessionAttend;
  double? renewAmountOwed; 
  double? renewalAmount;
  String? subscriptionsName ;
int? totalPlayer;


  RenewModel({
    required this.usersName,
    required this.captainNamme,
    required this.usersId,
    required this.usersPhone,
    required this.usersCaptiantid,
    required this.usersCreate,
    required this.renewalId,
    required this.renewalNote,
    required this.barcodeId,
    required this.barcode,
    required this.renewalCreate,
    this.subscriptionsName,
    required this.renewalAdminId,
    required this.renewalStart,
    required this.renewalEnd,
    required this.renewalSessionAttend,
    required this.renewAmountOwed,
    required this.renewalAmount,
    required this.totalPlayer,
  });

  factory RenewModel.fromJson(Map<String, dynamic> json) {
    return RenewModel(
      usersName: json['user_name'],
      captainNamme: json['captain_name'],
      usersId: json['users_id'],
      usersPhone: json['users_phone'],
      usersCaptiantid: json['users_captiantid'],
      usersCreate: DateTime.parse(json['users_create']),
      renewalId: json['renewal_id'],
      renewalNote: json['renewal_note'],
      barcodeId: json['barcode_id'],
      barcode: json['barcode'],
      subscriptionsName: json["subscriptions_name"],
      renewalCreate: DateTime.parse(json['renewal_create']),
      renewalAdminId: json['renewal_adminId'],
      renewalStart: DateTime.tryParse(json['renewal_start'] ?? ""),
      renewalEnd: DateTime.tryParse(json['renewal_end'] ?? ""),
      renewalSessionAttend: json['renewal_session_attend'],
      renewAmountOwed: double.parse(json['renew_amount_owed']), 
      renewalAmount: double.parse(json['renewal_amount']),
      totalPlayer: json['totalPlayer'],

    );
  }
}
