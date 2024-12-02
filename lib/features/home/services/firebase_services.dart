import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:uuid/uuid.dart';

abstract class FirebaseServices {
  static String apiKey = "682878721591266";
  static String apiSecert = "YHeiozOQTrYfO7VCKNtmqGk1kw0";
  static String cloudName = "ddwutooak";
  static String orders = "ddwutooak";
  static CollectionReference fetchFirebase() {
    return FirebaseFirestore.instance.collection("products");
  }

  static CollectionReference fetchOrders() {
    return FirebaseFirestore.instance.collection("orders");
  }

  static fetchdata() async {
    var uuid = const Uuid().v4();
    var userdata =
        await FirebaseFirestore.instance.collection("products").doc(uuid).get();
    if (userdata.exists) {
      return userdata.data();
    } else {
      log("No DATA");
    }
  }

  static Cloudinary cloudinary() {
    Cloudinary cloudinary = Cloudinary.signedConfig(
        apiKey: apiKey, apiSecret: apiSecert, cloudName: cloudName);
    return cloudinary;
  }
}
