import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/widgets/task_tile.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          padding: const EdgeInsets.all(20.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ExpansionPanelList.radio(
              dividerColor: Colors.white,
              expandIconColor: Colors.white,
              elevation: 8.0,
              children: tasksList
                  .map((task) => ExpansionPanelRadio(
                        value: task.id,
                        backgroundColor: Colors.red.shade300,
                        headerBuilder: (context, isOpen) =>
                            TaskTile(task: task),
                        body: ListTile(
                          title: SelectableText.rich(TextSpan(children: [
                            const TextSpan(
                                text: 'Title\n',
                                style: TextStyle(
                                    fontSize: 9,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            TextSpan(
                                text: task.title,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            const TextSpan(
                                text: '\n\nDescription\n',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            TextSpan(
                                text: task.description,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white))
                          ])),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
