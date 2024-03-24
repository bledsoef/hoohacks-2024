import 'package:fend_flutter/data/dummy_data.dart';
import 'package:fend_flutter/screens/game_tasks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameTaskSets extends StatelessWidget {
  const GameTaskSets({
    super.key,
    required this.gameName
  });

  final String gameName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
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
                          GameTasksScreen(gameName: gameName)));
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
            itemCount: 5,
            itemBuilder: (context, index) {
              return SizedBox(
                width: MediaQuery.of(context).size.width /
                    3, // Card width
                child: Card(
                  color: Colors.pink[200],
                  // elevation: 4.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "Task",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Text(
                          codTasks[index].details,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "Reward",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                        Text(
                          codTasks[index].reward,
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 12),
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
