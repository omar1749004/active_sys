class PercentModel {
  String usersName;
  String captainName;
  String renewalStart;
  String renewalEnd;
  String subscriptionsName;
  String subscriptionsPrice;
  String percentageTrainerCreate;
  int percentageTrainerTrainerId;
  int percentageTrainerPercent;
  String percentageTrainerAmount;

  PercentModel({
    required this.usersName,
    required this.captainName,
    required this.renewalStart,
    required this.renewalEnd,
    required this.subscriptionsName,
    required this.subscriptionsPrice,
    required this.percentageTrainerCreate,
    required this.percentageTrainerTrainerId,
    required this.percentageTrainerPercent,
    required this.percentageTrainerAmount,
  });

  factory PercentModel.fromJson(Map<String, dynamic> json) {
    return PercentModel(
      usersName: json['users_name'],
      captainName: json['captain_name'],
      renewalStart: json['renewal_start'],
      renewalEnd: json['renewal_end'],
      subscriptionsName: json['subscriptions_name'],
      subscriptionsPrice: json['subscriptions_price'],
      percentageTrainerCreate: json['percentagetrainer_craete'],
      percentageTrainerTrainerId: json['percentagetrainer_trainerid'],
      percentageTrainerPercent: json['percentagetrainer_percent'],
      percentageTrainerAmount: json['percentagetrainer_amout'],
    );
  }
}
