class FreezeModel {
  int freezeId;
  DateTime freezeStart;
  DateTime freezeEnd;
  int freezeDay;
  String freezeNote;
  int freezeUserId;
  int freezeRenewalId;

  FreezeModel({
    required this.freezeId,
    required this.freezeStart,
    required this.freezeEnd,
    required this.freezeDay,
    required this.freezeNote,
    required this.freezeUserId,
    required this.freezeRenewalId,
  });

  factory FreezeModel.fromJson(Map<String, dynamic> json) {
    return FreezeModel(
      freezeId: json['freeze_id'],
      freezeStart: DateTime.parse(json['freeze_start']),
      freezeEnd: DateTime.parse(json['freeze_end']),
      freezeDay: json['freeze_day'],
      freezeNote: json['freeze_note'],
      freezeUserId: json['freeze_userid'],
      freezeRenewalId: json['freeze_renewal_id'],
    );
  }
}
