import 'package:flutter/material.dart';
import 'package:qaed/global/info_desc.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
            color:  const Color.fromARGB(68, 156, 156, 156),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
               ...descText,
        
              TextButton.icon(
                  onPressed: () async {
                    await launchUrl(Uri.parse("sms:09178420970"));
                  },
                  label: Icon(
                    Icons.message,
                    color: Theme.of(context).hintColor,
                  ),
                  icon: Text(
                    "ارسال پیام",
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),),
              TextButton.icon(
                  onPressed: () async {
                    await launchUrl(Uri.parse("tel:09178420970"));
                  },
                  label: Icon(
                    Icons.call,
                    color: Theme.of(context).hintColor,
                  ),
                  icon: Text(
                    "تماس تلفنی",
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}
