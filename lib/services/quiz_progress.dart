import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'current_user.dart';

Future<void> updateQuiz({
  required int quizNumber,
  required int totalScore,
}) async {
  final userId = Supabase.instance.client.auth.currentUser!.id;

  // Get current quiz_scores map or initialize
  Map<String, dynamic> quizScores = {};

  if (currentUserData.progress != null && currentUserData.progress!['quiz_scores'] != null) {
    quizScores = Map<String, dynamic>.from(currentUserData.progress!['quiz_scores']);
  }

  // Update the score for the quizNumber
  quizScores['$quizNumber'] = totalScore;

  try {
    // Update Supabase
    await Supabase.instance.client
        .from('user_progress')
        .update({'quiz_scores': quizScores})
        .eq('user_id', userId);

    // Update local progress data
    currentUserData.updateProgressField('quiz_scores', quizScores);

    debugPrint('Quiz $quizNumber score updated to $totalScore');
  } catch (e) {
    debugPrint('Error updating quiz score: $e');
  }
}
