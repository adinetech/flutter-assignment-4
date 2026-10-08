import 'dart:math';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  // AnimatedContainer target properties
  double _width = 150.0;
  double _height = 150.0;
  Color _color = const Color(0xFF4F46E5);
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(24.0);
  Alignment _alignment = Alignment.center;
  bool _isToggled = false;

  final Random _random = Random();

  // Curated modern aesthetic color palette
  static const List<Color> _palette = [
    Color(0xFF4F46E5), // Indigo
    Color(0xFFE11D48), // Rose
    Color(0xFF0D9488), // Teal
    Color(0xFFD97706), // Amber
    Color(0xFF7C3AED), // Violet
    Color(0xFF0284C7), // Sky
  ];

  static const List<Alignment> _alignments = [
    Alignment.center,
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topCenter,
    Alignment.bottomCenter,
  ];

  void _toggleState() {
    setState(() {
      _isToggled = !_isToggled;
      if (_isToggled) {
        // Transformed State
        _width = 250.0;
        _height = 160.0;
        _color = const Color(0xFFE11D48);
        _borderRadius = BorderRadius.circular(50.0);
        _alignment = Alignment.center;
      } else {
        // Default State
        _width = 150.0;
        _height = 150.0;
        _color = const Color(0xFF4F46E5);
        _borderRadius = BorderRadius.circular(24.0);
        _alignment = Alignment.center;
      }
    });
  }

  void _randomizeProperties() {
    setState(() {
      _width = 120.0 + _random.nextInt(150);
      _height = 120.0 + _random.nextInt(120);
      _color = _palette[_random.nextInt(_palette.length)];
      _borderRadius = BorderRadius.circular(8.0 + _random.nextInt(56));
      _alignment = _alignments[_random.nextInt(_alignments.length)];
      _isToggled = false;
    });
  }

  void _resetProperties() {
    setState(() {
      _width = 150.0;
      _height = 150.0;
      _color = const Color(0xFF4F46E5);
      _borderRadius = BorderRadius.circular(24.0);
      _alignment = Alignment.center;
      _isToggled = false;
    });
  }

  String _colorToHex(Color c) {
    return '#${c.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Interactive Animations',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Concept Banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF1F2),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFFECDD3)),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_rounded,
                      color: Color(0xFFE11D48),
                      size: 22,
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'AnimatedContainer automatically interpolates transitions between size, color, border radius, and alignment.',
                        style: TextStyle(
                          color: Color(0xFF9F1239),
                          fontSize: 13,
                          height: 1.4,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Animation Canvas / Stage
              Container(
                width: double.infinity,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x06000000),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.easeInOutCubic,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AnimatedContainer(
                      width: _width,
                      height: _height,
                      decoration: BoxDecoration(
                        color: _color,
                        borderRadius: _borderRadius,
                        boxShadow: [
                          BoxShadow(
                            color: _color.withValues(alpha: 0.35),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeInOutCubic,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.touch_app_rounded,
                              color: Colors.white,
                              size: 28,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '${_width.toInt()} × ${_height.toInt()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Interactive Action Controls
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: ElevatedButton.icon(
                      onPressed: _toggleState,
                      icon: Icon(
                        _isToggled
                            ? Icons.swap_horiz_rounded
                            : Icons.play_arrow_rounded,
                        size: 20,
                      ),
                      label: Text(_isToggled ? 'Revert State' : 'Toggle State'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0F172A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: ElevatedButton.icon(
                      onPressed: _randomizeProperties,
                      icon: const Icon(Icons.shuffle_rounded, size: 18),
                      label: const Text('Randomize'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4F46E5),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton.filledTonal(
                    onPressed: _resetProperties,
                    icon: const Icon(Icons.refresh_rounded),
                    tooltip: 'Reset Properties',
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Live Inspector Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.tune_rounded,
                          size: 18,
                          color: Color(0xFF64748B),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Live Animated Properties',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Divider(height: 1, color: Color(0xFFF1F5F9)),
                    const SizedBox(height: 12),
                    _buildPropertyRow(
                      'Dimensions',
                      '${_width.toStringAsFixed(0)} px × ${_height.toStringAsFixed(0)} px',
                    ),
                    _buildPropertyRow(
                      'Color (Hex)',
                      _colorToHex(_color),
                      colorIndicator: _color,
                    ),
                    _buildPropertyRow(
                      'Border Radius',
                      _borderRadius.toString().replaceAll('BorderRadius.circular(', '').replaceAll(')', ''),
                    ),
                    _buildPropertyRow(
                      'Alignment',
                      _alignment.toString().replaceAll('Alignment.', ''),
                    ),
                    _buildPropertyRow(
                      'Transition Curve',
                      'Curves.easeInOutCubic (600ms)',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPropertyRow(String label, String value, {Color? colorIndicator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF64748B),
            ),
          ),
          Row(
            children: [
              if (colorIndicator != null) ...[
                Container(
                  width: 14,
                  height: 14,
                  margin: const EdgeInsets.only(right: 6),
                  decoration: BoxDecoration(
                    color: colorIndicator,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12),
                  ),
                ),
              ],
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
