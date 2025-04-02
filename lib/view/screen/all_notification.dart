import 'package:capstone/model/notification_model.dart';
import 'package:capstone/view/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AllNotification extends StatelessWidget {
  const AllNotification({super.key});

  @override
  Widget build(BuildContext context) {
    List<NotificationModel> notification = [
      NotificationModel(
        title: AppLocalizations.of(context)!.promotional,
        time: AppLocalizations.of(context)!.time,
        message: AppLocalizations.of(context)!.promotional_des,
      ),
      NotificationModel(
        title: AppLocalizations.of(context)!.promotional,
        time: AppLocalizations.of(context)!.time,
        message: AppLocalizations.of(context)!.promotional_des,
      ),
      NotificationModel(
        title: AppLocalizations.of(context)!.promotional,
        time: AppLocalizations.of(context)!.time,
        message: AppLocalizations.of(context)!.promotional_des,
      ),
    ];
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: notification.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 0.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Notification title
                  TextWidget(
                    text: notification[index].title,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    letterSpacing: 0,
                  ),
                  // Notification message
                  TextWidget(
                    text: notification[index].message,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    letterSpacing: 0,
                  ),
                  SizedBox(height: 10),
                  // Notification time
                  TextWidget(
                    text: notification[index].time,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    letterSpacing: 0,
                    fontColor: Color.fromARGB(255, 165, 172, 184),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
