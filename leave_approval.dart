import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LeaveApproval extends StatefulWidget {
  const LeaveApproval({super.key});

  @override
  State<LeaveApproval> createState() => _LeaveApprovalState();
}

class _LeaveApprovalState extends State<LeaveApproval> {
  void approveLeaveRequest(BuildContext context) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    String leaveRequest= sp.getString('leaveRequest') ?? '';
    if(leaveRequest.isNotEmpty){
      await sp.remove('leaveRequest');
      setState(() {

      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Leave Request Approved")));
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("NO leave Request yet")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return    Scaffold
      (
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Leave Request Approval",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center
        ,
        children: [
          ElevatedButton(onPressed: ( ){
           approveLeaveRequest(context);
          },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.teal)
              ),
              child: Text("Approve Leave Request",
              style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
