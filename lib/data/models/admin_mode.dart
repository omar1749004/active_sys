class AdminSys {
  int adminSysId;
  String adminSysName;
  int adminSysType;
  String adminSysPassword;
  String? adminSysNote;

  AdminSys({
    required this.adminSysId,
    required this.adminSysName,
    required this.adminSysType,
    required this.adminSysPassword,
    required this.adminSysNote,
  });

  factory AdminSys.fromJson(Map<String, dynamic> json) {
    return AdminSys(
      adminSysId: json['adminSys_id'],
      adminSysName: json['adminSys_name'],
      adminSysType: json['adminSys_type'],
      adminSysPassword: json['adminSys_password'],
      adminSysNote: json['adminSys_note'],
    );
  }
}
