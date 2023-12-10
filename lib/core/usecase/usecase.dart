abstract class UseCaseWidthParams<Type, Params> {
  Type call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  Type call();
}
