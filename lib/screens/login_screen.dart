import 'dart:developer';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypod_flutter/main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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

  final _supabaseAuth = Supabase.instance.client.auth;
  final user = supabase.auth.currentUser;

  final _email = TextEditingController();
  final _password = TextEditingController();
  String _errorMessage = '';
  
  @override
  void dispose(){
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
    setState(() => _errorMessage = ''); // Reset error message

    if (_email.text.isEmpty || _password.text.isEmpty) {
      setState(() => _errorMessage = 'Please enter both email and password.');
      return;
    }

    try {
      final res = await _supabaseAuth.signInWithPassword(
        email: _email.text,
        password: _password.text,
      );

      if (res.user != null) {
        log("User signed in.");

        // Fetch user data 
        final userData = await supabase
            .from('user_account')
            .select()
            .eq('id', res.user!.id)
            .single();

        // Store globally
        currentUserData.setAccountData(userData);
        
        // Fetch user progress
        final progressData = await supabase
            .from('user_progress')
            .select()
            .eq('user_id', res.user!.id) 
            .maybeSingle(); 

        if (progressData != null) {
          currentUserData.setProgressData(progressData);
        }


        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => GreetingScreen()),
        );
      } else {
        setState(() => _errorMessage = 'Invalid email or password.');
      }
    } catch (e) {
      setState(() => _errorMessage = 'Invalid email or password.');
      log("Login error: $e");
    }
  }

  // Google Sign-In
  Future<AuthResponse> _googleSignIn() async {
    final googleUser = await GoogleSignIn(
      serverClientId: '913397498781-baldk0vv4aobc3omc0c5v2fa5hidapag.apps.googleusercontent.com',
      scopes: ['email'],
    ).signIn();

    if (googleUser == null) {
      throw 'Sign-in cancelled';
    }

    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    final accessToken = googleAuth.accessToken;

    if (idToken == null || accessToken == null) {
      throw 'Missing tokens';
    }

    final authResponse = await supabase.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    final user = authResponse.user;
    if (user == null) {
      throw 'Auth failed';
    }

    // Check if user already exists
    final existingUser = await supabase
        .from('user_account')
        .select()
        .eq('id', user.id)
        .maybeSingle();

    // If user does not exist, insert new records
    if (existingUser == null) {
      await supabase.from('user_account').insert({
        'id': user.id,
        'email': user.email,
        'password': 'google-auth',
        'username': user.userMetadata?['full_name'] ?? user.email?.split('@')[0],
      }).select().single(); 

      await supabase.from('user_progresss').insert({
        'id': user.id,
        'lessons_completed': 0,
        'exp': 0,
        'stickers_earned': [],
        'quiz_scores': {},
        'activity_scores': {},
        'current_state':{},
      }).select().single();
    }

    // Fetch and cache user data
    final userData = await supabase
        .from('user_account')
        .select()
        .eq('id', user.id)
        .single();
    currentUserData.setAccountData(userData);

    final progressData = await supabase
        .from('user_progresss')
        .select()
        .eq('id', user.id)
        .maybeSingle();
    if (progressData != null) {
      currentUserData.setProgressData(progressData);
    }

    return authResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            _buildHeaderImage(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    _buildTextField(label: 'Email', controller: _email),
                    SizedBox(height: 15),
                    _buildTextField(label: 'Password', controller: _password, isPassword: true),     
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
    );
  }

  /// Header image
  Widget _buildHeaderImage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login_background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  /// Custom text field widget
  Widget _buildTextField({required String label, required TextEditingController controller, bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: 'Enter your $label',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            filled: false,
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordScreen()));
        },
        child: Text(
          'Forgot Password?',
          style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
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
                Icon(Icons.error_outline, color: Colors.red.shade700, size: 16), // Warning icon
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _errorMessage,
                    style: TextStyle(color: Colors.red.shade800, fontSize: 12, fontWeight: FontWeight.bold),
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
              child: Text('or', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Image.asset('assets/icons/google_logo.png', width: 40, height: 40),
          onPressed: _googleSignIn,
        ),
        SizedBox(width: 15),
        IconButton(
          icon: Image.asset('assets/icons/fb_logo.png', width: 40, height: 40),
          onPressed: () {},
        ),
      ],
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}