import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 219, 244, 209),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.only(top: 2),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.maximize,
              size: 10,
              color: Color.fromARGB(255, 37, 174, 75),
            ),
          ),
        ),
        SizedBox(width: 9),
        TextWidget(
          text: '1',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          fontFamily: 'Poppins-Regular',
          letterSpacing: 0,
        ),
        SizedBox(width: 9),
        Container(
          width: 26,
          height: 26,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 37, 174, 75),
            borderRadius: BorderRadius.circular(10),
          ),
          //padding: EdgeInsets.only(top: 2),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              size: 10,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
