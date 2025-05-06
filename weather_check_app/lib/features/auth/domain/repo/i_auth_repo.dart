abstract interface class IAuthRepo {
  Future<bool> loginUser(String userName, String password);
}
