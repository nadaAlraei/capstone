import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ListTile(
        leading: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 79, 175, 90),
            borderRadius: BorderRadius.circular(10),
          ),

          child: Image.asset('assets/images/ri_map-pin-5-line.png'),
        ),
        title: Row(
          children: [
            TextWidget(
              text: 'Current location',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              fontFamily: 'Inter',
              letterSpacing: 0.16,
              fontColor: Color.fromARGB(150, 96, 96, 96),
            ),
            Icon(
              Icons.arrow_drop_down_outlined,
              color: Color.fromARGB(150, 96, 96, 96),
            ),
          ],
        ),
        subtitle: TextWidget(
          text: 'Jl. Soekarno Hatta 15A Malang',
          fontWeight: FontWeight.w600,
          fontSize: 14,
          fontFamily: 'Inter',
          letterSpacing: 0.0,
          fontColor: Colors.black,
        ),
        trailing: Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: Color.fromARGB(50, 136, 136, 136),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(Icons.notifications_none),
        ),
      ),
    );



  }
}
