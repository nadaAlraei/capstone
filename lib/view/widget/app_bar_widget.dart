import 'package:capstone/view/widget/bottom_notification_sheet_widget.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key});
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Upper app bar
        Container(
          margin: EdgeInsets.only(left: 5, right: 5, top: 30),
          child: ListTile(
            // location icon
            leading: Container(
              width: MediaQuery.of(context).size.width * 0.09,
              height: MediaQuery.of(context).size.height * 0.045,
              decoration: BoxDecoration(
                color: Color.fromARGB(30, 79, 175, 90),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assets/images/ri_map-pin-5-line.png'),
            ),
            // Current location text
            title: Row(
              children: [
                TextWidget(
                  text: AppLocalizations.of(context)!.current_location,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'Inter',
                  letterSpacing: 0.16,
                  fontColor: Color.fromARGB(255, 96, 96, 96),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Color.fromARGB(255, 96, 96, 96),
                  size: 20,
                ),
              ],
            ),
            // location
            subtitle: TextWidget(
              text: 'Jl. Soekarno Hatta 15A Malang',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              fontFamily: 'Inter',
              letterSpacing: 0.0,
              fontColor: Colors.black,
            ),
            // notification
            trailing: Container(
              width: MediaQuery.of(context).size.width * 0.09,
              height: MediaQuery.of(context).size.height * 0.045,
              decoration: BoxDecoration(
                color: Color.fromARGB(150, 245, 245, 245),
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(onPressed: () {


    }, icon: Icon(Icons.notifications_none, size: 18)),
            ),
          ),
        ),

        // Search box
        Container(
          width: MediaQuery.of(context).size.width * 0.95,
          height: MediaQuery.of(context).size.height * 0.065,

          margin: EdgeInsets.only(bottom: 30),
          child: InputWidget(
            textEditingController: search,
            obscureText: false,
            prefixIcon: Icon(
              Icons.search,
              size: 18,
              color: Color.fromARGB(180, 135, 135, 135),
            ),
            suffixIcon: Icon(
              Icons.filter_list_sharp,
              size: 18,
              color: Color.fromARGB(180, 135, 135, 135),
            ),
            hintText: AppLocalizations.of(context)!.search,
          ),
        ),
      ],
    );
  }
}
