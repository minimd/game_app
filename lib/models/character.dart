import 'package:cloud_firestore/cloud_firestore.dart';
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

  Map<String, dynamic> toFireStore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((s) => s.id).toList(),
      'stats': statsMap,
      'points': points,
    };
  }

  factory Character.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    //get the character
    final data = snapshot.data()!;

    //make the character
    Character character = Character(
        name: data['name'],
        slogan: data['slogan'],
        vocation:
            Vocation.values.firstWhere((v) => v.toString() == data['vocation']),
        id: snapshot.id);

    //set skills
    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.updateSkill(skill);
    }
    // setisFave
    if (data['isFav'] == true) {
      character.toggleIsFav();
    }
    return character;
  }
}
