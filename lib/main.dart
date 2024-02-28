import 'dart:io';

import 'package:admin_app/drawer_page/drawe_subpage/category.dart';
import 'package:admin_app/home.dart';
import 'package:admin_app/simple.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
  ? await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBold0b5F_onsDHEcPwSfiZoKU9RFMaEPg",
          appId: "1:545220662127:android:25d016687aed643a2bce9a",
          messagingSenderId: "545220662127",
          projectId: "city-serve-db40b"))
  : await Firebase.initializeApp();
  runApp(const MyApp());}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: simple(),
    );
  }
}


