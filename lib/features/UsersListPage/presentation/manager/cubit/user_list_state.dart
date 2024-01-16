part of 'user_list_cubit.dart';

@immutable
sealed class UserListState {}

final class UserListInitial extends UserListState {}
final class UserListLoading extends UserListState {}
final class UserListFailure extends UserListState {
  String errmessag;
  UserListFailure({required this.errmessag});
}
final class UserListSuccess extends UserListState {
  List<UserListModel> userlistmodel;
  UserListSuccess({required this.userlistmodel});
}

