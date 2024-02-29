import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseImageUpload extends StatefulWidget {
  @override
  _FirebaseImageUploadState createState() => _FirebaseImageUploadState();
}

class _FirebaseImageUploadState extends State<FirebaseImageUpload> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _uploadImage() async {
    if (_image == null) return; // No image selected

    try {
      // Upload image to Firebase Storage
      Reference ref = FirebaseStorage.instance.ref().child('images/image.jpg');
      UploadTask uploadTask = ref.putFile(_image!);

      // Get download URL
      String imageUrl = await (await uploadTask).ref.getDownloadURL();

      // Do something with the download URL, such as saving it to Firestore
      print('Image uploaded. Download URL: $imageUrl');
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Image Upload'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image != null
                ? Image.file(
              _image!,
              height: 200,
            )
                : Text('No image selected.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}


