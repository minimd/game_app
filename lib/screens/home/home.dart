// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:game_app/models/character.dart';
import 'package:game_app/screens/home/character_card.dart';
import 'package:game_app/shared/styled_button.dart';
import 'package:game_app/shared/styled_text.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //this styledTitle is a normal text with some style that i made. check styled_text.dart
        title: const StyledTitle('your characters'),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                //list view is scrollable BTW.. column isn't
                child: ListView.builder(
                  //characters is a list of characters found in the file character.dart 
                  itemCount: characters.length,
                  itemBuilder: (_, index) {
                    return CharacterCard(characters[index]);
                  },
                ),
              ),
              StyledButton(
                onPressed: () {
                  print('chhar');
                },
                child: const StyledHeading('create New'),
              )
            ],
          )),
    );
  }
}
