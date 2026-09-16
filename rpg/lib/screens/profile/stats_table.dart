import 'package:flutter/material.dart';
import 'package:rpg/models/character.dart';
import 'package:rpg/shared/styled_text.dart';
import 'package:rpg/theme.dart';

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});
  final Character character;
  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: 
    const EdgeInsets.all(16),
    child: Column(
      children: [
        // avail points
        Container(
          color: AppColors.secondaryColor,
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(Icons.star, color: widget.character.points > 0 ? Colors.yellow: Colors.grey ,),
              const SizedBox(width: 20,),
              const StyledText("Stats points available:"),
              const Expanded(child: SizedBox(width: 20,)),
              StyledHeading(widget.character.points.toString())
            ],
          ),
        ),

        //stats table
        Table(
          children: widget.character.statsAsFormattedList.map((stats) { 
            return TableRow(
              decoration: BoxDecoration(
                color: AppColors.secondaryColor.withValues(alpha: 0.5),
              ),
              children: [
                // stats title
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: StyledHeading(stats['title']!),
                    )
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: StyledHeading(stats['value']!),
                    )
                ),

                //icon to increase stat
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.character.increaseStat(stats['title']!);
                      });
                      }, 
                      icon: Icon(Icons.arrow_upward, color: AppColors.textColor)
                    ),
                    ),

                //icon to decrease stat
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        widget.character.decreaseStat(stats['title']!);
                      });
                    }, icon: Icon(Icons.arrow_downward, color: AppColors.textColor)
                    ),
                    )
              ]
            );
          }).toList()
          ),
        ],
      ),
    );
  }
}