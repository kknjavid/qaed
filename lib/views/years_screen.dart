import 'package:flutter/material.dart';

class YearsScreen extends StatelessWidget {
  const YearsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int curYear = 1401;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 34,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage("assets/pics/${curYear - index}.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomListTile(text: "${curYear - index}",icon: Icons.calendar_month, size: 14),
                CustomListTile(text: "۸۸ سخنرانی",icon: Icons.mic, size: 14),
              
              ],
            ),
          );
        },
      ),
    );
  }

  TextButton CustomListTile({required String text,required IconData icon, required double size}) => TextButton.icon(
      onPressed: null,

      style: ButtonStyle(
       
        visualDensity: VisualDensity(vertical: -4),
      ),
      icon: Icon(icon, color: Colors.white, size: size),
      label: Text(
        text,
        style: TextStyle(color: Colors.white),
      ));
}
