import 'dart:convert';

import 'package:education_app/core/utils/typedef.dart';
import 'package:education_app/src/authentication/data/model/user_model.dart';
import 'package:education_app/src/authentication/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();
  final String tJson = fixtureReader('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  test('tModel should subclass of [User]', () {
    expect(tModel, isA<User>());
  });

  group('from Map', () {
    test("should return a UserModel with right data", () {
      final result = UserModel.fromMap(tMap);

      expect(result, equals(tModel));
    });
  });

  group("from json", () {
    test("should return a data model with right data", () {
      // Act
      final result = UserModel.fromJson(tJson);

      expect(result, tModel);
    });
  });

  group("toMap", () {
    test('should return a map with right data', () {
      // Act
      final result = tModel.toMap();

      // Assert
      expect(result, equals(tMap));
    });
  });

  group("toJson", () {
    test("should return a [Json] string with right data", () {
      // Assert
      final result = tModel.toJson();
      final tJson = jsonEncode({
        "id": "1",
        "createdAt": "createdAt",
        "name": "name",
        "avatar": "avatar"
      });

      // Assert
      expect(result, equals(tJson));
    });
  });

  group("copyWith", () {
    test("should return a [User Model] with different data", () {});
  });
}
