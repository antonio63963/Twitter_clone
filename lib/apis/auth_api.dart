import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/failure.dart';
import 'package:twitter_clone/core/type_def.dart';

abstract interface class IAuthAPI {
  FutureEither<model.User> signUp({
    required String email,
    required String password,
  });
}

class AuthAPI implements IAuthAPI {
  final Account _account;
  AuthAPI({required Account account}) : _account = account;

  @override
  FutureEither<model.User> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
        userId: ID.unique(),
        email: email,
        password: password,
      );
      return right(account); //fpdart
    } on AppwriteException catch (err, stackTrace) {
      return left(
        Failure(err.message ?? 'Some unexpected error occured', stackTrace),
      );
    } catch (err, stackTrace) {
      return left(
        Failure(err.toString(), stackTrace),
      );
    }
  }
}
