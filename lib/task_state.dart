
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_block/task.dart';

class TaskState extends Equatable
{
  final List<Task> taskList ;


  const TaskState({required this.taskList});
  @override
  // TODO: implement props
  List<Object?> get props => [taskList];

  TaskState copyWith({
  List<Task>? taskList,
})
  {
    return TaskState(
      taskList: taskList ?? this.taskList,
    );
  }

}

