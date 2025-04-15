import 'package:capstone/controller/bottom_navigation_bar_controller.dart';
import 'package:capstone/view/screen/filter_screen.dart';
import 'package:capstone/view/widget/input_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SearchBoxWidget extends StatelessWidget {
  SearchBoxWidget({super.key});
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.065,
      margin: EdgeInsets.only(top: 10),
      child: InputWidget(
        textEditingController: search,
        obscureText: false,
        prefixIcon: Icon(
          Icons.search,
          size: 18,
          color: Color.fromARGB(180, 135, 135, 135),
        ),
        suffixIcon: IconButton(
         onPressed: (){
           Provider.of<BottomNavigationBarController>(context,listen: false).changeWidget(
             widget: FilterScreen(),
           );
           Provider.of<BottomNavigationBarController>(context,listen: false).changeIndex(index: -1);
         },
          icon: Icon(
            Icons.filter_list_sharp,
            size: 18,
            color: Color.fromARGB(180, 135, 135, 135),
          ),
        ),
        hintText: AppLocalizations.of(context)!.search,
      ),
    );
  }
}
