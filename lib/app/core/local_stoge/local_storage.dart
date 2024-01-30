abstract class LocalStorage {
  Future<V?> read<V>(String key);
  Future<void> write<V>(String key, V value);
  Future<bool> contains<V>(String key);
  Future<void> remove<V>(String key);
  Future<void> clear<V>();
}

abstract class LocalSecureStorage {
  Future<String?> read(String key);
  Future<void> write<V>(String key, String value);
  Future<bool> contains(String key);
  Future<void> remove(String key);
  Future<void> clear();
}
