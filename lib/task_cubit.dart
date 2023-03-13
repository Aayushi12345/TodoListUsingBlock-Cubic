import 'package:flutter/material.dart';
import 'task.dart';
import 'task_state.dart';
import 'package:bloc/bloc.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState(taskList: []));

  void addTask(String text) {
    final taskList = [...?state.taskList, Task(name: text)];
    emit(TaskState(taskList: taskList));
  }

  void deleteTask(Task task) {
    var newList = [...?state.taskList];
    final taskList = state.copyWith(taskList: newList..remove(task));

    // newList.remove(task);
    // final myList = state.copyWith(taskList: newList);
    emit(taskList);
  }
  // state is mutable


// void addTask(String text)
// {
//   var taskList = state.taskList;
//   var list = state.taskList.
//
//
//      taskList?.add(Task(name: text));
//
//   final list=taskList;
//   // add(Task(name:text));
//  emit(TaskState(taskList: list));
//   // print(text);
// }

}
