class SafeModel {
  int? safeId;
  String? safeIncoming;
  String? safeOutgoing;
  String ?safeDesc;
  DateTime ?safeDate;
  int? safeType;
  int? safeAdminId;
  String? adminSysName;
  String? remaining;
  String? totalIncoming;
  String? totalOutgoing;

  SafeModel({
    required this.safeId,
    required this.safeIncoming,
    required this.safeOutgoing,
    required this.safeDesc,
    required this.safeDate,
    required this.safeType,
    required this.safeAdminId,
    required this.adminSysName,
    required this.remaining,
    required this.totalIncoming,
    required this.totalOutgoing,
  });

  factory SafeModel.fromJson(Map<String, dynamic> json) {
    return SafeModel(
      safeId: json['safe_id'],
      safeIncoming: json['safe_Incoming'],
      safeOutgoing: json['safe_Outgoing'],
      safeDesc: json['safe_desc'],
      safeDate: DateTime.parse(json['safe_date']),
      safeType: json['safe_type'],
      safeAdminId: json['safe_adminId'],
      adminSysName: json['adminSys_name'],
      remaining: json['remaining'],
      totalIncoming: json['totalincoming'],
      totalOutgoing: json['totalOutgioing'],
    );
  }
}
