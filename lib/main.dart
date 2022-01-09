import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dbconfig.dart';

final configurations = Configurations();

Future<void> main() async {
  await init();
  runApp(const MyApp());

  FirebaseFirestore.instance
      .collection('mensagens')
      .doc('msg2')
      .set({'texto': 'Olá', 'from': 'Rafael', 'read': 'false'});
}

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: configurations.api,
        appId: configurations.app,
        messagingSenderId: configurations.messaging,
        projectId: configurations.project),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(),
    );
  }
}
  