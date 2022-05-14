import 'package:flutter/material.dart';
import 'package:qaed/global/custom_theme.dart';
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
          color: const Color.fromARGB(68, 156, 156, 156),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...descText,
              
              launchButton(context: context,link: "sms:09178420970",label: "ارسال پیام",icon: Icons.message),
              launchButton(context: context,link: "tel:09178420970",label: "تماس تلفنی",icon: Icons.call),
            
            ],
          ),
        ),
      ),
    );
  }

  Widget launchButton({required BuildContext context,required String link,required String label, required IconData icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width*9,
      child: ElevatedButton.icon(
                onPressed: () async {
                  await launchUrl(Uri.parse(link));
                },
                label:  Icon(
                  icon
                ),
                icon: Text(
                  label
                ),

                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(mainColor),
                      maximumSize: MaterialStateProperty.all(MediaQuery.of(context).size),
                ),

              ),
    );
  }
}
