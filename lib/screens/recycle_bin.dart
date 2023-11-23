import 'package:flutter/material.dart';
import 'package:todolist/screens/my_drawer.dart';
import 'package:todolist/widgets/task_list.dart';

import '../blocs/blocs_export.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});
  static const id = 'recycle_bin_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.add))
            ],
          ),
          drawer: const MyDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.removedTasks.length} Tasks'),
                ),
              ),
              TaskList(tasksList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
