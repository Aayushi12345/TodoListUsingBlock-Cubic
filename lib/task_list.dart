import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_block/task_cubit.dart';
import 'task_state.dart';
import 'task_cubit.dart';
import 'task.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = "";
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          'Add Task',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        TextField(
                          autofocus: true,
                          textAlign: TextAlign.center,
                          onChanged: (newText) {
                            newTaskTitle = newText;
                          },
                        ),
                        TextButton(
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.pink,
                              backgroundColor: Colors.green

                            ),
                          ),
                          onPressed: () {
                            BlocProvider.of<TaskCubit>(context)
                                .addTask(newTaskTitle);
                            Navigator.pop(context);
                            // context.read<TaskCubit>().addTask(newTaskTitle);

                            // Provider.of<TaskCubit>(context,listen:false)
                            //     .addTask
                          },
                        ),
                      ],
                    )));
          }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list_alt,
                    size: 30.0,
                    color: Colors.green,
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Todo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "${context.watch<TaskCubit>().state.taskList?.length ?? 0}  Tasks",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
            return Expanded(
                child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: ListView.builder(
                itemCount: state.taskList?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      final task = state.taskList![index].name;
                      print(task);
                      BlocProvider.of<TaskCubit>(context)
                          .deleteTask(state.taskList![index]);
                    },
                    leading: Icon(Icons.delete),

                    title: Text(state.taskList[index].name.toString()),
                  );
                },
              ),
            ));
          }),
        ],
      ),
    );
  }
}
