import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg/screens/home/home.dart';
import 'package:rpg/services/character_store.dart';
import 'package:rpg/theme.dart';

//firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create: (context)=> CharacterStore(),
    child: MaterialApp(
      home: Home(),
      theme: primaryTheme,
    ),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sandbox mode'),
        backgroundColor: Colors.grey,
      ),
      body: const Text('Sandbox'),
    );
  }
}