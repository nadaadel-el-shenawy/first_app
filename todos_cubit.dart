import 'package:bloc/bloc.dart';
import 'package:first_app/models/todo_model.dart';
import 'package:first_app/services/user_service.dart';
import 'package:meta/meta.dart';


part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial()){
    getMyUsers();
  }
  List<TodoModel> todo = [];

  getMyUsers() async {
    try {
      emit(TodosLoading());
      todo = await UserServices().getUser();
      emit(TodosSuccess());
    } catch (e) {
      print(e.toString());
      emit(TodosError());
    }
  }


}