import 'dart:convert';
import 'dart:io';
import 'package:fend_flutter/models/task.dart';
import 'package:fend_flutter/screens/tasks_overview.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key, required this.task});

  final GameTask task;

  @override
  State<TasksScreen> createState() {
    return _TasksScreenState();
  }
}

class _TasksScreenState extends State<TasksScreen> {
  FilePickerResult? result;

  Future<void> _apiRequest(id) async {
    Map<String, dynamic> payloadData = {
      'fileId': id,
      'type': result!.files[0].name.split(".")[1],
      'email': 'mckenz318@gmail.com',
      'dateCreated': DateTime.now().toString(),
    };
  }

  Future<void> _uploadFiles() async {
    if (result == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No file selected'),
        ),
      );
      return;
    }

    try {
      for (var file in result!.files) {
        String id = '${DateTime.now().millisecondsSinceEpoch}_${file.name}';
        Reference storageReference =
            FirebaseStorage.instance.ref().child('$id');
        try {
          final response = await http.post(
            Uri.parse('http://127.0.0.1:8000/validateTask'),
            body: jsonEncode({
              "file_location": "$id",
              "task_id": widget.task.id
            }),
            headers: {
              'Content-Type': 'application/json',
            },
          );

          if (response.statusCode == 200) {
            print('API Response: ${response.body}');
          } else {
            print('API Error: ${response.statusCode}');
          }
        } catch (error) {
          print('API Error: $error');
        }
        if (file.bytes != null) {
          UploadTask uploadTask = storageReference.putData(file.bytes!);
          await uploadTask.whenComplete(() => null);
        } else {
          UploadTask uploadTask = storageReference.putFile(File(file.path!));
          await uploadTask.whenComplete(() => null);
        }
        _apiRequest(id);
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Files Uploaded Successfully'),
        ),
      );
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => TasksOverview())));
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error uploading files'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Visibility(
              visible: !widget.task.needsVerification, // Only show the button if needsVerification is true
              child:
                  Text(
                    "Progress",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Theme.of(context).colorScheme.primary),
                  )
            ),
            const SizedBox(
              height: 15,
            ),
            Visibility(
              visible: !widget.task.needsVerification, // Only show the button if needsVerification is true
              child: Padding(
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
              )
            ),
            
            const SizedBox(
              height: 30,
            ),
            Visibility(
              visible: widget.task.needsVerification, // Only show the button if needsVerification is true
              child: ElevatedButton(
                // onPressed: () {
                //   selectFile();
                // },
                onPressed: () async{
                  result = await FilePicker.platform.pickFiles(allowMultiple: false);
                  if (result == null) {
                      print("No file selected");
                  } else {
                    setState(() {});
                    for (var element in result!.files) {
                      print(element.name);
                    }
                    _uploadFiles();
                  }
                },
                child: const Text("Upload proof"),
              ),
            )
          ],
        ));
  }
}
