abstract class DaylogStorage {
  Future<DaylogStorage> init();
  Future putUser({required Map<String, dynamic> userMap});
  Future<Map<String, dynamic>?> getUser();
  Future deleteUser();
  void close();
}
