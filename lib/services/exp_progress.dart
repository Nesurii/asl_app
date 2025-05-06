import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'current_user.dart';

class ExpManager {
  final SupabaseClient _client = Supabase.instance.client;

  Future<void> updateExpFromScores() async {
    final userId = _client.auth.currentUser?.id;
    if (userId == null) {
      debugPrint('User not logged in.');
      return;
    }

    try {
      // Fetch current quiz_scores and activity_scores
      Map<String, dynamic> quizScores = {};
      Map<String, dynamic> activityScores = {};

      if (currentUserData.progress != null) {
        if (currentUserData.progress!['quiz_scores'] != null) {
          quizScores = Map<String, dynamic>.from(currentUserData.progress!['quiz_scores']);
        }
        if (currentUserData.progress!['activity_scores'] != null) {
          activityScores = Map<String, dynamic>.from(currentUserData.progress!['activity_scores']);
        }
      }

      // Calculate the sum of quiz and activity scores
      int quizSum = quizScores.values.fold(0, (sum, value) => sum + (value as int));
      int activitySum = activityScores.values.fold(0, (sum, value) => sum + (value as int));
      int totalExp = quizSum + activitySum;

      // Update exp in Supabase
      await _client
          .from('user_progresss')
          .update({'exp': totalExp})
          .eq('id', userId);

      // Update exp in local currentUserData
      currentUserData.updateProgressField('exp', totalExp);

      debugPrint('EXP updated from scores: Quiz Sum = $quizSum, Activity Sum = $activitySum, Total EXP = $totalExp');
    } catch (e) {
      debugPrint('Error updating EXP from scores: $e');
    }
  }
}
