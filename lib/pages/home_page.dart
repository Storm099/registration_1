import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:registration_1/pages/sign_up.dart';
import 'package:registration_1/services/hive_service.dart';


class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var _username = TextEditingController();
  var _password = TextEditingController();

  void _doLogin(){

    String usn = _username.text.toString();
    String pw = _password.text.toString();

    var list = HiveDb().loaddata();

    for(var i in list){
      if(i.username == usn && i.password == pw){
        showToast();
      }
    }

  }

  void showToast(){
    Fluttertoast.showToast(
        msg: "Successfully login",
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
    return   Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 29, 58),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height- 60,
          margin: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100,),
                  //#image
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/my1.jpg"),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Text("Welcome Back!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22.0,letterSpacing: 1.4),),
                  const SizedBox(height: 10,),
                  const Text("Sign in to continue",style: TextStyle(color: Colors.white),),
                  const SizedBox(height: 60,),
                   TextField(
                     controller: _username,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person,color: Colors.white,),
                      hintText: "User Name",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const SizedBox(height: 10,),
                   TextField(
                     controller: _password,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock_open_outlined,color: Colors.white,),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Text("Forgot Password?",style: TextStyle(color: Colors.white70),),
                  const SizedBox(height: 30,),
                  GestureDetector(
                    onTap: (){
                      _doLogin();
                    },
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.blueAccent,
                      child: Icon(Icons.arrow_forward,color: Colors.white,),
                    ),
                  )

                ],
              ),

              //#sign up
              Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text("Don't have an account?",style: TextStyle(color: Colors.white70),),
                      const SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, SignUp.id);
                        },
                        child: const Text("SIGN UP",style: TextStyle(color: Colors.lightBlue),),
                      )
                    ],
                  )
              )
            ],
          ),

        ),
      ),
    );
  }
}
