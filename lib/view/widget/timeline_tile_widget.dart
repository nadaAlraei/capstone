import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final IconData icon;
  final String text;
  final bool isCompleted;
  final bool isDarkMode;

  const TimelineTileWidget({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.icon,
    required this.text,
    required this.isCompleted,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final completedColor = Colors.green;
    final incompleteColor = isDarkMode ? Colors.grey[600]! : Colors.grey;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final iconColor = isCompleted ? Colors.white : (isDarkMode ? Colors.grey[400]! : Colors.grey);

    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: isCompleted ? completedColor : incompleteColor,
        thickness: 2,
      ),
      afterLineStyle: LineStyle(
        color: isCompleted ? completedColor : incompleteColor,
        thickness: 2,
      ),
      indicatorStyle: IndicatorStyle(
        width: 30,
        height: 30,
        color: isCompleted ? completedColor : (isDarkMode ? Colors.grey[800]! : Colors.grey.shade300),
        iconStyle: IconStyle(
          iconData: icon,
          color: iconColor,
          fontSize: 16,
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}