import 'package:game_app/models/skill.dart';
import 'package:game_app/models/stats.dart';
import 'package:game_app/models/vocation.dart';

//this 'with' joins the mixin.. we have a stats mixin in stats.dart
//so now these characters have the extra stats infromation
class Character with Stats {
  Character(
      {required this.name,
      required this.slogan,
      required this.vocation,
      required this.id});
  // defining fields

  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;

  //this is how to define a private item
  bool _isFav = false;

  //getter.. to get the value of the private item
  get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

//dummy data for characters

List<Character> characters = [
  Character(
      name: 'Klara', slogan: 'YOHOOO', vocation: Vocation.wizard, id: '1'),
  Character(name: 'johny', slogan: 'suiii', vocation: Vocation.junkie, id: '2'),
  Character(
      name: 'Crimson',
      slogan: 'your small server',
      vocation: Vocation.raider,
      id: '3'),
  Character(
      name: 'shaun', slogan: 'lets go BB', vocation: Vocation.ninja, id: '4'),
];
 