import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StudentAttendenceRecord extends StatefulWidget {
  const StudentAttendenceRecord({Key? key});

  @override
  State<StudentAttendenceRecord> createState() => _StudentAttendenceRecordState();
}

class _StudentAttendenceRecordState extends State<StudentAttendenceRecord> {

  String? studentEmail;
  String? studentPassword;

  @override
  void initState() {
    super.initState();
    fetchDataKeys(); // Call fetchDataKeys when the widget is initialized
  }

  void fetchDataKeys() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      studentEmail = sp.getString('semail') ?? ''; // Fetch student email
      studentPassword = sp.getString('spassword') ?? ''; // Fetch student password
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Data'), // Change the title of the app bar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Student Email: $studentEmail'), // Display student email
            Text('Student Password: $studentPassword'), // Display student password
          ],
        ),
      ),
    );
  }
}
