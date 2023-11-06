abstract class LocalStorage {
  Future<V?> read<V>(String key);
  Future<void> write<V>(String key, V value);
  Future<bool> contains(String key);
  Future<void> remove(String key);
  Future<void> clear();
}

abstract class LocalSecureStoge {
  Future<String?> read(String key);
  Future<void> write<V>(String key, String value);
  Future<bool> contains(String key);
  Future<void> remove(String key);
  Future<void> clear();
}
