import 'dart:convert';
import 'package:fend_flutter/data/dummy_data.dart';
import 'package:http/http.dart' as http;
import 'package:fend_flutter/widgets/game_task_set.dart';
import 'package:fend_flutter/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

class TasksOverview extends StatefulWidget {
  @override
  State<TasksOverview> createState() => _TasksOverviewState();
}

class _TasksOverviewState extends State<TasksOverview> {
  List<GameTaskSets> _gameTaskSets = [];
  final String _baseUrl = 'http://127.0.0.1:8000';
  final String _userName = 'bledsoef';

  @override
  void initState() {
    super.initState();
    _getGroupedTasks();
  }

  Future<void> _getGroupedTasks() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/getTasksForUser?username=$_userName'));
      print('$_baseUrl/getTasksForUser?user=$_userName');
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = json.decode(response.body);
        setState(() {
          _gameTaskSets = jsonData.entries.map((entry) {
            return GameTaskSets(gameName: entry.key, gameData: entry.value);
          }).toList();
        });
        print('API Response: $jsonData'); // You can handle the API response here
      } else {
        print('API Error: ${response.statusCode}');
        // You can handle the API error here
      }
    } catch (error) {
      print('API Error: $error');
      // You can handle other errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text(kTitle),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            // color: Colors.black,
            image: DecorationImage(
              image: AssetImage("assets/pexels-ivan-samkov-6648586.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _gameTaskSets,
          ),
        ),
      ),
    );
  }
}
