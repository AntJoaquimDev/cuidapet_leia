import 'package:cuidapet_leia/app/core/ui/extensions/size_screen_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 162.w,
            height: 130.h,
            fit: BoxFit.contain,
          ),
        ),

        TextButton(onPressed: () { FirebaseAuth.instance.signOut(); },
        child:const Text('Logout'))
        ],
        
      ),
    );
  }
}
