import 'package:panda_test/features/auth/data/datasources/auth_data_source.dart';
import 'package:panda_test/features/auth/domain/repos/auth_repository.dart';

import '../../domain/entities/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<User> login(String username) async {
    final result = await authDataSource.login(username);
    return User(username: username, accessToken: result['accessToken']);
  }
}
