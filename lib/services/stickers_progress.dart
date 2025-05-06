import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'current_user.dart';

Future<void> updateStickers({
  required String stickerId,
}) async {
  final userId = Supabase.instance.client.auth.currentUser!.id;

  // Initialize empty list
  List<dynamic> stickersEarned = [];

  // Load current list from Supabase local data
  if (currentUserData.progress != null &&
      currentUserData.progress!['stickers_earned'] != null) {
    stickersEarned =
        List<dynamic>.from(currentUserData.progress!['stickers_earned']);
  }

  // Add new sticker if not already earned
  if (!stickersEarned.contains(stickerId)) {
    stickersEarned.add(stickerId);
  }

  try {
    // Update Supabase
    await Supabase.instance.client
        .from('user_progresss')
        .update({'stickers_earned': stickersEarned})
        .eq('id', userId);

    // Update local cache
    currentUserData.updateProgressField('stickers_earned', stickersEarned);

    debugPrint('Sticker $stickerId earned and updated.');
  } catch (e) {
    debugPrint('Error updating sticker earned: $e');
  }
}
