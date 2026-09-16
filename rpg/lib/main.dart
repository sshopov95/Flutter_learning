import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rpg/screens/home/home.dart';
import 'package:rpg/services/character_store.dart';
import 'package:rpg/theme.dart';

void main() {
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