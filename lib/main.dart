import 'package:flutter/material.dart';
import 'package:todo_block/task_cubit.dart';
import 'task_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TaskCubit>
      (create: (context) => TaskCubit(),
      child: MaterialApp(
        home: const TaskList(),
        theme: ThemeData(
          primarySwatch: Colors.grey
        ),
      ),
    );
  }
}

