import 'dart:convert';

import 'package:education_app/core/utils/typedef.dart';
import 'package:education_app/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.createdAt,
      required super.name,
      required super.avatar});

  const UserModel.empty()
      : this(id: "1", createdAt: "createdAt", name: "name", avatar: "avatar");

  UserModel.fromMap(DataMap map)
      : this(
            id: map['id'] as String,
            createdAt: map['createdAt'] as String,
            name: map['name'] as String,
            avatar: map['avatar'] as String);

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel copyWith(
      {String? id, String? createdAt, String? name, String? avatar}) {
    return UserModel(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar);
  }

  DataMap toMap() =>
      {"id":id,"createdAt":createdAt,"name":name,"avatar":avatar};

  String toJson() => jsonEncode(toMap());
}