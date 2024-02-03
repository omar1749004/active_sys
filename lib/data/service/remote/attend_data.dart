import 'package:active_system/core/class/api.dart';
import 'package:active_system/link_api.dart';

class AttendData{
 AttendData();

    addSub(Map data)async{
    var res =await Api().post(uri: linkAttendanceAddSub, body: data,
    );
    return res;
  }
    addInvitation(Map data)async{
    var res =await Api().post(uri: linkAttendanceAddInvitation, body: data,
    );
    return res;
  }
   addService(Map data)async{
    var res =await Api().post(uri: linkAttendanceAddService, body: data,
    );
    return res;
  }
   addSessions(Map data)async{
    var res =await Api().post(uri: linkAttendanceAddSesstion, body: data,
    );
    return res;
  }
   dailyView(Map data )async{
     var res =await Api().post(uri: linkAttendanceViewDay, body: data);
    return res;
    
  }
   delete(Map data)async{
    var res =await Api().post(uri: linkAttendanceDelete, body: data);
    return res;
  }
   search(Map data)async{
    var res =await Api().post(uri: linkAttendanceSearch, body: data);
    return res;
  }
  dateSearch(Map data)async{
    var res =await Api().post(uri: linkAttendanceDateSearch, body: data);
    return res;
  }

  usersSearch(Map data)async{
    var res =await Api().post(uri: linkAttendanceUsersSearch, body: data);
    return res;
  }
}