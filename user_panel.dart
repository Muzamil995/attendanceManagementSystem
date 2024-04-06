


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'attendence_record.dart';
import 'image_change.dart';
import 'leave_request.dart';
class UserPanel extends StatefulWidget {
  const UserPanel({super.key});

  @override
  State<UserPanel> createState() => _UserPanelState();
}

class _UserPanelState extends State<UserPanel> {
  // Attendence Function
  bool isPresent=false;
  void markAttendence() async{
    SharedPreferences prefs= await  SharedPreferences.getInstance();
    String lastDate= prefs.getString("lastDate") ?? '';

    String  today=DateTime.now().toString().split(' ')[0];
    String attendenceStatus= isPresent? 'present':'absent';
    List<String>? attendanceRecords =prefs.getStringList('attendanceRecord');
    if(attendanceRecords==null){
      attendanceRecords=[];
    }
    String attendanceRecord='$today :$attendenceStatus';
    attendanceRecords.add(attendanceRecord);
    prefs.setStringList('attendanceRecord',  attendanceRecords);


    if(today!=lastDate){
      await prefs.setString("lastDate", today);
      markAttendence();
    }
    else{
      _showDialog(context);

    }

    setState(() {
      isPresent= !isPresent;
    });
  }
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("User Panel",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Card(
        child: Column(
              mainAxisAlignment: MainAxisAlignment. center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            ImageChange(),
            SizedBox(
              height: 20,
            ),

            ElevatedButton(
                onPressed: markAttendence,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.teal)
          ),
                child:  Text("Mark Attendence" ,style:
                  TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300
                  )
               ,)),

            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences sp= await SharedPreferences.getInstance();
                  List<String> ? attendanceRecords= sp.getStringList('attendanceRecords');

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>AttendanceRecord(attendanceRecords: attendanceRecords ??[],)));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal)
                ),
                child:  Text("View Attendance",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),)),

            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:
                  (context)=>LeaveRequest()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal)
                ),
                child:  Text("Send leave request",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),)),


          ],
        ),
      ),
    );
  }
}
void _showDialog(BuildContext context){
  showDialog
    (context: context ,
      builder: (BuildContext context){
    return AlertDialog(
      title: Text("Already Marked"),
      content: Text("Attendence is marked"),
      actions: [
        TextButton(onPressed: ( ){
          Navigator.of(context).pop();
        }, child:Text("OK"))
      ],
    );
  });
}