import 'package:flutter/material.dart';

class CurrentUserData extends ChangeNotifier {
  static final CurrentUserData _instance = CurrentUserData._internal();
  factory CurrentUserData() => _instance;
  CurrentUserData._internal();

  Map<String, dynamic>? _accountData;
  Map<String, dynamic>? _progressData;
  Map<String, dynamic>? _leaderboardData; // ADD THIS

  Map<String, dynamic>? get account => _accountData;
  Map<String, dynamic>? get progress => _progressData;
  Map<String, dynamic>? get leaderboard => _leaderboardData; // Getter

  bool get isLoggedIn => _accountData != null;

  void setAccountData(Map<String, dynamic> newData) {
    _accountData = newData;
    notifyListeners();
  }

  void setProgressData(Map<String, dynamic> newData) {
    _progressData = newData;
    notifyListeners();
  }

  void setLeaderboardData(Map<String, dynamic> newData) { // ADD THIS
    _leaderboardData = newData;
    notifyListeners();
  }

  void updateAccountField(String key, dynamic value) {
    if (_accountData != null) {
      _accountData![key] = value;
      notifyListeners();
    }
  }

  void updateProgressField(String key, dynamic value) {
    if (_progressData != null) {
      _progressData![key] = value;
      notifyListeners();
    }
  }

  void updateLeaderboardField(String key, dynamic value) { // ADD THIS
    if (_leaderboardData != null) {
      _leaderboardData![key] = value;
      notifyListeners();
    }
  }

  void clear() {
    _accountData = null;
    _progressData = null;
    _leaderboardData = null; // Clear din leaderboard
    notifyListeners();
  }

  void logout() {
    clear();
  }
}

final currentUserData = CurrentUserData();
