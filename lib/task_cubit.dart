import 'task.dart';
import 'task_state.dart';
import 'package:bloc/bloc.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(const TaskState(taskList: []));

  void addTask(String text) {
    final taskList = [...state.taskList, Task(name: text)];
    emit(TaskState(taskList: taskList));
  }

  void deleteTask(Task task) {
    var newList = [...state.taskList];
    final taskList = state.copyWith(taskList: newList..remove(task));
    emit(taskList);
  }
  // state is mutable
}
