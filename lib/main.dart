import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/splash_screen.dart';

const supabaseUrl = "https://batvjfcaxelxagufynxk.supabase.co";
const supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJhdHZqZmNheGVseGFndWZ5bnhrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA1OTc1MjIsImV4cCI6MjA1NjE3MzUyMn0.aoJjGZl588xyMpHh47-uKHpQs6m0v10n4P4UfMqF9I0";

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    anonKey: supabaseKey, 
    url: supabaseUrl,);
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DuoASLingo', // App Title
      theme: ThemeData(
        primarySwatch: Colors.blue, // Set your primary color theme
      ),
      home: SplashScreen(), // Initial screen when app starts
    );
  }
}
