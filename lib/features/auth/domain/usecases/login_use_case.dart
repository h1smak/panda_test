import 'package:panda_test/features/auth/domain/entities/user.dart';
import 'package:panda_test/features/auth/domain/repos/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<User> execute(String username) {
    return authRepository.login(username);
  }
}
