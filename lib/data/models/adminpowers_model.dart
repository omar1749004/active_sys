class AdminPower {
  final int adminId;
  final int powerId;

  AdminPower({required this.adminId, required this.powerId});

  factory AdminPower.fromJson(Map<String, dynamic> json) {
    return AdminPower(
      adminId: json['adminSysPowrs_admin_id'],
      powerId: json['adminSysPowrs_powrs_id'],
    );
  }
}
