import 'package:ezitech/admin_panel/attendence_editing.dart';
import 'package:ezitech/admin_panel/leave_approval.dart';
import 'package:ezitech/admin_panel/student_attendence_record.dart';
import 'package:flutter/material.dart';
class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Admin DashBoard",
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24),),
      ),
      body:  Center(
        child: Column(

          children: [

            ElevatedButton(onPressed: ( ){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> StudentAttendenceRecord()));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.teal)
            ),
                child:  Text("View Records",
                style: TextStyle(
                  color: Colors.white
                ),)),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: ( ){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AttendanceEditing()));
            },
                style: ButtonStyle
                  (
                  backgroundColor: MaterialStateProperty.all(Colors.teal)
                ),
                child: Text(
                  "Modify Student Attendence",style: TextStyle(
                  color: Colors.white
                ),
                )),

            SizedBox(height: 15,),
            ElevatedButton(onPressed: ( ){},
                style: ButtonStyle
                  (
                    backgroundColor: MaterialStateProperty.all(Colors.teal)
                ),
                child: Text(
                  "Create Report",style: TextStyle(
                    color: Colors.white
                ),
                )),

            SizedBox(height: 15,),
            ElevatedButton(onPressed: ( ){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LeaveApproval()));
            },
                style: ButtonStyle
                  (
                    backgroundColor: MaterialStateProperty.all(Colors.teal)
                ),
                child: Text(
                  "Approve Leave Request",style: TextStyle(
                    color: Colors.white
                ),
                )),

            SizedBox(height: 15,),
            ElevatedButton(onPressed: ( ){},
                style: ButtonStyle
                  (
                    backgroundColor: MaterialStateProperty.all(Colors.teal)
                ),
                child: Text(
                  "Grades",style: TextStyle(
                    color: Colors.white
                ),
                )),
          ],
        ),
      )
    );
  }
}
