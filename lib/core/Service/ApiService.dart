import 'package:dio/dio.dart';
import 'package:linkyoutask/features/UsersListPage/Data/UserListModel.dart';

class ApiService{
  final Dio dio=Dio();
  Future<Map<String,dynamic>> getUsers()async{
    var response =await dio.get('https://reqres.in/api/users?page=2');
    
    return response.data;
  }

Future<void> postData(String email) async {
  try {
    String apiUrl = 'https://reqres.in/api/users';
    Map<String, dynamic> data = {'name': email};
    Response response = await dio.post(apiUrl, data: data);
    if (response.statusCode == 201) {
      print('Post successful: ${response.data}');
    } else {
      print('Failed to post data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('Dio error: $error');
  }
}




   
 

}