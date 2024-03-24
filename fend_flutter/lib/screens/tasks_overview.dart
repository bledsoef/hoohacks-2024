import 'package:fend_flutter/data/dummy_data.dart';
import 'package:fend_flutter/screens/game_tasks.dart';
import 'package:fend_flutter/widgets/game_task_set.dart';
import 'package:fend_flutter/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksOverview extends StatefulWidget {
  @override
  State<TasksOverview> createState() => _TasksOverviewState();
}

class _TasksOverviewState extends State<TasksOverview> {
  final networkImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWoXOj6dfCvRGhoatDxpGlIRPBb9k5Dr35z9dgRaiQ_g&s";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text(kTitle),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.black
              // image: DecorationImage(
              //   image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWoXOj6dfCvRGhoatDxpGlIRPBb9k5Dr35z9dgRaiQ_g&s"),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (final game in gameNames)
                GameTaskSets(gameName: game)
            ],
          ),
        ),
      ),
    );
  }
}

