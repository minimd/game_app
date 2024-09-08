import 'package:flutter/material.dart';
import 'package:game_app/screens/create/create.dart';
import 'package:game_app/screens/home/home.dart';
import 'package:game_app/theme.dart';


// we created a default theme to use on our app.. 
//check theme.dart
void main() {
  runApp(MaterialApp(
    theme: primaryTheme,
    home: const Create(),
  ));
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
