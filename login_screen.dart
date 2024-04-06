
import 'package:ezitech/user_panel/user_panel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
TextEditingController emailController=TextEditingController();
TextEditingController passwordController= TextEditingController();

void loginUser() async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  String savedEmail= sp.getString('semail').toString();
  String savedPassword= sp.getString('spassword').toString();

  if(savedEmail==emailController.text && savedPassword==passwordController.text){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserPanel()));

  }
  else{
    return ;
  }


}

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Scaffold  (
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("Login page",
          style:TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ) ,),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email_outlined,
                color: Colors.teal,),

              ),
            ),
            SizedBox(
              height: 15,
            ),
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
              height: 35,
            ),
            ElevatedButton(onPressed: loginUser,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.teal)
                ),
                child:  Center(child: Text("Login"
                ,style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),)))
          ],
        ),
      ),
    );
  }
}
