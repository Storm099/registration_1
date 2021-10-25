import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:registration_1/model/user_model.dart';
import 'package:registration_1/pages/home_page.dart';
import 'package:registration_1/services/hive_service.dart';

class SignUp extends StatefulWidget {
  static const String id = "sign_up";

  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var _username = TextEditingController();
  var _email = TextEditingController();
  var _phone = TextEditingController();
  var _password = TextEditingController();

  void _doSignUp(){
    String usn = _username.text.toString();
    String eml = _email.text.toString();
    String phn = _phone.text.toString();
    String pw = _password.text.toString();

    User user = User(
      username: usn,
      email: eml,
      phone: phn,
      password: pw
    );

    HiveDb().storeData(user);
  }

  void showToast(){
    Fluttertoast.showToast(
        msg: "Successfully registered",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.grey,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 29, 58),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              const Text("Create\nAccount",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,letterSpacing: 1.5,fontSize: 22),),
              const SizedBox(height: 60,),

               TextField(
                controller: _username,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person,color: Colors.white,),
                  hintText: "User Name",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 20,),
               TextField(
                 controller: _email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined,color: Colors.white,),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 20,),
               TextField(
                 controller: _phone,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone,color: Colors.white,),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 20,),
               TextField(
                 controller: _password,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock_open_outlined,color: Colors.white,),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
              const SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  _doSignUp();
                  showToast();
                },
                child: const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.arrow_forward,color: Colors.white,),
                ),
              ),
              const SizedBox(height: 80,),
              Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text("Already have an account?",style: TextStyle(color: Colors.white70),),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, HomePage.id);
                        },
                        child: const Text("SIGN IN",style: TextStyle(color: Colors.lightBlue),),
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
