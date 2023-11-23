import 'package:flutter/material.dart';
import 'package:todolist/blocs/blocs_export.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/widgets/task_list.dart';

class PendingTasksScreen extends StatelessWidget {
  const PendingTasksScreen({super.key});
  static const id = 'tasks_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> tasksList = state.pendingTasks;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Chip(
              label: Text(
                  '${tasksList.length} Pending | ${state.completedTasks.length} Completed'),
            ),
          ),
          TaskList(tasksList: tasksList)
        ],
      );
    });
  }
}