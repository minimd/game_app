import 'package:flutter/material.dart';
import 'package:game_app/helpers/functions.dart';
import 'package:game_app/models/character.dart';
import 'package:game_app/screens/profile/skill_list.dart';
import 'package:game_app/screens/profile/stats_table.dart';
import 'package:game_app/shared/styled_button.dart';
import 'package:game_app/shared/styled_text.dart';
import 'package:game_app/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledText(character.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //image, vocation, description.
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset(
                    'assets/img/vocations/${character.vocation.image}',
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  //we wrapped the culumn with an expanded so we can use the whole height of the container for the column.
                  //columns by default take the inner child height.. what a waste..
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description)
                      ],
                    ),
                  )
                ],
              ),
            ),

            //weapon and ability and slogan

            const SizedBox(
              height: 20,
            ),
            Center(
              child: Icon(
                Icons.code,
                color: AppColors.primaryColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading('Slogan'),
                    StyledText(character.slogan),
                    const SizedBox(
                      height: 10,
                    ),
                    const StyledHeading('Weapon'),
                    StyledText(character.vocation.weapon),
                    const SizedBox(
                      height: 10,
                    ),
                    const StyledHeading('Unique ability'),
                    StyledText(character.vocation.ability),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),

            //stats and skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  StatsTable(character),
                  SkillList(character),
                ],
              ),
            ),
            //button
            StyledButton(
              onPressed: () {
                snacky(context, const StyledText('Character saved'));
              },
              child: const StyledHeading('save character'),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
