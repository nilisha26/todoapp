part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> allTasks;
  final List<Task> removedTasks;

  const TasksState({
    this.pendingTasks = const <Task>[],
    this.completedTasks = const <Task>[],
    this.allTasks = const <Task>[],
    this.removedTasks = const <Task>[],
  });

  @override
  List<Object> get props =>
      [pendingTasks, completedTasks, allTasks, removedTasks];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result
        .addAll({'pendingTasks': pendingTasks.map((x) => x.toMap()).toList()});
    result.addAll(
        {'completedTasks': completedTasks.map((x) => x.toMap()).toList()});
    result.addAll({'allTasks': allTasks.map((x) => x.toMap()).toList()});
    result
        .addAll({'removedTasks': removedTasks.map((x) => x.toMap()).toList()});

    return result;
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      completedTasks:
          List<Task>.from(map['completedTasks']?.map((x) => Task.fromMap(x))),
      pendingTasks:
          List<Task>.from(map['pendingTasks']?.map((x) => Task.fromMap(x))),
      allTasks:
          List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x))),
      removedTasks:
          List<Task>.from(map['removedTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}
