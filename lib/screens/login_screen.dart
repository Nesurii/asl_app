import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mypod_flutter/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/auth_sevice.dart';
import '../services/current_user.dart';
//import '../services/user_progress.dart';
import 'greeting_screen.dart';
import 'forgot_password_screen.dart';
import 'sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //final _supabaseAuth = Supabase.instance.client.auth;
  final user = supabase.auth.currentUser;
  final authService = AuthService(currentUserData);

  final _email = TextEditingController();
  final _password = TextEditingController();
  String _errorMessage = '';

  bool _obscurePassword = true;

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  void initState() {
    super.initState();
    _setupAuthListener();
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;

      if (event == AuthChangeEvent.signedIn && mounted) {
        if (context.mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => GreetingScreen(),
            ),
          );
        }
      }
    });
  }

  //Email Login
  Future<void> _handleLogin() async {
    await authService.handleEmailLogin(
      context: context,
      email: _email.text,
      password: _password.text,
      onError: (msg) => setState(() => _errorMessage = msg),
      onSuccessRedirect: () => GreetingScreen(),
    );
  }

  // Google Sign-In using AuthService
  Future<void> _googleSignIn() async {
    try {
      final authResponse = await authService.signInWithGoogle();
      if (authResponse.user != null) {
        // User is successfully signed in
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => GreetingScreen()),
          );
        }
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Google Sign-In failed: $e';
      });
      log("Google Sign-In error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      _buildHeaderImage(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTextField(
                                  label: 'Email', controller: _email),
                              SizedBox(height: 15),
                              _buildTextField(
                                label: 'Password',
                                controller: _password,
                                isPassword: true,
                              ),
                              _buildForgotPasswordButton(),
                              _buildErrorMessage(),
                              _buildLoginButton(),
                              _buildDivider(),
                              _buildSocialLoginButtons(),
                              _buildSignUpPrompt(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  /// Header image
  Widget _buildHeaderImage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login_background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// Custom text field widget
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        TextField(
          controller: controller,
          obscureText: isPassword ? _obscurePassword : false,
          decoration: InputDecoration(
            hintText: 'Enter your $label',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }

  /// Forgot Password button
  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(
              color: Colors.black, decoration: TextDecoration.underline),
        ),
      ),
    );
  }

  /// Displays error message if present
  Widget _buildErrorMessage() {
    return _errorMessage.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade100, // Light red background
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red.shade400),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline,
                      color: Colors.red.shade700, size: 16), // Warning icon
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _errorMessage,
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
        : SizedBox.shrink();
  }

  /// Login button
  Widget _buildLoginButton() {
    return Center(
      child: ElevatedButton(
        onPressed: _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Log In',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  /// Divider line with "or"
  Widget _buildDivider() {
    return Column(
      children: [
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: Divider(color: Color(0xff646060))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('or',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
            Expanded(child: Divider(color: Color(0xff646060))),
          ],
        ),
        SizedBox(height: 9),
      ],
    );
  }

/// Social login buttons
Widget _buildSocialLoginButtons() {
  return Center(
    child: ElevatedButton(
      onPressed: _googleSignIn,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey.shade400),
        ),
        elevation: 2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/icons/google_logo.png',
            height: 24,
          ),
          SizedBox(width: 10),
          Text(
            'Google',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}

  /// Sign-up prompt
  Widget _buildSignUpPrompt() {
    return Column(
      children: [
        SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text('New to ASL?', style: TextStyle(fontSize: 14)),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
