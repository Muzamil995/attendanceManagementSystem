import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceRecord extends StatefulWidget {
      List<String> attendanceRecords;
    AttendanceRecord({Key? key,required this.attendanceRecords}) : super(key: key);

  @override
  State<AttendanceRecord> createState() => _AttendanceRecordState();
}

class _AttendanceRecordState extends State<AttendanceRecord> {
  // List<String> attendanceRecord = [];

  @override
  void initState() {
    super.initState();
    loadAttendanceRecord();
  }

  Future<void> loadAttendanceRecord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? record = prefs.getStringList('attendanceRecord');
    if (record != null) {
      setState(() {
        widget.attendanceRecords = record.reversed.toList(); // Reverse the list to show recent records first
      });
    } else {
      print('No attendance record found.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Attendance Record",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "Attendance Records ",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:widget.attendanceRecords.length,
              itemBuilder: (context, index) {
                return Center(
                  child: ListTile(
                    title: Text('Attendance : ${widget.attendanceRecords[index]}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
