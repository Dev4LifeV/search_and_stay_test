import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfig {
  static final _remoteConfig = FirebaseRemoteConfig.instance;

  static Future<String> getToken() async {
    await _remoteConfig.fetchAndActivate();
    return _remoteConfig.getString('token');
  }
}
