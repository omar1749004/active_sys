class UserModel {
  String? usersName;
  String? captainName;
  int? usersId;
  String? usersNote;
  String? usersImage;
  String? usersDate;
  String? usersPhone;
  String? usersCreate;
  int? barcodeId;
  int? barcode;
  String? renewAmountOwed;
  String? renewalStart;
  String? renewalEnd;
  String? renewalNote;
  int? renewalSessionAttend;
  String? usersAddress; // Added usersAddress field
  String? subscriptionsName; // Added subscriptionsName field
  int? renewalId;

  UserModel({
    this.usersName,
    this.captainName,
    this.usersId,
    this.usersNote,
    this.usersImage,
    this.usersDate,
    this.usersPhone,
    this.usersCreate,
    this.barcodeId,
    this.barcode,
    this.renewAmountOwed,
    this.renewalStart,
    this.renewalEnd,
    this.renewalNote,
    this.renewalSessionAttend,
    this.usersAddress,
    this.subscriptionsName,
    this.renewalId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      usersName: json['users_name'],
      captainName: json['captain_name'],
      usersId: json['users_id'],
      usersNote: json['users_note'],
      usersImage: json['users_image'],
      usersDate: json['users_date'],
      usersPhone: json['users_phone'],
      usersCreate: json['users_create'],
      barcodeId: json['barcode_id'],
      barcode: json['barcode'],
      renewAmountOwed: json['renew_amount_owed'],
      renewalStart: json['renewal_start'],
      renewalEnd: json['renewal_end'],
      renewalNote: json['renewal_note'],
      renewalSessionAttend: json['renewal_session_attend'],
      usersAddress: json['users_address'], // Mapping to usersAddress field
      subscriptionsName: json['subscriptions_name'], // Mapping to subscriptionsName field
      renewalId: json['renewal_id'],
    );
  }
}


class TrainerNumberModel {
  final int userid;
  final String phone;

  TrainerNumberModel({required this.userid, required this.phone});

  factory TrainerNumberModel.fromJson(Map<String, dynamic> json) {
    return TrainerNumberModel(
      userid: json['users_id'],
      phone: json['users_phone'],
    );
  }
}

