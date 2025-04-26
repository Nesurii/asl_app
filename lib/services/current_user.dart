import 'package:flutter/material.dart';

class CurrentUserData extends ChangeNotifier {
  static final CurrentUserData _instance = CurrentUserData._internal();
  factory CurrentUserData() => _instance;
  CurrentUserData._internal();

  Map<String, dynamic>? _accountData;
  Map<String, dynamic>? _progressData;

  Map<String, dynamic>? get account => _accountData;
  Map<String, dynamic>? get progress => _progressData;
  bool get isLoggedIn => _accountData != null;

  /// Set user_account data
  void setAccountData(Map<String, dynamic> newData) {
    _accountData = newData;
    notifyListeners();
  }

  /// Set user_progress data
  void setProgressData(Map<String, dynamic> newData) {
    _progressData = newData;
    notifyListeners();
  }

  /// Update a specific field in user_account
  void updateAccountField(String key, dynamic value) {
    if (_accountData != null) {
      _accountData![key] = value;
      notifyListeners();
    }
  }

  /// Update a specific field in user_progress
  void updateProgressField(String key, dynamic value) {
    if (_progressData != null) {
      _progressData![key] = value;
      notifyListeners();
    }
  }

  /// Clears all user data (logout)
  void clear() {
    _accountData = null;
    _progressData = null;
    notifyListeners();
  }

  void logout() {
    clear();
  }
}

final currentUserData = CurrentUserData();
