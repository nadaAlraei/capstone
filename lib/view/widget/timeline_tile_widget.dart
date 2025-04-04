import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileWidget extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final IconData icon;
  final String text;
  final bool isCompleted;

  const TimelineTileWidget({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.icon,
    required this.text,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: isCompleted ? Colors.green : Colors.grey,
      ),
      indicatorStyle: IndicatorStyle(
        width: 40,
        color: isCompleted ? Colors.green : Colors.grey.shade300,
        iconStyle: IconStyle(
          iconData: icon,
          color: isCompleted ? Colors.white : Colors.grey,
        ),
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
