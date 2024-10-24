import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod/api_service.dart';
import 'package:http_riverpod/model/create_user_model.dart';
import 'package:http_riverpod/model/user_model.dart';
import 'package:http_riverpod/notifier/create_user_notifier.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final userListProvider = FutureProvider<List<User>>((ref) async {
  return ref.watch(apiServiceProvider).fetchUser();
});

final userProvider =
    StateNotifierProvider<CreateUserNotifier, CreateUser?>((ref) {
  return CreateUserNotifier(ref.read(apiServiceProvider));
});
