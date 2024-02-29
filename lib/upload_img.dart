import 'dart:io';
import 'package:admin_app/round.dart';
import 'package:admin_app/utils.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  bool loading = false;
  File? _image;

  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('post');

  Future getImageGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("image is not selected");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Image Screen"),
        centerTitle: true,
        backgroundColor: Colors.purple.shade300,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  getImageGallery();
                },
                child: Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                          style: BorderStyle.solid,
                          color: Colors.purple.shade300,
                          width: 2),
                    ),
                    child: _image != null
                        ? Image.file(_image!.absolute)
                        : Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            RoundButton(
              title: "Add Image",
              loding: loading,
              onTap: () async {
                setState(() {
                  loading = true;
                });
                firebase_storage.Reference ref =
                    firebase_storage.FirebaseStorage.instance.ref('/Images/' +
                        DateTime.now().millisecondsSinceEpoch.toString());
                firebase_storage.UploadTask uploadTask =
                    ref.putFile(_image!.absolute);

                Future.value(uploadTask).then((value) async {
                  var newUrl = await ref.getDownloadURL();

                  databaseRef.child("1").set(
                      {'id': '123', 'title': newUrl.toString()}).then((value) {
                    setState(() {
                      loading = false;
                      Utils().tostmessage('Image Uploaded');
                    });
                  }).onError((error, stackTrace) {
                    print(error.toString());
                    setState(() {
                      loading = false;
                    });
                  });
                }).onError((error, stackTrace) {
                  Utils().tostmessage(error.toString());
                  setState(() {
                    loading = false;
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
