import 'package:flutter/material.dart';
import 'package:panda_test/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:panda_test/features/auth/data/repos/auth_repository_impl.dart';
import 'package:panda_test/features/auth/domain/entities/user.dart';
import 'package:panda_test/features/auth/domain/usecases/login_use_case.dart';

class AuthProvider with ChangeNotifier {
  final LoginUseCase _loginUseCase = LoginUseCase(
    authRepository: AuthRepositoryImpl(
      authDataSource: AuthRemoteDataSource(
        baseUrl: 'http://34.60.180.123:3000',
      ),
    ),
  );

  User? _user;
  bool _isLoading = false;

  User? get user => _user;
  bool get isLoading => _isLoading;

  Future<void> login(String username) async {
    _isLoading = true;
    notifyListeners();

    try {
      _user = await _loginUseCase.execute(username);
    } catch (e) {
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
