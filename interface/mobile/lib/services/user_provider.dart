import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameProvider with ChangeNotifier {
  String _name = '';

  String get name => _name;

  NameProvider() {
    _loadName();
  }

  Future<void> _loadName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _name = prefs.getString('name') ?? '';
    notifyListeners();
  }

  Future<void> setName(String name) async {
    _name = name;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _name);
    notifyListeners();
  }
}
