class UserModel {
  int? usersId;
  String? usersName;
  String? usersPhone;
  String? usersAddress;
  String? usersNote;
  String? usersImage;
  DateTime? usersDate;
  int? usersGender;
  int? usersApprove;
  DateTime? usersCreate;
  int? usersVerifyCode;
  String? usersEmail;
  String? usersPassword;
  int? usersCaptiantId;
  int? usersType;
  int? usersBranch;

  UserModel({
     this.usersId,
     this.usersName,
     this.usersPhone,
     this.usersAddress,
     this.usersNote,
     this.usersImage,
     this.usersDate,
     this.usersGender,
     this.usersApprove,
     this.usersCreate,
     this.usersVerifyCode,
     this.usersEmail,
     this.usersPassword,
     this.usersCaptiantId,
     this.usersType,
     this.usersBranch,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      usersId: json['users_id'],
      usersName: json['users_name'],
      usersPhone: json['users_phone'],
      usersAddress: json['users_adress'],
      usersNote: json['users_note'],
      usersImage: json['users_image'],
      usersDate: DateTime.tryParse(json['users_date'] ?? ''),
      usersGender: json['users_gender'],
      usersApprove: json['users_approve'],
      usersCreate: DateTime.tryParse(json['users_create'] ?? ''),
      usersVerifyCode: json['users_verfycode'],
      usersEmail: json['users_email'],
      usersPassword: json['users_pass'],
      usersCaptiantId: json['users_captiantid'],
      usersType: json['users_type'],
      usersBranch: json['users_branch'],
    );
  }
}
