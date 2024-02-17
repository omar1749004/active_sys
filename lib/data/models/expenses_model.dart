class ExpensesModel {
  int ?expensesId;
  DateTime? expensesDate;
  String ?expensesReason;
  String ?note;
  double ?expensesValue;
  int ?expensesAdminId;

  ExpensesModel({
    required this.expensesId,
    required this.expensesDate,
    required this.expensesReason,
    required this.note,
    required this.expensesValue,
    required this.expensesAdminId,
  });

  factory ExpensesModel.fromJson(Map<String, dynamic> json) {
    return ExpensesModel(
      expensesId: json['expenses_id'],
      expensesDate: DateTime.parse(json['expenses_date']),
      expensesReason: json['expenses_reason'],
      expensesValue: json['expenses_value'].toDouble(),
      expensesAdminId: json['expenses_admin_id'],
      note: json["expenses_note"]
    );
  }
}
