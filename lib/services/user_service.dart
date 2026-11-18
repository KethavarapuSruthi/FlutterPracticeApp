import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
    baseUrl: 'https://dummyjson.com',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));
});

final userServiceProvider = Provider<UserService>((ref) {
  return UserService(ref.watch(dioProvider));
});

class UserService {
  final Dio _dio;

  UserService(this._dio);

  Future<User> fetchUser() async {
    final response = await _dio.get('/users/1');
    return User.fromJson(response.data);
  }
}