import 'package:fend_flutter/models/task.dart';
import 'package:fend_flutter/screens/tasks.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TaskGridCategory extends StatelessWidget {
  const TaskGridCategory({super.key, required this.task});

  final Task task;

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
          // image: FadeInImage,
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight
          // )
        ),
        child: Stack(
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
                      "Task: ${task.details}",
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
                      "Reward: ${task.reward}",
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
        ),
      ),
    );
  }
}
