import 'package:fend_flutter/data/dummy_data.dart';
import 'package:fend_flutter/models/task.dart';
import 'package:fend_flutter/widgets/task_grid_items.dart';
import 'package:flutter/material.dart';

class GameTasksScreen extends StatelessWidget{

  const GameTasksScreen({super.key, required this.task});

  final String task;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("GamesList"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 3 / 2,
            // crossAxisSpacing: 20,
            // mainAxisSpacing: 20,
          ),
        children: [
          for (final category in codTasks)
            TaskGridCategory(
              task: category,
              onTap: () {
                // _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }

}