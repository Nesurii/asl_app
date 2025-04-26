import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'current_user.dart';

class ExpManager {
  final SupabaseClient _client = Supabase.instance.client;

  Future<void> addExp(int points) async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) {
      debugPrint('User not logged in.');
      return;
    }

    try {
      // Get current EXP from local progress or default to 0
      int currentExp = 0;
      if (currentUserData.progress != null &&
          currentUserData.progress!['exp'] != null) {
        currentExp = currentUserData.progress!['exp'];
      }

      int updatedExp = currentExp + points;

      // Update Supabase
      await _client
          .from('user_progress')
          .update({'exp': updatedExp})
          .eq('user_id', userId);

      // Update local data
      currentUserData.updateProgressField('exp', updatedExp);

      debugPrint('EXP updated: $currentExp → $updatedExp');
    } catch (e) {
      debugPrint('Error updating EXP: $e');
    }
  }

  Future<void> setExp(int newExp) async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) {
      debugPrint('User not logged in.');
      return;
    }

    try {
      await _client
          .from('user_progress')
          .update({'exp': newExp})
          .eq('user_id', userId);

      currentUserData.updateProgressField('exp', newExp);
      debugPrint('EXP set to $newExp');
    } catch (e) {
      debugPrint('Error setting EXP: $e');
    }
  }

  int getLocalExp() {
    if (currentUserData.progress != null &&
        currentUserData.progress!['exp'] != null) {
      return currentUserData.progress!['exp'];
    }
    return 0;
  }
}
