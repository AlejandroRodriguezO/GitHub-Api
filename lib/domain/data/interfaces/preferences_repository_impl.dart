import '../preferences_reposiitory.dart';
import 'package:shared_preferences/shared_preferences.dart';


const darkModeKey = 'dark-mode';

class PreferencesRepositoryImpl implements PreferencesRepository {
  final SharedPreferences _preferences;

  PreferencesRepositoryImpl(this._preferences);

  @override
  bool get isDarkMode => _preferences.getBool(darkModeKey) ?? false;

  @override
  Future<void> DarkMode(bool enabled) {
    return _preferences.setBool(darkModeKey, enabled);
  }
}