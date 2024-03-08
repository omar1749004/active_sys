import 'package:active_system/core/shared/global_variable.dart';

void setValueInGlobalVariable(String nameOfVar, int ind) {
  switch (nameOfVar) {
    case "attendance":
      GlobalVariable.attendance = ind;
      break;
    case "home":
      GlobalVariable.home = ind;
      break;
    case "manageCost":
      GlobalVariable.manageCost = ind;
      break;
    case "managePlayers":
      GlobalVariable.managePlayers = ind;
      break;
    case "manageSubscription":
      GlobalVariable.manageSubscription = ind;
      break;
    case "playersProfile":
      GlobalVariable.playersProfile = ind;
      break;
    case "renewSubscription":
      GlobalVariable.renewSubscription = ind;
      break;
    case "safe":
      GlobalVariable.safe = ind;
      break;
    case "trainers":
      GlobalVariable.trainers = ind;
      break;
    case "treasuryRegister":
      GlobalVariable.treasuryRegister = ind;
      break;
    case "users":
      GlobalVariable.users = ind;
      break;
    case "freeze":
      GlobalVariable.freeze = ind;
      break;
    case "trainersRatio":
      GlobalVariable.trainersRatio = ind;
      break;
    default:
  }
}
