import 'package:cloud_firestore/cloud_firestore.dart';

import 'dbconfig.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_chat/text_composer.dart';

final configurations = Configurations();

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

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void _sendMessageToFirebase(String text) {
    FirebaseFirestore.instance.collection('messages').add({
      'text': text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olá'),
        elevation: 0,
      ),
      body: TextComposer(_sendMessageToFirebase),
    );
  }
}
