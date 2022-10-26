import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OtherFunctions {
  static Future<void> acceptOrder(
    String orderId,
    BuildContext context,
  ) async {
    try {
      await FirebaseFirestore.instance.collection("orders").doc(orderId).update(
        {"status": "In Progress"},
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong, please try again.",
            textScaleFactor: 1,
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  static Future<void> completeOrder(
    String orderId,
    BuildContext context,
  ) async {
    try {
      await FirebaseFirestore.instance.collection("orders").doc(orderId).update(
        {"status": "Out for Delivery"},
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Something went wrong, please try again.",
            textScaleFactor: 1,
          ),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }
}
