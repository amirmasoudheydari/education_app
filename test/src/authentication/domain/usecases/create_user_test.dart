import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/failure.dart';
import 'package:education_app/src/authentication/domain/repository/authentication_repository.dart';
import 'package:education_app/src/authentication/domain/usecase/create_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthenticationRepository {}

void main() {
  late AuthenticationRepository repository;
  late CreateUser usecase;
  late CreateUserParams params;

  setUp(() {
    repository = MockAuthRepo();
    usecase = CreateUser(repository);
    params = const CreateUserParams.empty();
  });

  test("test createUser usecase ", () async {
    // Arrange
    when(() => repository.createUser(
            createdAt: any(named: "createdAt"),
            name: any(named: "name"),
            avatar: any(named: "avatar")))
        .thenAnswer((invocation) async => const Right<Failure, void>(null));

    // Act
    final result = await usecase(params);

    // Assert
    expect(result, equals(const Right<dynamic, void>(null)));

    verify(() => repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar)).called(1);

    verifyNoMoreInteractions(repository);
  });
}
