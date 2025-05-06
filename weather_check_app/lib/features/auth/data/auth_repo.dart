import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_checking/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:weather_checking/features/auth/domain/repo/i_auth_repo.dart';

class AuthRepo implements IAuthRepo {
  const AuthRepo({
    required this.remoteDatasource,
  });

  final IAuthRemoteDatasource remoteDatasource;

  @override
  Future<bool> loginUser(String userName, String password) async {
    return await remoteDatasource.loginUser(userName, password);
  }
}

final authRepoProvider = Provider<IAuthRepo>((ref) =>
    AuthRepo(remoteDatasource: ref.watch(authRemoteDatasourceProvider)));
