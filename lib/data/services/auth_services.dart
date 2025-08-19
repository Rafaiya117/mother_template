import 'package:dio/dio.dart';
import 'package:mother_template/data/models/user_model.dart';

class AuthService {
  final Dio _dio = Dio();
  final String _baseurl = '';

  Future<Usermodel?> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '',
        data: {email, password},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      if (response.statusCode == 200 && response.data['success'] == true) {
        return Usermodel.fromJson(response.data['user']);
      } else {
        throw Exception(response.data['message'] ?? 'Login Failed');
      }
    } catch (e) {
      print('Login error $e');
      return null;
    }
  }

  Future<Usermodel?> registration(String username,String useremail,String password,) async {
    try {
      final response = await _dio.post(
        '',
        data: {username, useremail, password},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      if (response.statusCode == 200 && response.data['success'] == true) {
        return Usermodel.fromJson(response.data['user']);
      } else {
        throw Exception(response.data['message']??'SignUp failed');
      }
    } catch (e) {
      return null;
    }
  }
}