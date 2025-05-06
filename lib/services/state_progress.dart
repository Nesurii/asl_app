import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:logging/logging.dart';

class LessonManager {
  final supabase = Supabase.instance.client;

  // Initialize the logger
  static final Logger _logger = Logger('LessonManager');

  /// Get the current state (unit, lesson, and page) from user_progress
  Future<Map<String, dynamic>?> getCurrentState() async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return null;

    try {
      final response = await supabase
          .from('user_progresss')
          .select('current_state')
          .eq('id', userId)
          .single();

      final currentState = response['current_state'];
      if (currentState is Map<String, dynamic>) {
        return currentState;
      } else {
        return null;
      }
    } catch (e) {
      _logger.severe('Error fetching current state: $e');
      return null;
    }
  }

  /// Update the current state (unit, lesson, and page) in user_progress
  Future<void> updateCurrentState(Map<String, dynamic> newState) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return;

    try {
      await supabase
          .from('user_progresss')
          .update({'current_state': newState})
          .eq('id', userId);

      _logger.info('Updated current_state to: $newState');
    } catch (e) {
      _logger.severe('Error updating current state: $e');
    }
  }

  /// Update only the unit in the current state
  Future<void> updateCurrentUnit(String newUnit) async {
    final currentState = await getCurrentState();
    if (currentState != null) {
      currentState['unit'] = newUnit;
      await updateCurrentState(currentState);
    }
  }

  /// Update only the lesson in the current state
  Future<void> updateCurrentLesson(String newLesson) async {
    final currentState = await getCurrentState();
    if (currentState != null) {
      currentState['lesson'] = newLesson;
      await updateCurrentState(currentState);
    }
  }

  /// Update only the page in the current state
  Future<void> updateCurrentPageForLesson(String lessonId, String newPage) async {
    final currentState = await getCurrentState();
    if (currentState != null) {
      final lessonPages = Map<String, dynamic>.from(currentState['lesson_pages'] ?? {});

      lessonPages[lessonId] = newPage; // Save per lesson

      currentState['lesson_pages'] = lessonPages;
      await updateCurrentState(currentState);
    }
  }

  /// Reset the lesson progress to the start of the lesson (first page)
  Future<void> resetLessonProgress(String lessonId) async {
    final userId = supabase.auth.currentUser?.id;
    if (userId == null) return;

    try {
      final currentState = await getCurrentState();
      if (currentState != null) {
        final lessonPages = Map<String, dynamic>.from(currentState['lesson_pages'] ?? {});

        // Reset the lesson progress for the specified lesson to the first page
        lessonPages[lessonId] = "";  // Reset to start of the lesson

        currentState['lesson_pages'] = lessonPages;

        // Update the current state with the reset progress
        await updateCurrentState(currentState);

        _logger.info('Lesson progress for $lessonId reset to the start');
      }
    } catch (e) {
      _logger.severe('Error resetting lesson progress: $e');
    }
  }

}
