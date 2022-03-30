import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qaed/database/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'qaed',
      // ignore: prefer_const_literals_to_create_immutables
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('fa', ''), // farsi
      ],
     
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.light,
        fontFamily: "vazir",
        scaffoldBackgroundColor: Color.fromARGB(255, 226, 226, 226),
        listTileTheme: ListTileThemeData(tileColor: Colors.white)
      ),

      home: Scaffold(
        appBar: AppBar(
          title: const Text("نرم افزار قائد"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: FutureBuilder(
            future: DbHelper.instance.getAllSokhan(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text(snapshot.data![index].id.toString()),
                        ),
                        title: Text(snapshot.data![index].title,
                            overflow: TextOverflow.ellipsis, maxLines: 1),
                        subtitle: Text(snapshot.data![index].date),
                        trailing: Image(image: AssetImage("assets/pics/1401.jpg"),),
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      darkTheme:ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color.fromARGB(255, 78, 78, 78),
        textTheme:TextTheme(bodyText1: TextStyle(color: Colors.amber)),
        listTileTheme: ListTileThemeData(
          textColor: Color.fromARGB(255, 204, 218, 255),
          tileColor: Color.fromARGB(31, 0, 0, 0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          style: ListTileStyle.list,
        ),
        
      ), //appbarText
    );
  }
}
