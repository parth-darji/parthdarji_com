import 'assets.dart';

class SvgPath {
  String mic = AssetPath.svg("mic");

  // ------------- APP ICONS ------------ //
  String appStore = _icons("app_store");
  String music = _icons("apple_music");
  String calendar = _icons("calendar");
  String camera = _icons("camera");
  String clock = _icons("clock");
  String health = _icons("health");
  String home = _icons("home");
  String mail = _icons("mail");
  String maps = _icons("maps");
  String messages = _icons("messages");
  String notes = _icons("notes");
  String phone = _icons("phone");
  String photos = _icons("photos");
  String reminders = _icons("reminders");
  String safari = _icons("safari");
  String settings = _icons("settings");
  String wallet = _icons("wallet");
  String weather = _icons("weather");

  static String _icons(String fileName) {
    return AssetPath.svg("icons/$fileName");
  }
}
