import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/api_service.dart';
import 'package:http_riverpod/model/create_user_model.dart';

class CreateUserNotifier extends StateNotifier<CreateUser?> {
  final ApiService apiService;
  CreateUserNotifier(this.apiService) : super(null);

  Future<void> createUser(String name, String job) async {
    try {
      final user = await apiService.createUser(name, job);
      state = user;
    } catch (e) {
      state = null;
    }
  }
}
