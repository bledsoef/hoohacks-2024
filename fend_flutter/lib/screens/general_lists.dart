import 'package:fend_flutter/data/dummy_data.dart';
import 'package:fend_flutter/widgets/task_grid_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GeneralListsScreen extends StatelessWidget {
  final testCategories = [1,2,3,4,5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GamesList"),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            // childAspectRatio: 3 / 2,
            // crossAxisSpacing: 20,
            // mainAxisSpacing: 20,
          ),
        children: [
          for (final category in codTasks)
            TaskGridCategory(
              task: category,
              onTap: () {
                // _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
