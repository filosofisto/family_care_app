
import 'package:family_care_app/services/authentication/signin_output_data.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  
  void save(SigninOutputData authOutputData) async {
    final storage = new FlutterSecureStorage();

    await storage.write(
        key: emailKey(),
        value: authOutputData.email);
    await storage.write(
        key: nameKey(),
        value: authOutputData.name);
    await storage.write(
        key: tokenKey(),
        value: authOutputData.token);
    await storage.write(
        key: permissionsKey(),
        value: authOutputData.permissions.join(','));
  }

  Future<SigninOutputData> read() async {
    final storage = new FlutterSecureStorage();

    final String email = await storage.read(key: emailKey()) ?? '';
    final String name = await storage.read(key: nameKey()) ?? '';
    final String token = await storage.read(key: tokenKey()) ?? '';
    final List<String> permissions = await storage.containsKey(key: permissionsKey())
        ? (await storage.read(key: permissionsKey()))!.split(',')
        : List.empty();

    return SigninOutputData(email, name, token, permissions);
  }

  Future<bool> isUserLogged() async {
    final storage = new FlutterSecureStorage();

    final String username = await storage.read(key: emailKey()) ?? '';
    final String token = await storage.read(key: tokenKey()) ?? '';

    return username != '' && token != '';
  }

  Future<void> reset() async {
    final storage = new FlutterSecureStorage();

    await storage.delete(key: emailKey());
    await storage.delete(key: nameKey());
    await storage.delete(key: tokenKey());
    await storage.delete(key: permissionsKey());
  }

  String permissionsKey() => kStorageKeyAuthOutput + '_permissions';

  String tokenKey() => kStorageKeyAuthOutput + '_token';

  String emailKey() => kStorageKeyAuthOutput + '_email';

  String nameKey() => kStorageKeyAuthOutput + '_name';
}
