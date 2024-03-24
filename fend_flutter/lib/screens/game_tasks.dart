import 'package:fend_flutter/data/dummy_data.dart';
import 'package:fend_flutter/models/task.dart';
import 'package:fend_flutter/widgets/task_grid_items.dart';
import 'package:flutter/material.dart';

class GameTasksScreen extends StatelessWidget{

  const GameTasksScreen({super.key, required this.gameName});

  final String gameName;

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text(gameName),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        children: [
          for (final category in taskLists[gameName]!)
            TaskGridItems(
              task: category,
              isExpired: gameName == "Expired" ? true : false,
            )
        ],
      ),
    );
  }

}