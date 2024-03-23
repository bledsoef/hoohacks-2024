
import 'package:fend_flutter/models/task.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class TaskGridCategory extends StatelessWidget{


  const TaskGridCategory({super.key, required this.task, required this.onTap});

  final Task task;
  final void Function() onTap;

  @override
  Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
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
        child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(task.networkImage),
              fit: BoxFit.cover,
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
      ),
    );
  }

}