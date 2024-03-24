import 'dart:io';
import 'package:fend_flutter/models/task.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key, required this.task});

  final Task task;

  @override
  State<TasksScreen> createState() {
    return _TasksScreenState();
  }
}

class _TasksScreenState extends State<TasksScreen> {
  void selectFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.task.networkImage);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.task.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              widget.task.networkImage,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Task Details",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Text(widget.task.taskDescription,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground)),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Reward",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Text(
              widget.task.rewardDescription,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      "Complete by",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      widget.task.expirationDate,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Category",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Text(
                      widget.task.category,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Progress",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: LinearPercentIndicator(
                percent: widget.task.progress / widget.task.quantity,
                animation: true,
                lineHeight: 40.0,
                animationDuration: 1000,
                linearStrokeCap: LinearStrokeCap.roundAll,
                barRadius: const Radius.circular(16),
                center: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "${widget.task.progress} / ${widget.task.quantity}      "),
                      Text(
                          "${(widget.task.progress / widget.task.quantity) * 100}%"),
                    ]),
                backgroundColor:
                    Colors.grey[300], // Light grey color for the unfilled part
                progressColor:
                    (widget.task.progress / widget.task.quantity) < 0.35
                        ? Colors.red // Progress less than 35%
                        : (widget.task.progress / widget.task.quantity) <= 0.75
                            ? Colors.blue // Progress between 35% and 75%
                            : Colors.green, // Progress more than 75%
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  selectFile();
                },
                child: const Text("Upload proof"))
          ],
        ));
  }
}
