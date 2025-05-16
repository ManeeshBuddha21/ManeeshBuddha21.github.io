import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portfolio_site/widgets/animated_slide_delay.dart'
    show DelayedSlide;

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool _visible = false;

  void _handleVisibility(bool visible) {
    if (visible && !_visible) {
      setState(() {
        _visible = true;
      });
    }
  }

  Widget buildSkillCategory(String title, List<String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: List.generate(skills.length, (i) {
            final delay = Duration(milliseconds: 100 * i);
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 600),
              opacity: _visible ? 1 : 0,
              curve: Curves.easeOut,
              child: DelayedSlide(
                offset: const Offset(0, 0.2),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
                delay: delay,
                child: Chip(
                  label: Text(skills[i]),
                  backgroundColor: Colors.white10,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('skills-section'),
      onVisibilityChanged:
          (info) => _handleVisibility(info.visibleFraction > 0.1),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.white12, Colors.white10],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Skills",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            buildSkillCategory("Flutter & Mobile Dev", [
              "Dart",
              "Flutter",
              "Custom Widgets",
              "State Management",
              "Animations",
            ]),
            buildSkillCategory("Backend & APIs", [
              "Flask",
              "REST APIs",
              "JWT",
              "Firebase",
              "SQLite",
            ]),
            buildSkillCategory("Machine Learning", [
              "Python",
              "Scikit-learn",
              "TensorFlow Lite",
              "TinyML",
              "Edge AI",
            ]),
          ],
        ),
      ),
    );
  }
}
