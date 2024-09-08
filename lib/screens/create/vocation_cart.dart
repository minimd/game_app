import 'package:flutter/material.dart';
import 'package:game_app/models/vocation.dart';
import 'package:game_app/shared/styled_text.dart';
import 'package:game_app/theme.dart';

//this widget shows a single vocation on the create a character screen..

class VocationCart extends StatelessWidget {
  const VocationCart(
      {super.key,
      required this.vocation,
      required this.function,
      required this.selected});

  final Vocation vocation;
  final void Function(Vocation) function;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function(vocation);
      },
      child: Card(
        color: selected ? AppColors.secondaryColor : Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Row(
            children: [
              //vocation image
              Image.asset(
                'assets/img/vocations/${vocation.image}',
                width: 80,
                //the source image is the original one
                colorBlendMode: BlendMode.color,
                color: !selected
                    //the destination image is this color thing
                    ? Colors.black.withOpacity(0.8)
                    : Colors.transparent,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeading(vocation.title),
                  StyledText(vocation.description),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
