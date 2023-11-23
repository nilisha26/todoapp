import 'package:flutter/material.dart';
import 'package:todolist/models/task.dart';

class PopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  const PopupMenu(
      {super.key, required this.cancelOrDeleteCallback, required this.task});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        iconColor: Colors.yellowAccent,
        itemBuilder: task.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                    onTap: () {},
                  ),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete'))),
                ]
            : (context) => [
                  PopupMenuItem(
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.restore_from_trash),
                          label: const Text('Restore')),
                      onTap: () => cancelOrDeleteCallback),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete Forever'))),
                ]);
  }
}
