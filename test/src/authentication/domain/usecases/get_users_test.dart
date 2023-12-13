import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/failure.dart';
import 'package:education_app/core/usecase/get_users.dart';
import 'package:education_app/src/authentication/domain/entities/user.dart';
import 'package:education_app/src/authentication/domain/repository/authentication_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'authentication_repository.mock.dart';

void main() {
  late AuthenticationRepository repository;
  late GetUsers usecase;
  late List<User> tResponse;

  setUp(() {
    repository = MockAuthRepo();
    usecase = GetUsers(repository);
    tResponse = [const User.empty()];
  });

  test("should call [AuthRepo.getUsers] and return [List<User>]", () async {
    // Arrange
    when(() => repository.getUsers()).thenAnswer(
        (invocation) async => Right<Failure, List<User>>(tResponse));

    // Act
    final result = await usecase();

    // Assert
    expect(result, equals(Right<Failure, List<User>>(tResponse)));
    verify(() => repository.getUsers()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
