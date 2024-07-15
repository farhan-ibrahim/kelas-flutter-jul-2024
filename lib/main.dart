import 'package:flutter/material.dart';
import 'package:my_flutter_app/models/contact.dart';
import 'package:my_flutter_app/screens/addContactScreen.dart';
import 'package:my_flutter_app/screens/archiveScreen.dart';
import 'package:my_flutter_app/screens/ediContactScreen.dart';
import 'package:my_flutter_app/screens/homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      routes: {
        '/': (context) => const HomeScreen(),
        '/add': (context) => const AddContactScreen(),
        '/edit': (context) => EditContactScreen(
              currentData:
                  ModalRoute.of(context)!.settings.arguments as Contact,
            ),
        '/archive': (context) => const ArchiveScreen(),
      },
    ),
  );
}
