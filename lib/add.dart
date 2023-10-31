// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// class AddPage extends StatelessWidget {
//  CollectionReference products = FirebaseFirestore.instance.collection('products');
//
//  var globalKey = GlobalKey<FormState>();
//  TextEditingController nC = TextEditingController();
//  TextEditingController pPrice = TextEditingController();
//  TextEditingController pQuauntity = TextEditingController();
//
//  void adddata() async {
//    await products.add({
//      "pid" : 1235,
//      "pname":nC.text.trim(),
//      "pprice": pPrice.text.trim(),
//      "pquantity": pQuauntity.text.trim(),
//    }).whenComplete(() => displayMessage("new data added successfully"));
//  }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
