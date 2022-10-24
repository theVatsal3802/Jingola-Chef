import 'package:cloud_firestore/cloud_firestore.dart';

class OtherFunctions {
  static Future<void> acceptOrder(String orderId) async {
    await FirebaseFirestore.instance.collection("orders").doc(orderId).update(
      {"status": "In Progress"},
    );
  }

  static Future<void> completeOrder(String orderId) async {
    await FirebaseFirestore.instance.collection("orders").doc(orderId).update(
      {"status": "Out for Delivery"},
    );
  }
}
