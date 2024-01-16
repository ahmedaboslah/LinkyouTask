import 'package:bloc/bloc.dart';
import 'package:linkyoutask/core/Service/ApiService.dart';
import 'package:linkyoutask/features/UsersListPage/Data/UserListModel.dart';
import 'package:meta/meta.dart';

part 'user_list_state.dart';

class ListUsersCubit extends Cubit<UserListState> {
  ListUsersCubit() : super(UserListInitial());
  ApiService apiService = ApiService();
  Future<void> ListUser() async {
    emit(UserListLoading());
    try {
      Map<String, dynamic> Jsondata = await apiService.getUsers();
      List<dynamic> Users = Jsondata['data'];
      List<UserListModel> userlistmodel = [];
      for (var user in Users) {
        UserListModel userlist = UserListModel(
            avatar: user['avatar'],
            email: user['email'],
            firstName: user['first_name'],
            lastName: user['last_name']);
        userlistmodel.add(userlist);
      }
      emit(UserListSuccess(userlistmodel: userlistmodel));
    } on Exception catch (e) {
      emit(UserListFailure(errmessag: e.toString()));
    }
  }
}
