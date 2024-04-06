import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LeaveRequest extends StatefulWidget {
  const LeaveRequest({super.key});

  @override
  State<LeaveRequest> createState() => _LeaveRequestState();
}

class _LeaveRequestState extends State<LeaveRequest> {
  TextEditingController leaveController= TextEditingController();
 



  void sendRequest() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String leaveReason=leaveController.text;
    sp.setString('leaveRequest',  leaveReason);
    if (leaveReason.isNotEmpty)
    show(context);
  }
  void initState(){
    super.initState();
    sendRequest();
  }

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        title: Text("Leave Request",
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: leaveController,
              decoration: InputDecoration(
                hintText: "Reason",

              ),
            ),
            SizedBox(height: 15,),

            ElevatedButton(onPressed: sendRequest,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal)
                ),
                child: Text("submit",
                style: TextStyle(color: Colors.white,
                fontWeight: FontWeight.w400),) )
          ],
        ),
      ),
    );
  }
}
void show(BuildContext context){
  showDialog(context: context,
      builder:  (BuildContext context){
    return
    AlertDialog(
      title: Text("Leave Request"),
      content: Text("your leave request had sent to admin"),
      actions: [
        TextButton(onPressed: ( ){
          Navigator.pop(context);
        }, child:  Text("ok"))
      ],
    );
      });
}