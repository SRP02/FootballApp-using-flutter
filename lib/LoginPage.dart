import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Container(child: Column(
          children: [
            Text('Ini Login Page'),
            ElevatedButton(onPressed: (){
              Get.toNamed('/homepage');
            }, child: Text('Login')),
          ],
        )),
      ),
    );
  }
}