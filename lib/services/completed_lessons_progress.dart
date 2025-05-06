import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'current_user.dart';
import 'exp_progress.dart';

class LessonCompletionManager {
  Future<void> completeLesson({
    required String lessonId,
    required int score,
  }) async {
    final userId = Supabase.instance.client.auth.currentUser?.id;

    if (userId == null) {
      debugPrint('User not logged in.');
      return;
    }

    // Initialize lists/maps
    List<dynamic> lessonsCompleted = [];
    Map<String, dynamic> lessonScores = {};

    // Load current user progress
    if (currentUserData.progress != null) {
      var rawLessonsCompleted = currentUserData.progress!['lessons_completed'];
      if (rawLessonsCompleted is List) {
        lessonsCompleted = List<dynamic>.from(rawLessonsCompleted);
      } else {
        debugPrint('Warning: lessons_completed is not a List, resetting to empty.');
        lessonsCompleted = [];
      }

      var rawLessonScores = currentUserData.progress!['activity_scores'];
      if (rawLessonScores is Map) {
        lessonScores = Map<String, dynamic>.from(rawLessonScores);
      } else {
        debugPrint('Warning: activity_scores is not a Map, resetting to empty.');
        lessonScores = {};
      }
    }

    bool isFirstAttempt = !lessonScores.containsKey(lessonId);

    // If first attempt, record the score
    if (isFirstAttempt) {
      lessonScores[lessonId] = score;
      debugPrint('First attempt! Score $score recorded for lesson $lessonId.');
    } else {
      debugPrint('Not first attempt. Score will not be updated.');
    }

    // Mark the lesson as completed if not already
    if (!lessonsCompleted.contains(lessonId)) {
      lessonsCompleted.add(lessonId);
    }

    try {
      // Update Supabase database
      await Supabase.instance.client
          .from('user_progresss')
          .update({
            'lessons_completed': lessonsCompleted,
            'activity_scores': lessonScores,
          })
          .eq('id', userId);

      // Update local currentUserData
      currentUserData.updateProgressField('lessons_completed', lessonsCompleted);
      currentUserData.updateProgressField('activity_scores', lessonScores);

      debugPrint('Lesson $lessonId marked as completed.');

       // Update the EXP after updating quiz score
      final expManager = ExpManager();
      await expManager.updateExpFromScores();
      
    } catch (e) {
      debugPrint('Error updating progress: $e');
    }
  }
}
