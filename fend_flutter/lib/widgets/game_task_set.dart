import 'package:fend_flutter/screens/game_tasks.dart';
import 'package:flutter/material.dart';

class GameTaskSets extends StatelessWidget {
  const GameTaskSets({Key? key, required this.gameName, required this.gameData})
      : super(key: key);

  final String gameName;
  final Map<String, dynamic> gameData;

  @override
  Widget build(BuildContext context) {
    List<dynamic> assignedTasks = gameData["assigned"];
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                gameName,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          GameTasksScreen(gameName: gameName, gameData: gameData)));
                },
                child: Text(
                  "View all",
                  style: TextStyle(color: Colors.pink[300]),
                ))
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 4.5,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: assignedTasks.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> task = assignedTasks[index];
              return SizedBox(
                width: MediaQuery.of(context).size.width /
                    3, // Card width
                child: Card(
                  color: Colors.pink[200],
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Task",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          task["taskDescription"],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Reward",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Text(
                          task["rewardDescription"],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
