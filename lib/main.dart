import 'dart:io';
import 'package:admin_app/Pages/home_page.dart';
import 'package:admin_app/drawer_page/drawe_subpage/category.dart';
import 'package:admin_app/drawer_page/drawe_subpage/category_list.dart';
import 'package:admin_app/home.dart';
import 'package:admin_app/simple.dart';
import 'package:admin_app/subcetegory.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'demoUpload.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

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
theme: ThemeData(iconTheme: IconThemeData(color: Colors.white)),
      debugShowCheckedModeBanner: false,
      home: home_page(), 
    );
  }
}
