import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mypod_flutter/screens/greeting_screen.dart' as greet;
import 'package:mypod_flutter/screens/login_screen.dart' as login;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../services/current_user.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _supabaseAuth = Supabase.instance.client.auth;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    setState(() => _errorMessage = null);

    if (!isValidEmail(_emailController.text)) {
      setState(() {
        _errorMessage = "Please enter a valid email address!";
      });
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      setState(() => _errorMessage = "Passwords do not match!");
      return;
    }

    try {
      final res = await _supabaseAuth.signUp(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final user = res.user;
      if (user == null) {
        setState(() => _errorMessage = "Sign-up failed. Please try again.");
        return;
      }

      final supabase = Supabase.instance.client;
      final userId = user.id; // Get Auth user ID

      // Insert additional user data into the user_accounts table
      await supabase.from('user_account').insert({
        'id': userId, // Use Auth ID as primary key
        'email': _emailController.text,
        'password': _passwordController.text,
        'username': _emailController.text.split('@')[0], // Default username
      });

      // Fetch the inserted user data
      final userData = await supabase
          .from('user_account')
          .select()
          .eq('id', userId)
          .single(); // get single user

      // Save user data in Provider
      currentUserData.setAccountData(userData);

      // Fetch user progress
      final progressData = await supabase
          .from('user_progresss')
          .select()
          .eq('id', res.user!.id)
          .maybeSingle();

      if (progressData != null) {
        currentUserData.setProgressData(progressData);
      } else {
        // Insert new progress row for the user
        final newProgress = await supabase
            .from('user_progresss')
            .insert({
              'id': res.user!.id,
              'lessons_completed': 0,
              'exp': 0,
              'stickers_earned': [],
              'quiz_scores': {},
              'activity_scores': {},
              'current_state': {},
            })
            .select()
            .single();

        currentUserData.setProgressData(newProgress);
      }

      log("User registered and data saved!");
      if (!mounted) return;

      // Redirect to the greeting screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const greet.GreetingScreen()),
      );
    } on AuthException catch (e) {
      setState(() {
        if (e.message.contains("Anonymous sign-ins are disabled") ||
            e.message.contains("Signup requires a valid password")) {
          _errorMessage = "Please fill in all fields.";
        } else if (e.message
            .contains("Password should be at least 8 characters")) {
          _errorMessage = "Password must be at least 8 characters long.";
        } else if (e.message.contains(
            "Password should contain at least one character of each")) {
          _errorMessage =
              "Password must contain at least one uppercase, lowercase, number, and special character.";
        } else {
          _errorMessage = e.message;
        }
      });
    } catch (e) {
      setState(() => _errorMessage = "Something went wrong. Please try again.");
      log("Sign up error: $e");
    }
  }

  Widget _buildErrorMessage() {
    return _errorMessage != null
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade400),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline,
                      color: Colors.red.shade700, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _errorMessage!,
                      style: TextStyle(
                          color: Colors.red.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  String capitalizeFirst(String text) {
    return text.isNotEmpty ? text[0].toUpperCase() + text.substring(1) : text;
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    return emailRegex.hasMatch(email);
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
    bool? isVisible,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: label != 'Confirm Password'
                ? 'Enter ${label.toLowerCase()}'
                : capitalizeFirst(label.toLowerCase()),
            suffixIcon: (label == 'Password' || label == 'Confirm Password')
                ? IconButton(
                    icon: Icon(
                      isVisible! ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: toggleVisibility,
                  )
                : null,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: width * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Sign Up',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              _buildTextField(label: 'Email', controller: _emailController),
              const SizedBox(height: 15),
              _buildTextField(
                label: 'Password',
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                isVisible: _isPasswordVisible,
                toggleVisibility: () => setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                }),
              ),
              const SizedBox(height: 15),
              _buildTextField(
                label: 'Confirm Password',
                controller: _confirmPasswordController,
                obscureText: !_isConfirmPasswordVisible,
                isVisible: _isConfirmPasswordVisible,
                toggleVisibility: () => setState(() {
                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                }),
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 10),
                _buildErrorMessage(),
              ],
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _signUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Sign Up',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Already have an account?",
                style: TextStyle(color: Colors.black)),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const login.LoginScreen()),
                );
              },
              child: const Text(
                "Login here",
                style: TextStyle(
                    decoration: TextDecoration.underline, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
