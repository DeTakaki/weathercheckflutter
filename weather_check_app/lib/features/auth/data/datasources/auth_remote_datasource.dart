import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract interface class IAuthRemoteDatasource {
  Future<bool> loginUser(String userName, String password);
}

class AuthRemoteDatasource implements IAuthRemoteDatasource {
  @override
  Future<bool> loginUser(String userName, String password) async {
    // TODO: implement loginUser
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }
}

final authRemoteDatasourceProvider =
    Provider<IAuthRemoteDatasource>((ref) => AuthRemoteDatasource());
