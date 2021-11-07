import 'dart:developer';

import 'package:family_care_app/services/authentication/auth_output_data.dart';
import 'package:family_care_app/util/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageAuthOutputData {
  
  void save(AuthOutputData authOutputData) async {
    final storage = new FlutterSecureStorage();
    
    await storage.write(
        key: usernameKey(),
        value: authOutputData.username);
    await storage.write(
        key: tokenKey(),
        value: authOutputData.token);
    await storage.write(
        key: permissionsKey(),
        value: authOutputData.permissions.join(','));
  }

  Future<AuthOutputData> read() async {
    final storage = new FlutterSecureStorage();

    final String username = await storage.read(key: usernameKey()) ?? '';
    final String token = await storage.read(key: tokenKey()) ?? '';
    final List<String> permissions = await storage.containsKey(key: permissionsKey())
        ? (await storage.read(key: permissionsKey()))!.split(',')
        : List.empty();

    return AuthOutputData(username, token, permissions);
  }

  String permissionsKey() => kStorageKeyAuthOutput + '_permissions';

  String tokenKey() => kStorageKeyAuthOutput + '_token';

  String usernameKey() => kStorageKeyAuthOutput + '_username';
}
