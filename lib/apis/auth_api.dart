import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:twitter_clone/core/failure.dart';
import 'package:twitter_clone/core/providers.dart';
import 'package:twitter_clone/core/type_def.dart';

final authAPIProvider = Provider((ref) {
  final account = ref.watch(appwriteAccountProvider);
  return AuthAPI(
    account: account,
  );
});

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
      print('SIGN_UP account: $account');
      return right(account); //fpdart
    } on AppwriteException catch (err, stackTrace) {
      print('SIGN_UP api: $err');
      return left(
        Failure(err.message ?? 'Some unexpected error occured', stackTrace),
      );
    } catch (err, stackTrace) {
      print('SIGN_UP err api: $err');
      return left(
        Failure(err.toString(), stackTrace),
      );
    }
  }
}
