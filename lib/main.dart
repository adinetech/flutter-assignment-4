import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/form_screen.dart';
import 'screens/gallery_screen.dart';
import 'screens/animation_screen.dart';

void main() {
  runApp(const ConceptsDemoApp());
}

class ConceptsDemoApp extends StatelessWidget {
  const ConceptsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Concepts Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F46E5),
          primary: const Color(0xFF4F46E5),
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF0F172A),
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF0F172A),
          ),
        ),
      ),
      // Named route navigation
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/form': (context) => const FormScreen(),
        '/gallery': (context) => const GalleryScreen(),
        '/animation': (context) => const AnimationScreen(),
      },
    );
  }
}
