import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'current_user.dart'; 

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId:
        '913397498781-baldk0vv4aobc3omc0c5v2fa5hidapag.apps.googleusercontent.com',
    scopes: ['email'],
  );

  final SupabaseClient _supabase = Supabase.instance.client;
  final CurrentUserData currentUserData;

  AuthService(this.currentUserData);

  /// Google Sign-In
  Future<AuthResponse> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) throw 'Sign-in cancelled';

    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    final accessToken = googleAuth.accessToken;

    if (idToken == null || accessToken == null) throw 'Missing tokens';

    final authResponse = await _supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    final user = authResponse.user;
    if (user == null) throw 'Auth failed';

    await _ensureUserSetup(user.id, user.email, isGoogle: true);
    return authResponse;
  }

  /// Facebook Sign-In
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      await _supabase.auth.signInWithOAuth(
        OAuthProvider.facebook,
        redirectTo: 'https://batvjfcaxelxagufynxk.supabase.co/auth/v1/callback', 
      );

      // After redirect, Supabase automatically stores the session
      final session = _supabase.auth.currentSession;
      final user = session?.user;

      if (user == null) {
        throw 'Facebook sign-in failed or was cancelled';
      }

      await _ensureUserSetup(user.id, user.email, isGoogle: false);
    } catch (e) {
      debugPrint('Facebook login failed: $e');
      throw 'Facebook sign-in failed';
    }
  }

  
  /// Email/Password Login
  Future<void> handleEmailLogin({
    required BuildContext context,
    required String email,
    required String password,
    required Function(String) onError,
    required Widget Function() onSuccessRedirect,
  }) async {
    onError('');

    if (email.isEmpty || password.isEmpty) {
      onError('Please enter both email and password.');
      return;
    }

    try {
      final res = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = res.user;
      if (user != null) {
        await _ensureUserSetup(user.id, user.email, isGoogle: false);

        if (!context.mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => onSuccessRedirect()),
        );
      } else {
        onError('Invalid email or password.');
      }
    } catch (e) {
      onError('Invalid email or password.');
      debugPrint("Login error: $e");
    }
  }

  /// Helper method to insert/fetch user and progress
  Future<void> _ensureUserSetup(String userId, String? email,
      {bool isGoogle = false, bool isFacebook = false}) async {
    final existingUser = await _supabase
        .from('user_account')
        .select()
        .eq('id', userId)
        .maybeSingle();

    if (existingUser == null) {
      await _supabase
          .from('user_account')
          .insert({
            'id': userId,
            'email': email,
            'password': isGoogle
                ? 'google-auth'
                : isFacebook
                    ? 'facebook-auth'
                    : 'email-auth',
            'username': email?.split('@')[0],
          })
          .select()
          .single();

      await _supabase
          .from('user_progresss')
          .insert({
            'id': userId,
            'lessons_completed': 0,
            'exp': 0,
            'stickers_earned': [],
            'quiz_scores': {},
            'activity_scores': {},
            'current_state': {},
          })
          .select()
          .single();
    }

    final userData =
        await _supabase.from('user_account').select().eq('id', userId).single();
    currentUserData.setAccountData(userData);

    final progressData = await _supabase
        .from('user_progresss')
        .select()
        .eq('id', userId)
        .maybeSingle();

    if (progressData != null) {
      currentUserData.setProgressData(progressData);
    }
  }
}
