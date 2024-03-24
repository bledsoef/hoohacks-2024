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
                      builder: (context) => GameTasksScreen(
                          gameName: gameName, gameData: gameData)));
                },
                child: Text(
                  "View all",
                  style: TextStyle(color: Colors.orangeAccent[100]),
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
                width: MediaQuery.of(context).size.width / 2.5, // Card width
                child: Card(
                  color: Colors.orange[400],
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          children: [
                            Text(
                              "Task",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Colors.white
                              ),
                            ),
                            Text(
                              task["taskDescription"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "Reward",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              task["rewardDescription"],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ],
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
