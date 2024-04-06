import 'package:date_formatter/date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AttendanceEditing extends StatefulWidget {
  const AttendanceEditing({super.key});

  @override
  State<AttendanceEditing> createState() => _AttendanceEditingState();
}

class _AttendanceEditingState extends State<AttendanceEditing> {
  List<String> attendanceRecords=[];
  late DateTime selectedDate;
  @override
  void initState(){
super.initState();
selectedDate=DateTime.now();
fetchAttendanceRecord();

  }
  Future<void> fetchAttendanceRecord() async {
    SharedPreferences sp= await SharedPreferences.getInstance();
    List <String> ? records= sp.getStringList('attendanceRecord');
    if(records != null){
setState(() {
  attendanceRecords=records;


});
    }
  }

  void addAttendanceRecord(String newRecord, DateTime date) async {
    SharedPreferences sp= await SharedPreferences.getInstance();
    List<String> ? records= sp.getStringList('attendanceRecord');

    if(records != null){
      String formattedDate=DateFormatter.formatDateTime(dateTime: date,
          outputFormat: "dd/MM/yyyy");
      String attendanceRecord= '${formattedDate} : ${newRecord}';

      records.add(attendanceRecord);

      sp.setStringList('attendanceRecord', records);

      fetchAttendanceRecord();
    }
  }

  void deleteAttendanceRecord(String recordToDelete)async
  {
    SharedPreferences sp=await SharedPreferences.getInstance();
    List<String> ? records=sp.getStringList('attendanceRecord');
    if(records !=null){
      records.remove(recordToDelete);
      sp.setStringList('attendanceRecord', records);
      fetchAttendanceRecord();
    }
  }

  void pickDate(BuildContext context)async {
      DateTime ? picked= await showDatePicker(context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025)) ;

    if(picked !=null && picked !=selectedDate){
      setState(() {
        selectedDate = picked ;
        addAttendanceRecord("new attendance",  selectedDate);
      });
    }

  }


  Widget build(BuildContext context) {
    return  Scaffold  (
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Student Attendance",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
        ),
      ),
      body: ListView.builder(
          itemCount: attendanceRecords.length,
          itemBuilder: (context ,index){
        String record=attendanceRecords[index];
            return ListTile(
             title: Text(record),
              trailing: IconButton(onPressed: ( ){
                deleteAttendanceRecord(record);
              },
                  icon: Icon(Icons.delete,color: Colors.teal,)),
            );
      }),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
           pickDate(context);
          // addAttendanceRecord('new attendance record',selectedDate!);
        },
        backgroundColor: Colors.teal,
        child: Icon(Icons.add,color: Colors.white,),
      ),

    );
  }
}
