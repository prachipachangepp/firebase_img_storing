import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_img_storing/main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');

  var globalKey = GlobalKey<FormState>();
  TextEditingController nC = TextEditingController();
  TextEditingController pPrice = TextEditingController();
  TextEditingController pQuauntity = TextEditingController();

  void adddata() async {
    await products.add({
      "pid": 1235,
      "pname": nC.text.trim(),
      "pprice": pPrice.text.trim(),
      "pquantity": pQuauntity.text.trim(),
    }).whenComplete(() => displayMessage("new data added successfully"));
  }

  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    try {
      final XFile? pickedImage =
          await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedImage != null) {
          _image = File(pickedImage.path);
        } else {
          displayMessage('No image selected');
        }
      });
    } catch (e) {
      displayMessage(e.toString());
    }
  }

  Future uploadImage(File_image) async {
    Reference reference = FirebaseStorage.instance.ref().child('/image');
    await reference.putFile(File_image);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text(
            "Image storing",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            // key: globalkey,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  color: Colors.grey,
                  child: _image != null
                      ? Image.file(_image!, fit: BoxFit.cover)
                      : const Text('upload image'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    _openImagePicker().whenComplete(() {
                      uploadImage(_image);
                    });
                  },
                  child: const Text("Please select an image"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter Name',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'price',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'quantity',
                  ),
                ),
                // IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Save Data"),
                ),
                // SizedBox(
                //   height: 40,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
