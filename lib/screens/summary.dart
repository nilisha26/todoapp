import 'package:flutter/material.dart';
import 'package:todolist/blocs/blocs_export.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/screens/my_drawer.dart';
import 'package:todolist/widgets/task_list.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});
  static const id = 'summary_screen';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(builder: (context, state) {
      List<Task> pendingTaskList = state.pendingTasks;
      List<Task> completedTaskList = state.completedTasks;

      return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
            title: const Text(
          'Summary',
        )),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 300,
                  child: ListView.builder(
                      itemCount: pendingTaskList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            pendingTaskList[index].title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 300,
                  child: ListView.builder(
                      itemCount: completedTaskList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            completedTaskList[index].title,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        );
                      }),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
