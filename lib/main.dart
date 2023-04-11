import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey.shade900,
        ),
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final List<int> items = [
    for (int i = 17; i <= 31; i++) i,
  ];

  final List<Map<String, dynamic>> cardItems = [
    {
      "from": MyTime(hour: 11, min: 30),
      "to": MyTime(hour: 12, min: 20),
      "title": "Design meeting",
      "participants": [
        "Alex",
        "Helena",
        "Nana",
      ],
      "color": Colors.lightGreen,
    },
    {
      "from": MyTime(hour: 12, min: 35),
      "to": MyTime(hour: 14, min: 10),
      "title": "Daily project",
      "participants": [
        "Me",
        "Richard",
        "City",
        "Nana",
        "Else",
        "Some",
        "one",
      ],
      "color": Colors.lightGreen,
    },
    {
      "from": MyTime(hour: 11, min: 30),
      "to": MyTime(hour: 12, min: 20),
      "title": "Design meeting",
      "participants": [
        "Alex",
        "Helena",
        "Nana",
      ],
      "color": Colors.lightGreen,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade900,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CircleAvatar(
                          foregroundImage: AssetImage('assets/avatar.png'),
                          radius: 30,
                        ),
                        Icon(
                          Icons.add,
                          size: 40,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Monday 16",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'TODAY',
                                  style: TextStyle(
                                    fontSize: 42,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 3,
                                  ),
                                ),
                                const Text(
                                  '·',
                                  style: TextStyle(
                                    fontSize: 42,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Expanded(
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          Text(items[index].toString(),
                                              style: TextStyle(
                                                color: Colors.grey.shade600,
                                                fontSize: 40,
                                              )),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(width: 25, height: 25),
                                      itemCount: items.length),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ],
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  color: Colors.pink,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTime {
  final int hour;
  final int min;
  MyTime({required this.hour, required this.min});
}

class MyCard extends StatelessWidget {
  final String title;
  final MyTime from;
  final MyTime to;
  final List<String> participants;
  final Color backgroundColor;
  const MyCard(
      {Key? key,
      required this.title,
      required this.from,
      required this.to,
      required this.participants,
      required this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxHeight =
        max(MediaQuery.of(context).size.height / 4, 200).toDouble();
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: boxHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
        ),
      ),
    );
  }
}
