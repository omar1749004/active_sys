class SubscriptionModel {
  int subscriptionsId;
  String subscriptionsName;
  int subscriptionsType;
  double subscriptionsPrice;
  int subscriptionsDay;
  int subscriptionsSpecialization;
  int subscriptionsSessionsNumber;
  int subscriptionsFrezzDay;
  int subscriptionsFrezzNumber;
  int subscriptionsMaxFrezzDay;
  int subscriptionsInvitationsNumber;
  int subscriptionsMaxInvitation;
  int subscriptionsServiceNumber;
  int subscriptionsMaxService;
  int subscriptionsAllowedNumber;
  String subscriptionsNotes;

  SubscriptionModel({
    required this.subscriptionsId,
    required this.subscriptionsName,
    required this.subscriptionsType,
    required this.subscriptionsPrice,
    required this.subscriptionsDay,
    required this.subscriptionsSpecialization,
    required this.subscriptionsSessionsNumber,
    required this.subscriptionsFrezzDay,
    required this.subscriptionsFrezzNumber,
    required this.subscriptionsMaxFrezzDay,
    required this.subscriptionsInvitationsNumber,
    required this.subscriptionsMaxInvitation,
    required this.subscriptionsServiceNumber,
    required this.subscriptionsMaxService,
    required this.subscriptionsAllowedNumber,
    required this.subscriptionsNotes,
  });

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) {
    return SubscriptionModel(
      subscriptionsId: json['subscriptions_id'],
      subscriptionsName: json['subscriptions_name'],
      subscriptionsType: json['subscriptions_type'],
      subscriptionsPrice: double.parse(json['subscriptions_price']) ,
      subscriptionsDay: json['subscriptions_day'],
      subscriptionsSpecialization: json['subscriptions_specialization'],
      subscriptionsSessionsNumber: json['subscriptions_sessions_number'],
      subscriptionsFrezzDay: json['subscriptions_frezz_day'],
      subscriptionsFrezzNumber: json['subscriptions_frezz_number'],
      subscriptionsMaxFrezzDay: json['subscriptions_max_frezz_day'],
      subscriptionsInvitationsNumber: json['subscriptions_invitations_number'],
      subscriptionsMaxInvitation: json['subscriptions_max_invitation'],
      subscriptionsServiceNumber: json['subscriptions_service_number'],
      subscriptionsMaxService: json['subscriptions_max_service'],
      subscriptionsAllowedNumber: json['subscriptions_allowed_number'],
      subscriptionsNotes: json['subscriptions_notes'],
    );
  }
}
