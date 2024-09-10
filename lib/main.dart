import 'package:flutter/material.dart';
import 'package:game_app/provider/character_store.dart';
import 'package:game_app/screens/home/home.dart';
import 'package:game_app/theme.dart';
import 'package:provider/provider.dart';

// we created a default theme to use on our app..
//check theme.dart
void main() {

  // we wrap the main run app with this so the whole data gets published.. just like riverpod
  runApp(ChangeNotifierProvider(
    // inside the create property.. we push our changeNotifiers that we want to consume
    //important note -- if you use the normal function instead od the arrow function here.. it won't work
      create: (context) => CharacterStore(),
      child: MaterialApp(theme: primaryTheme, home: const Home())));
}

class SandBox extends StatelessWidget {
  const SandBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SandBox'),
        backgroundColor: Colors.amber[600],
      ),
      body: const Text('sandbox'),
    );
  }
}
