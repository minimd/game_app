import 'package:flutter/material.dart';
import 'package:game_app/models/character.dart';
import 'package:game_app/models/stats.dart';
import 'package:game_app/shared/styled_text.dart';
import 'package:game_app/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});
  final Character character;
  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          //points
          Container(
            color: AppColors.secondaryColor,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color:
                      widget.character.points > 0 ? Colors.yellow : Colors.grey,
                ),
                const SizedBox(width: 20),
                const StyledText('Star points available'),
                const Expanded(child: const SizedBox()),
                //alright let me explain.. the character we are refering to here is made in the widget class.. the one above i mean..
                //so the state widget has no idea what this is.. so how to get it? just write widget. before it
                StyledHeading(widget.character.points.toString()),
              ],
            ),
          ),

          //stats
          Table(
            children: widget.character.statsAsFormattedList.map((stat) {
              return TableRow(
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor.withOpacity(0.5)),
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(stat['title']!),
                      ),
                    ),
                    //statValues
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: StyledHeading(stat['value']!),
                      ),
                    ),
                    //icon to increase stats.
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.character.increaseStat(stat['title']!);
                          });
                        },
                        icon: Icon(
                          Icons.arrow_upward,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.character.decreaStat(stat['title']!);
                          });
                        },
                        icon: Icon(
                          Icons.arrow_downward,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                  ]);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
