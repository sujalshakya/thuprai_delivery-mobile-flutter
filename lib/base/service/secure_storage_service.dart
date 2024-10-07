import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  /// Store value
  setToken(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  /// Read value
  Future<String?> getToken(String key) async {
    return await storage.read(key: key);
  }

  /// Delete Value
  void deleteToken(String key) async {
    await storage.delete(key: key);
  }
}
