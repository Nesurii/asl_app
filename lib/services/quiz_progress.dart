import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'current_user.dart';
import 'exp_progress.dart';

Future<void> updateQuiz({
  required String quizId, 
  required int totalScore,
}) async {
  final userId = Supabase.instance.client.auth.currentUser?.id;

  if (userId == null) {
    debugPrint('User not logged in.');
    return;
  }

  // Get current quiz_scores map or initialize
  Map<String, dynamic> quizScores = {};

  if (currentUserData.progress != null &&
      currentUserData.progress!['quiz_scores'] != null) {
    quizScores = Map<String, dynamic>.from(currentUserData.progress!['quiz_scores']);
  }

  // Check existing score for this quiz
  int previousScore = quizScores[quizId] ?? 0;

  if (totalScore > previousScore) {
    // New score is better → update it
    quizScores[quizId] = totalScore;

    try {
      // Update Supabase
      await Supabase.instance.client
          .from('user_progresss')
          .update({'quiz_scores': quizScores})
          .eq('id', userId);

      // Update local progress data
      currentUserData.updateProgressField('quiz_scores', quizScores);

      debugPrint('Quiz "$quizId" score improved: $previousScore → $totalScore');

      // Update the EXP after updating quiz score
      final expManager = ExpManager();
      await expManager.updateExpFromScores();

    } catch (e) {
      debugPrint('Error updating quiz score: $e');
    }
  } else {
    debugPrint('Quiz "$quizId" score NOT improved: $previousScore vs $totalScore');
    // No update needed because the new score is not better
  }
}
