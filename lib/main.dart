import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'display_page.dart';
import 'firebase_options.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions
          .currentPlatform, 
    );
    runApp(MyApp());
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Initialized!'),
        ),
        body: Center(
          child: DisplayPage(),
        ),
      ),
    );
  }
}
