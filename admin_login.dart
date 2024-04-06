import 'package:ezitech/admin_panel/admin_dashboard.dart';
import 'package:flutter/material.dart';
class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold (
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Admin Login",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter role (user or admin)"
                    ,prefix: Icon(Icons.person,color: Colors.teal,)
              ),
            ),
SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter email"
                  ,prefix: Icon(Icons.email_outlined,color: Colors.teal,)
              ),
            ),

            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(
                  hintText: "Enter Password"
                  ,prefix: Icon(Icons.lock_open,color: Colors.teal,)
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: ( ){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminDashboard()));
            },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal)
                ),
                child:  Text("Login",style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400
                ),))

          ],
        ),
      ),
    );
  }
}
