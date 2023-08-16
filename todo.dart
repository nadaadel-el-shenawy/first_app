import 'package:dio/dio.dart';
import 'package:first_app/models/todo_model.dart';


class UserServices{
  String url ='https://jsonplaceholder.typicode.com/todos';
  final dio = Dio();

  getUser() async {
    List <TodoModel> todoList =[];
    final response = await dio.get(url);
    var data =response.data;
    data.forEach((element){
      TodoModel todo = TodoModel.fromJson(element);
      todoList.add(todo);
    });
    return todoList;
  }
}