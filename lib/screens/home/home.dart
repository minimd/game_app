// import 'dart:ffi';
import 'package:game_app/helpers/functions.dart';

import 'package:flutter/material.dart';
import 'package:game_app/provider/character_store.dart';

import 'package:game_app/screens/create/create.dart';
import 'package:game_app/screens/home/character_card.dart';
import 'package:game_app/shared/styled_button.dart';
import 'package:game_app/shared/styled_text.dart';
import 'package:provider/provider.dart';

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
                //this consumer thing is for using the consumer "here"
                child:
                    Consumer<CharacterStore>(builder: (context, value, child) {
                  return ListView.builder(
                    //characters is a list of characters found in the file character.dart
                    //put a 'value.' before your item to access it's value 
                    itemCount: value.characters.length,
                    itemBuilder: (_, index) {
                      return CharacterCard(value.characters[index]);
                    },
                  );
                }),
              ),
              StyledButton(
                onPressed: () {
                  goTo(context, const CreateScreen());
                },
                child: const StyledHeading('create New'),
              )
            ],
          )),
    );
  }
}
