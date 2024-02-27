import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/core.dart';

typedef FutureEither<TSucess> = Future<Either<Failure, TSucess>>;
typedef FutureEitherVoid = FutureEither<void>;
