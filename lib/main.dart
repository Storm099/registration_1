import 'package:flutter/material.dart';
import 'package:registration_1/pages/home_page.dart';
import 'package:registration_1/pages/sign_up.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox("my_demo");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        HomePage.id:(context) => const HomePage(),
        SignUp.id:(context) => const SignUp(),
      },
    );
  }
}

