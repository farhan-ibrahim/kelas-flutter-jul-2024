import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArchiveScreen extends StatelessWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Archives"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("Go to Add Contact"),
              onPressed: () {
                Navigator.pushNamed(context, "/add");
              },
            ),
            ElevatedButton(
              child: Text("Go to Home"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
