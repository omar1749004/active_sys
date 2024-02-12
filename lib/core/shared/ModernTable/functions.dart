import 'package:active_system/core/shared/global_variable.dart';

void setValueInGlobalVariable(String nameOfVar,int ind) {
     switch (nameOfVar) {
      case "attendance":
        GlobalVariable.attendance = ind.toString();
        break;
      case "home":
        GlobalVariable.home = ind.toString();
        break;
      case "manageCost":
        GlobalVariable.manageCost = ind.toString();
        break;
      case "managePlayers":
        GlobalVariable.managePlayers = ind.toString();
        break;
      case "manageSubscription":
        GlobalVariable.manageSubscription = ind.toString();
        break;
      case "playersProfile":
        GlobalVariable.playersProfile = ind.toString();
        break;
      case "renewSubscription":
        GlobalVariable.renewSubscription = ind.toString();
        break;
      case "safe":
        GlobalVariable.safe = ind.toString();
        break;
      case "trainers":
        GlobalVariable.trainers = ind.toString();
        break;
      case "treasuryRegister":
        GlobalVariable.treasuryRegister = ind.toString();
        break;
      case "users":
        GlobalVariable.users = ind.toString();
        break;
      default:
    }
  }