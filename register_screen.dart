
import 'package:ezitech/admin_panel/admin_login.dart';
import 'package:ezitech/user_panel/user_panel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController= TextEditingController();

  void registerUser() async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    sp.setString('semail', emailController.text);
    sp.setString('spassword', passwordController.text);
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>UserPanel()));



  }
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("Ezitech Org",
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text("Welcome !",style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.w700,
                color: Colors.black),),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.07,
            ),
            TextFormField(
controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter Email",
                prefixIcon: Icon(Icons.email_outlined,
                  color: Colors.teal,),

              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock_open,
                color: Colors.teal,)
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed:  registerUser,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal)
                ),
                child:  Center(child: Text("Register",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,

                ),))),
          SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Already have an account !"),

              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
              }, child:  Text("Login "))
            ],
          ),
            SizedBox(
              height:15
            ),
            TextButton(
              onPressed: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context)=>
                AdminLogin()));
              },
              child: Text("Login as Admin",
              style: TextStyle(
                color: Colors.teal,
                fontWeight: FontWeight.bold
              ),),
            )
          ],
        ),
      ),
    );
  }
}
