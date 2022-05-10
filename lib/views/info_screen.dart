import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qaed/global/rtl_material_app_with_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .95,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),

          // ignore: prefer_const_constructors
          gradient: LinearGradient(colors: const [
            Color.fromARGB(144, 58, 58, 58),
            Color.fromARGB(117, 184, 184, 184)
          ]),
        ),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const CircleAvatar(
              maxRadius: 40,
              backgroundImage: AssetImage("assets/k.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "کورش کاظمی نیا",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: 10,),
            const Text(
              "\nبرنامه نویس و توسعه دهنده\nوب و موبایل",
              textAlign: TextAlign.center,
            ),

            TextButton.icon(
                onPressed: () async {
                  await launchUrl(Uri.parse("sms:09178420970"));
                },
                label: Icon(
                  Icons.message,
                  color: Theme.of(context).hintColor,
                ),
                icon: Text(
                  "ارسال پیامک",
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
    );
  }
}
