
import 'package:family_care_app/services/authentication/signin_output_data.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  
  void save(SigninOutputData authOutputData) async {
    final storage = new FlutterSecureStorage();

    await storage.write(
        key: _emailKey(),
        value: authOutputData.email);
    await storage.write(
        key: _nameKey(),
        value: authOutputData.name);
    await storage.write(
        key: _tokenKey(),
        value: authOutputData.token);
    await storage.write(
        key: _permissionsKey(),
        value: authOutputData.permissions.join(','));
  }

  Future<SigninOutputData> read() async {
    final storage = new FlutterSecureStorage();

    final String email = await storage.read(key: _emailKey()) ?? '';
    final String name = await storage.read(key: _nameKey()) ?? '';
    final String token = await storage.read(key: _tokenKey()) ?? '';
    final List<String> permissions = await storage.containsKey(key: _permissionsKey())
        ? (await storage.read(key: _permissionsKey()))!.split(',')
        : List.empty();

    return SigninOutputData(email, name, token, permissions);
  }

  Future<String> token() async {
    final storage = new FlutterSecureStorage();

    return await storage.read(key: _tokenKey()) ?? '';
  }

  Future<String> email() async {
    final storage = new FlutterSecureStorage();

    return await storage.read(key: _emailKey()) ?? '';
  }

  Future<bool> isUserLogged() async {
    final storage = new FlutterSecureStorage();

    final String username = await storage.read(key: _emailKey()) ?? '';
    final String token = await storage.read(key: _tokenKey()) ?? '';

    return username != '' && token != '';
  }

  Future<void> reset() async {
    final storage = new FlutterSecureStorage();

    await storage.delete(key: _emailKey());
    await storage.delete(key: _nameKey());
    await storage.delete(key: _tokenKey());
    await storage.delete(key: _permissionsKey());
  }

  String _permissionsKey() => kStorageKeyAuthOutput + '_permissions';

  String _tokenKey() => kStorageKeyAuthOutput + '_token';

  String _emailKey() => kStorageKeyAuthOutput + '_email';

  String _nameKey() => kStorageKeyAuthOutput + '_name';
}
