import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/contact.dart';
import 'package:my_flutter_app/repositories/contact.dart';

class EditContactScreen extends StatefulWidget {
  final Contact currentData;
  const EditContactScreen({super.key, required this.currentData});

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  final contactRepo = ContactRepository();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _name =
        TextEditingController(text: widget.currentData.name);
    TextEditingController _position =
        TextEditingController(text: widget.currentData.position);
    TextEditingController _email =
        TextEditingController(text: widget.currentData.email);
    TextEditingController _phone =
        TextEditingController(text: widget.currentData.phone);

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Contact"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  label: Text("Name"),
                  border: OutlineInputBorder(),
                ),
                validator: (String? value) {
                  if (value == null || value == '') {
                    return "Name is required";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _position,
                decoration: const InputDecoration(
                    label: Text("Position"), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _phone,
                decoration: const InputDecoration(
                    label: Text("Phone"), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  label: Text("Email"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();

                    if (isValid) {
                      final updatedData = Contact(
                          id: widget.currentData.id,
                          name: _name.text,
                          position: _position.text,
                          email: _email.text,
                          phone: _phone.text);
                      contactRepo
                          .updateContact(updatedData)
                          .then((_) => Navigator.pop(context));
                    }
                  },
                  child: Text("Update"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
