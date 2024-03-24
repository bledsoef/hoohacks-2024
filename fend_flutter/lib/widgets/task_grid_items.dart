import 'package:fend_flutter/models/task.dart';
import 'package:fend_flutter/screens/tasks.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TaskGridItems extends StatelessWidget {
  const TaskGridItems({super.key, required this.task, required this.isExpired});

  final Task task;
  final bool isExpired;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => TasksScreen(task: task,))));
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // )
        ),
        child: !isExpired ? CurrentList(task: task): ExpiredList(task: task) ,
      ),
    );
  }
}

class CurrentList extends StatelessWidget {
  const CurrentList({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(task.networkImage),
            fit: BoxFit.cover,
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [ 
                Text( 
                  "Task: ${task.taskDescription}",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold, 
                    color: Colors.white
                  ),
                ),
                
                Text( 
                  "Reward: ${task.rewardDescription}",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold, 
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}


class ExpiredList extends StatelessWidget {
  const ExpiredList({
    super.key,
    required this.task
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: FadeInImage(
            placeholder: MemoryImage(kTransparentImage),
            image: NetworkImage(task.networkImage),
            fit: BoxFit.cover,
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            color: Colors.black54,
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [ 
                Text( 
                  task.status == "Completed" ? "YOU DID IT!" : "FAILED!",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold, 
                    color: task.status == "Completed" ? Colors.green : Colors.red
                  ),
                ),
                Text( 
                  "Task: ${task.taskDescription}",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold, 
                    color: Colors.white
                  ),
                ),     
              ],
            ),
          ),
        ),
      ],
    );
  }
}