import 'package:flutter/material.dart';
import '../widgets/concept_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Concepts Studio',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 19,
            letterSpacing: -0.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xFFE2E8F0),
            height: 1.0,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Hero Header Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F172A),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1F0F172A),
                      blurRadius: 16,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Interactive Showcase',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Flutter Core Concepts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'A curated collection demonstrating robust form validation, local asset management with custom Poppins typography, and fluid AnimatedContainer transitions.',
                      style: TextStyle(
                        color: Color(0xFFCBD5E1),
                        fontSize: 13.5,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // Section Label
              const Text(
                'Demonstration Modules',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF475569),
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 14),

              // Card 1: Form & Validation
              ConceptCard(
                number: '01',
                title: 'User Input & Forms',
                subtitle:
                    'Accept and validate input using Form, GlobalKey<FormState>, TextEditingController, custom InputDecoration, and confirmation SnackBars.',
                icon: Icons.edit_note_rounded,
                accentColor: const Color(0xFF4F46E5),
                tags: const [
                  'Form',
                  'GlobalKey',
                  'TextFormField',
                  'validator',
                  'SnackBar',
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/form');
                },
              ),
              const SizedBox(height: 16),

              // Card 2: Assets & Fonts
              ConceptCard(
                number: '02',
                title: 'Images, Assets & Fonts',
                subtitle:
                    'Render local images via Image.asset() in a structured GridView.count with global custom typography using the Poppins font family.',
                icon: Icons.photo_library_rounded,
                accentColor: const Color(0xFF0D9488),
                tags: const [
                  'Image.asset',
                  'GridView.count',
                  'Poppins Font',
                  'pubspec.yaml',
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/gallery');
                },
              ),
              const SizedBox(height: 16),

              // Card 3: Interactive Animations
              ConceptCard(
                number: '03',
                title: 'Interactive Animations',
                subtitle:
                    'Smoothly transition size, color, border radius, and alignment on user interactions utilizing Flutter\'s AnimatedContainer.',
                icon: Icons.animation_rounded,
                accentColor: const Color(0xFFE11D48),
                tags: const [
                  'AnimatedContainer',
                  'Curves',
                  'Interactive States',
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/animation');
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
