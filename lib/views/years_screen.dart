import 'package:flutter/material.dart';

void main() => runApp(YearsScreen());

class YearsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Map<int, int> articlesPerYear = {
      1401: 1,
      1400: 37,
      1399: 28,
      1398: 51,
      1397: 44,
      1396: 61,
      1395: 47,
      1394: 55,
      1393: 47,
      1392: 45,
      1391: 56,
      1390: 63,
      1389: 55,
      1388: 54,
      1387: 44,
      1386: 48,
      1385: 47,
      1384: 58,
      1383: 51,
      1382: 40,
      1381: 34,
      1380: 30,
      1379: 35,
      1378: 35,
      1377: 39,
      1376: 41,
      1375: 31,
      1374: 35,
      1373: 23,
      1372: 48,
      1371: 65,
      1370: 104,
      1369: 85,
      1368: 86
    };
    int lastYear = 1401;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: articlesPerYear.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(2),
            padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 10),
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
