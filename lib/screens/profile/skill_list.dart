import 'package:flutter/material.dart';
import 'package:game_app/models/character.dart';
import 'package:game_app/models/skill.dart';
import 'package:game_app/shared/styled_text.dart';
import 'package:game_app/theme.dart';

class SkillList extends StatefulWidget {
  const SkillList(this.character, {super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  //similar to JS filter

  //this.. sadly.. doesn't work.. so we have to declare it inside the initstate. because that this is a stateful widget and so..
  // List<Skill> availableSkills = allSkills.where((skill) {
  //   skill.vocation == widget.character.vocation;
  // }).toList();
  //instead --> (late refers that we will fill this item data later so don't cry)
  late List<Skill> availableSkills;
  late Skill selectedSkill;

//initstate is the initial state.. the starting point for this state..
  @override
  void initState() {
    availableSkills = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();

    if (widget.character.skills.isEmpty) {
      selectedSkill = availableSkills[0];
    } else if (widget.character.skills.isNotEmpty) {
      selectedSkill = widget.character.skills.first;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(8),
        color: AppColors.secondaryColor.withOpacity(0.5),
        child: Column(
          children: [
            const StyledHeading('choose an active skill'),
            const StyledText('skills are unique to your selected vocation.'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: availableSkills.map((skill) {
                return Container(
                    margin: const EdgeInsets.all(2),
                    padding: const EdgeInsets.all(2),
                    color: skill == selectedSkill
                        ? Colors.yellow
                        : Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.character.updateSkill(skill);
                          selectedSkill = skill;
                        });
                      },
                      child: Image.asset(
                        'assets/img/skills/${skill.image}',
                        width: 70,
                      ),
                    ));
              }).toList(),
            ),
            const SizedBox(
              height: 12,
            ),
            StyledText(selectedSkill.name)
          ],
        ),
      ),
    );
  }
}
