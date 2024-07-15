import 'package:cloud_firestore/cloud_firestore.dart';

class Contact {
  String? id;
  String name;
  String? email;
  String? phone;
  String position;

  // Constructor
  Contact({
    this.id,
    required this.name,
    this.email,
    this.phone,
    required this.position,
  });

  // Method
  toMap() {
    return {
      "name": name,
      "position": position,
      "email": email,
      "phone": phone,
    };
  }

  factory Contact.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Contact(
      id: doc.id,
      name: doc.data()["name"],
      position: doc.data()["position"],
      email: doc.data()["email"],
      phone: doc.data()["phone"],
    );
  }
}
