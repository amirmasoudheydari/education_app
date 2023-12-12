import 'package:education_app/core/utils/typedef.dart';
import 'package:education_app/src/authentication/domain/entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  VoidFuture createUser(
      {required String createdAt,
      required String name,
      required String avatar});

  ResultFuture<List<User>> getUsers();
}
