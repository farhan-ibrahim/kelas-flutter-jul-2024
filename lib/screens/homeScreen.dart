import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/contact.dart';
import 'package:my_flutter_app/repositories/contact.dart';
import 'package:my_flutter_app/widgets/myContactCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => __HomeScreenState();
}

class __HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final contactRepo = ContactRepository();

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Contacts"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
            future: contactRepo.getAllContacts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: snapshot.data!
                      .map((Contact contact) => MyContactCard(
                          contact: contact,
                          onDelete: () {
                            contactRepo
                                .deleteContact(contact)
                                .then((_) => setState(() {}));
                          },
                          onPressEdit: () {
                            Navigator.pushNamed(
                              context,
                              '/edit',
                              arguments: contact,
                            ).then((_) => {
                                  contactRepo.getAllContacts().then(
                                        (_) => setState(() {}),
                                      )
                                });
                          }))
                      .toList(),
                );
              }
              return const Center(
                child: Text("No contact"),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          Navigator.pushNamed(context, '/add').then((_) {
            print("We're Back!!");
            contactRepo.getAllContacts().then((_) => setState(() {}));
          });
        },
        child: const Icon(
          Icons.person_add,
          color: Colors.white,
        ),
      ),
    );
  }
}
