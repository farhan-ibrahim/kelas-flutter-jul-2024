import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flutter_app/models/contact.dart';

class ContactRepository {
  final db = FirebaseFirestore.instance;

  Future<List<Contact>> getAllContacts() async {
    final CollectionReference<Map<String, dynamic>> contactCollection =
        db.collection("contacts");

    final QuerySnapshot<Map<String, dynamic>> response =
        await contactCollection.get();

    final result =
        response.docs.map((doc) => Contact.fromSnapshot(doc)).toList();
    return result;
  }

  Future<void> addNewContact(Contact data) async {
    final CollectionReference<Map<String, dynamic>> contactCollection =
        db.collection("contacts");

    // Map - json
    await contactCollection.add(data.toMap());
  }

  Future<void> deleteContact(Contact data) async {
    final CollectionReference<Map<String, dynamic>> contactCollection =
        db.collection("contacts");
    final id = data.id;

    await contactCollection.doc(id).delete();
  }

  Future<void> updateContact(Contact data) async {
    // data is new information
    final CollectionReference<Map<String, dynamic>> contactCollection =
        db.collection("contacts");

    await contactCollection.doc(data.id).update(data.toMap());
  }
}
