import 'package:admin_app/util/color.dart';
import 'package:flutter/material.dart';

class simple extends StatefulWidget {
  const simple({super.key});

  @override
  State<simple> createState() => _simpleState();
}

class _simpleState extends State<simple> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.Colorq.withOpacity(0.05),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)),
                hintText: "3",
                labelText: "Discount",
                labelStyle: TextStyle(color: Colors.black87),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.Colorq),
                    borderRadius: BorderRadius.circular(15))),

          ),
        ],
      ),
    );
  }
}
