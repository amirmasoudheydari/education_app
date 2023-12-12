import 'package:education_app/core/usecase/usecase.dart';
import 'package:education_app/core/utils/typedef.dart';
import 'package:education_app/src/authentication/domain/repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';

class CreateUser extends UseCaseWidthParams<VoidFuture, CreateUserParams> {
  final AuthenticationRepository _repository;

  CreateUser(this._repository);

  @override
  VoidFuture call(CreateUserParams params) {
    return _repository.createUser(
        createdAt: params.createdAt,
        name: params.createdAt,
        avatar: params.avatar);
  }
}

class CreateUserParams extends Equatable {
  final String createdAt;
  final String name;
  final String avatar;

  const CreateUserParams(
      {required this.createdAt, required this.name, required this.avatar});

  const CreateUserParams.empty()
      : this(createdAt: 'empty', name: 'empty', avatar: 'empty');

  @override
  List<Object> get props => [createdAt, name, avatar];
}
