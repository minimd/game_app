import 'package:flutter/material.dart';
import 'package:game_app/models/character.dart';
import 'package:game_app/models/vocation.dart';

//here starts the provider package dance.. lets go..

// making a notifier
class CharacterStore extends ChangeNotifier {
  // i made this private for fun
  final List<Character> _characters = [
    Character(
        name: 'Klara', slogan: 'YOHOOO', vocation: Vocation.wizard, id: '1'),
    Character(
        name: 'johny', slogan: 'suiii', vocation: Vocation.junkie, id: '2'),
    Character(
        name: 'Crimson',
        slogan: 'your small server',
        vocation: Vocation.raider,
        id: '3'),
    Character(
        name: 'shaun', slogan: 'lets go BB', vocation: Vocation.ninja, id: '4'),
  ];

  get characters => _characters;

  void addCharacter(Character character) {
    
    _characters.add(character);
    //this is our dancer
    notifyListeners();
  }
}
