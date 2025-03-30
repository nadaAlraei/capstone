import 'package:capstone/view/screen/all_notification.dart';
import 'package:capstone/view/screen/read_notification.dart';
import 'package:capstone/view/screen/unread_notification.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNotificationSheetWidget extends StatelessWidget {
  const BottomNotificationSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(
            MediaQuery.of(context).size.height * 0.1,
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: TextWidget(
              text: AppLocalizations.of(context)!.notification,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              fontFamily: 'Inter',
              letterSpacing: 0,
            ),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Color.fromARGB(255, 37, 174, 75),
              indicatorWeight: 2,
              dividerColor: Colors.white,
              labelColor: Color.fromARGB(255, 37, 174, 75),

              tabs: [
                // All
                TextWidget(
                  text: AppLocalizations.of(context)!.all,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  letterSpacing: 0,
                  textAlign: TextAlign.center,
                ),
                // Unread
                TextWidget(
                  text: AppLocalizations.of(context)!.unread,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  letterSpacing: 0,
                  textAlign: TextAlign.center,
                ),
                // Read
                TextWidget(
                  text: AppLocalizations.of(context)!.read,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  letterSpacing: 0,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          AllNotification(),
          UnreadNotification(),
          ReadNotification(),
        ]),
      ),
    );
  }
}
