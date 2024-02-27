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
      return "Man";
    } else if (ind == 1) {
      return "Woman";
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
