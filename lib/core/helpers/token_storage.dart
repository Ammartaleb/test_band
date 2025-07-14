import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_band/core/helpers/app_consts.dart';
import 'package:test_band/di/dependency_injection.dart';

class TokenStorage {
  final _storage = getIt<FlutterSecureStorage>();

  Future<void> saveToken(String token) async {
    await _storage.write(key: AppConsts.authTokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: AppConsts.authTokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: AppConsts.authTokenKey);
  }
}
