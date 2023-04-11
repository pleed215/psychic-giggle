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
      "color": Colors.yellowAccent,
    },
    {
      "from": MyTime(hour: 12, min: 35),
      "to": MyTime(hour: 14, min: 10),
      "title": "Daily project",
      "participants": [
        "Me",
        "Richard",
        "Ciry",
        "Nana",
        "Else",
        "Some",
        "one",
      ],
      "color": Colors.deepPurpleAccent,
    },
    {
      "from": MyTime(hour: 11, min: 30),
      "to": MyTime(hour: 12, min: 20),
      "title": "Weakly Planning",
      "participants": [
        "Alex",
        "Helena",
        "Nana",
      ],
      "color": Colors.lightGreenAccent,
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
                          Text(
                            "MONDAY 16",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Colors.grey.shade200,
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
                                    fontWeight: FontWeight.w500,
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
              const SizedBox(height: 30),
              Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      itemBuilder: (context, index) {
                        final item = cardItems[index];
                        return MyCard(
                          title: item['title']!,
                          from: item['from']!,
                          to: item['to']!,
                          backgroundColor: item['color']!,
                          participants: item['participants']!,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 8),
                      itemCount: cardItems.length)),
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
        max(MediaQuery.of(context).size.height / 4.4, 200).toDouble();
    final slicedMember = participants.length > 4
        ? [...participants.sublist(0, 3), "+${participants.length - 3}"]
        : participants;

    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: boxHeight,
        padding: const EdgeInsets.only(
          top: 30,
          bottom: 20,
          left: 18,
          right: 18,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MyTimeWidget(time: from),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.symmetric(
                          vertical: BorderSide(
                            color: Colors.grey.shade800,
                            width: 0.5,
                          ),
                        )),
                      ),
                    ),
                    MyTimeWidget(time: to),
                  ],
                ),
                const SizedBox(width: 18),
                Expanded(
                  child: Text(
                    title.toUpperCase(),
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 68,
                      fontWeight: FontWeight.w500,
                      height: 0.9,
                      letterSpacing: -3.0,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (final member in slicedMember)
                    Text(
                      member.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: member.toUpperCase() != "ME"
                            ? const Color(0x00444444).withOpacity(0.6)
                            : Colors.grey.shade900,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  // fake space
                  if (slicedMember.length < 4)
                    for (int i = 0; i < 4 - slicedMember.length; i++)
                      const SizedBox(width: 1)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTimeWidget extends StatelessWidget {
  final MyTime time;
  const MyTimeWidget({Key? key, required this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
          child: Text(
            time.hour.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade900,
            ),
          ),
        ),
        Text(
          time.min.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade900,
          ),
        ),
      ],
    );
  }
}
