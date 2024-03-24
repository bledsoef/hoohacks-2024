import 'package:fend_flutter/models/task.dart';
import 'package:fend_flutter/widgets/task_grid_items.dart';
import 'package:flutter/material.dart';

class GameTasksScreen extends StatelessWidget{

  const GameTasksScreen({super.key, required this.gameName, required this.gameData});

  final String gameName;
  final Map<String, dynamic> gameData;
  @override
  Widget build(BuildContext context){
    List<dynamic> assignedTasks = gameData["assigned"];
    return Scaffold(
      appBar: AppBar(
        title: Text(gameName),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
        children: [
          for (final task in assignedTasks!)
            TaskGridItems(
              task: GameTask(
                gameName: gameName,
                id: task["id"] ?? "",
                title: task["title"] ?? "", // If task["title"] is null, use an empty string
                taskDescription: task["taskDescription"] ?? "",
                rewardDescription: task["rewardDescription"] ?? "",
                status: task["status"] ?? "",
                networkImage: task["networkImage"] ?? "", // Assuming you want an empty string if this is null, no need for conditional handling
                quantity: task["quantity"] ?? 0, // If task["quantity"] is null, use 0
                metric: task["metric"] ?? "",
                dateCompleted: task["dateCompleted"] ?? "",
                expirationDate: task["expirationDate"] ?? "",
                progress: 0, // Assuming progress can't be null based on your code
                category: task["category"] ?? "",
              ),
              isExpired: gameName == "Expired" ? true : false,
            )
      ],
      ),
    );
  }

}