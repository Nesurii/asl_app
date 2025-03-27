import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _supabase = Supabase.instance.client;

  // Send Email Verification
  Future<void> _sendPasswordResetEmail() async {
    try {
      await _supabase.auth.resetPasswordForEmail(_emailController.text.trim());
      if (!mounted) return; // Prevent errors if widget was removed

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset email sent! Check your inbox.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  // Future<void> _updatePassword(String newPassword) async {
  //   try {
  //     await Supabase.instance.client.auth.updateUser(
  //       UserAttributes(password: newPassword),
  //     );
  //     if (!mounted) return; // Prevent errors if widget was removed
      
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Password updated successfully!")),
  //     );
  //     Navigator.pop(context); // Go back to login screen
  //   } catch (e) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Error: ${e.toString()}")),
  //     );
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Moves everything up slightly

              Image.asset(
                'assets/images/forgot_password.gif',
                height: 140, 
              ),
              SizedBox(height: 20),

              Text(
                'Forgot your password?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),

              Text(
                'Enter your email below to retrieve your account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 25),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: false,
                ),
              ),
              SizedBox(height: 25),

              ElevatedButton(
                onPressed: _sendPasswordResetEmail,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Send Password Reset Link',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
