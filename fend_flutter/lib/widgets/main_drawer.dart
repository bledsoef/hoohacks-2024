import 'package:fend_flutter/data/dummy_data.dart';
import 'package:fend_flutter/screens/game_tasks.dart';
import 'package:fend_flutter/screens/tasks.dart';
import 'package:fend_flutter/screens/tasks_overview.dart';
import 'package:fend_flutter/widgets/game_task_set.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
            ])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.health_and_safety,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Text(
                  kTitle,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.task_alt,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TasksOverview()));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.gamepad_outlined, 
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              "Past tasks",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24),
            ),
            onTap: (){
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: ((context) => const GameTasksScreen(gameName: "Expired", gameData: {}))));
            },
          ),
        ],
      ),
    );
  }
}