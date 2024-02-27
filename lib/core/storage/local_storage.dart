import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:goals_web/core/data_models/session.dart';

class LocalStorage {
  static final _box = GetStorage();
  static Session? _session;
  static String? _accessToken;

  static Session? get session {
    if (_session == null) {
      var result = _box.read("session");
      if (result != null) {
        _session = Session.fromJson(jsonDecode(result));
      }
      return _session;
    }
    return _session;
  }

  static set sessionMap(Map? token) {
    _session =  Session.fromJson(token);
    _box.write("session", jsonEncode(token));
  }

  static set accessToken(String? token) {
    _accessToken = token;
    _box.write("accessToken", token);
  }

  static String? get accessToken {
    if (_accessToken == null) {
      return _accessToken = _box.read<String>("accessToken");
    }
    return _accessToken;
  }
  static void logout()
  {
    _box.remove("accessToken");
    _box.remove("session");
  }
}
