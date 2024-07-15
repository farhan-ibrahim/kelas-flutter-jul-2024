import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/contact.dart';
import 'package:my_flutter_app/repositories/contact.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final contactRepo = ContactRepository();
  final departments = ["Engineering", "Admin", "Finance"];
  String? department;
  DateTime? birthday;

  _selectDate(context) async {
    final selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (selectedDate != null) {
      print("MY BIRTHDAY $selectedDate");
      setState(() {
        birthday = selectedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _name = TextEditingController();
    TextEditingController _position = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _phone = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Contact"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                  label: Text("Name"), border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _position,
              decoration: const InputDecoration(
                  label: Text("Position"), border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _email,
              decoration: const InputDecoration(
                  label: Text("Email"), border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _phone,
              decoration: const InputDecoration(
                  label: Text("Phone Number"), border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            DropdownButton(
              items: departments.map((String dpt) {
                return DropdownMenuItem<String>(value: dpt, child: Text(dpt));
              }).toList(),
              onChanged: (value) {
                print("DEPARTMENT ${value}");
                setState(() {
                  department = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text("Add Birthday"),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final name = _name.text;
                  final position = _position.text;
                  final email = _email.text;
                  final phone = _phone.text;
                  final dept = department;

                  final data = Contact(
                    name: name,
                    position: position,
                    email: email,
                    phone: phone,
                    // department : dept
                    // dob: birthday
                  );

                  contactRepo
                      .addNewContact(data)
                      .then((_) => Navigator.pop(context));
                },
                child: const Text("Add"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
