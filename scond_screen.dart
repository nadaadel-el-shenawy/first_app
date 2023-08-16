import 'package:first_app/cubit/todos_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodosCubit(),
      child: BlocConsumer<TodosCubit, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodosError) {
            return const Center(
              child: Text("Error"),
            );
          }
          return ListView.builder(
            itemCount: context.watch<TodosCubit>().todo.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(context.watch<TodosCubit>().todo[index].title ?? "--"),
                // subtitle: Text(context.watch<TodosCubit>().todo[index].completed ?? "--"),
                trailing: const Icon(Icons.person),
                leading: Text(context.watch<TodosCubit>().todo[index].id.toString() ?? "--"),
              );
            },
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}