import 'dart:async';

import 'package:admin_app/login.dart';
import 'package:admin_app/Pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



String userEmail = '';
class splashServices{
  Future<void> isLogin(BuildContext context)async{

    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if(user != null){

      // userEmail = user!.email ?? '';
      Timer( const Duration(seconds: 4),
              () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => home_page())));
    }else{
      Timer( const Duration(seconds: 4),
              () =>  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())));
    }
  }
}