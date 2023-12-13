import 'package:dartz/dartz.dart';
import 'package:education_app/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef VoidFuture = Future<Either<Failure, void>>;

typedef DataMap = Map<String, dynamic>;
