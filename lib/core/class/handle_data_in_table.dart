class handleDataInTable {
  String handelAttendanceTypeData(ind) {
    switch (ind) {
      case 0:
        return "مشترك";
      case 1:
        return "جلسه";
      case 2:
        return "دعوه";
      case 3:
        return "خدمة";
      default:
        return "";
    }
  }

  String handleGenderData(ind) {
    if (ind == 0) {
      return "ذكر";
    } else if (ind == 1) {
      return "أنثى";
    } else {
      return "";
    }
  }

  String handleSubscriptionsType(ind) {
    if (ind == 0) {
      return "اشتراك";
    } else if (ind == 1) {
      return "حصه";
    } else {
      return "";
    }
  }

  String handleSafeType(ind) {
    switch (ind) {
      case 0:
        return "جلسه";
      case 1:
        return "تجديد";
      case 2:
        return "مصروفات";
      case 3:
        return "سحب";
      case 4:
        return "إيداع";
      case 5:
        return "تجميد";
      default:
        return "";
    }
  }
}
