import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:qaed/global/global_var.dart';
import 'package:qaed/global/rout_with_transition.dart';
import 'package:qaed/views/years_list_Screen.dart';

class YearsScreen extends StatelessWidget {
  const YearsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int lastYear = 1401;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: articlesPerYear.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            child: Container(
              margin: const EdgeInsets.all(2),
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/pics/${lastYear - index}.jpg"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  articleLabel(
                      icon: Icons.calendar_month, text: "${lastYear - index}"),
                  articleLabel(
                      icon: Icons.mic,
                      text: "${articlesPerYear[lastYear - index]}"),
                ],
              ),
            ),
            onTap: () {
              Get.to(() => YearsListScreen(titleIndex: index),
                  transition: Transition.rightToLeft);
            },
          );
        },
      ),
    );
  }
}

Widget articleLabel({required IconData icon, required String text}) {
  return Row(
    children: [
      Icon(icon, size: 16),
      const SizedBox(
        height: 20,
        width: 10,
      ),
      Text(
        text,
        style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            shadows: [Shadow(color: Colors.black, blurRadius: 1)]),
      ),
    ],
  );
}
