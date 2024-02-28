import 'package:admin_app/util/color.dart';
import 'package:admin_app/util/dimension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import 'drawe_subpage/add_service.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Drawer(
      backgroundColor: AppColors.Colorq.withOpacity(0.05),
      //  width: dimension.height100 * 2 + 50,
      width: dimension.height100 * 2 + 50,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.Colorq,
            ), //BoxDecoration
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppColors.Colorq),
              accountName: Padding(
                padding: EdgeInsets.only(top: dimension.font10),
                child: Text(
                  "Demo Admin",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              accountEmail: Text("admin977@gmail.com"),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white12,
                  child: Text(
                    "A",
                    style: GoogleFonts.poppins(
                        fontSize: 30.0, color: AppColors.Colorq),
                  ), //Text
                ),
              ), //circleAvatar
            ), //UserAccountDrawerHeader
          ), //DrawerHeader
          ListTile(
            leading: Icon(Icons.person),
            title: Text(' My Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.book),
            title: const Text(' My Course '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.workspace_premium),
            title: Text(' Service '),
            onTap: () {
              Get.to(addservice());
            },
          ),
          ListTile(
            leading: const Icon(Icons.video_label),
            title: const Text(' Saved Videos '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text(' Edit Profile '),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('LogOut'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ));
  }
}
