import 'package:education_app/core/usecase/usecase.dart';
import 'package:education_app/core/utils/typedef.dart';
import 'package:education_app/src/authentication/domain/entities/user.dart';
import 'package:education_app/src/authentication/domain/repository/authentication_repository.dart';

class GetUsers extends UseCaseWithoutParams<ResultFuture<List<User>>> {
  final AuthenticationRepository _repository;

  GetUsers(this._repository);

  @override
  ResultFuture<List<User>> call() {
    return _repository.getUsers();
  }
}
