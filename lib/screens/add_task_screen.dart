import 'package:flutter/material.dart';
import 'package:todolist/blocs/blocs_export.dart';
import 'package:todolist/models/task.dart';
import 'package:todolist/services/guid_gen.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({
    super.key,
  });

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
                title: Center(
                    child: Text('\nAdd Task',
                        style: TextStyle(
                            color: Colors.red.shade300,
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.bold,
                            fontSize: 24)))),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                autofocus: true,
                controller: titleController,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                minLines: 3,
                maxLines: 5,
                controller: descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Description'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel')),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade300,
                      ),
                      onPressed: () {
                        if (titleController.text != '') {
                          var task = Task(
                              id: GUIDGen.generate(),
                              title: titleController.text,
                              description: descriptionController.text,
                              date: DateTime.now().toString());
                          context.read<TasksBloc>().add(AddTask(task: task));
                        }

                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ],
        ),
      ),
    );
    //   return Container(
    //     padding:
    //         EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    //     color: const Color(0xff757575),
    //     child: Container(
    //       padding: const EdgeInsets.all(30),
    //       decoration: const BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.only(
    //             topRight: Radius.circular(20), topLeft: Radius.circular(20)),
    //       ),
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.stretch,
    //         children: [
    //           const Text(
    //             "Add Task",
    //             style: TextStyle(
    //               color: Colors.blueAccent,
    //               fontSize: 20,
    //               fontWeight: FontWeight.bold,
    //             ),
    //             textAlign: TextAlign.center,
    //           ),
    //           TextField(
    //             autofocus: true,
    //             controller: titleController,
    //             decoration: const InputDecoration(
    //               label: Text('Title'),
    //             ),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(top: 30.0),
    //             child: TextField(
    //               minLines: 3,
    //               maxLines: 5,
    //               controller: descriptionController,
    //               decoration: const InputDecoration(
    //                 border: OutlineInputBorder(),
    //                 label: Text('Description'),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           ElevatedButton(
    //             style: ElevatedButton.styleFrom(
    //               backgroundColor: Colors.blueAccent, // foreground
    //             ),
    //             onPressed: () {
    //               if (titleController.text.isNotEmpty &&
    //                   descriptionController.text.isNotEmpty) {
    //                 var task = Task(
    //                     id: GUIDGen.generate(),
    //                     title: titleController.text,
    //                     description: descriptionController.text,
    //                     date: DateTime.now().toString());
    //                 context.read<TasksBloc>().add(AddTask(task: task));
    //                 Navigator.pop(context);
    //               } else {
    //                 Navigator.pop(context);
    //               }
    //             },
    //             child: const Text(
    //               'Add',
    //               style: TextStyle(color: Colors.white),
    //             ),
    //           )
    //         ],
    //       ),
    //     ),
    // );
  }
}
