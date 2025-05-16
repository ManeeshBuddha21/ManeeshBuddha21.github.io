import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  Widget buildExperience({
    required String company,
    required String role,
    required String duration,
    required List<String> points,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          company,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text("$role • $duration", style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        ...points.map(
          (p) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("• ", style: TextStyle(color: Colors.white)),
              Expanded(child: Text(p)),
            ],
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            "Experience",
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          buildExperience(
            company: "DXC Technologies",
            role: "Flutter & Flask Developer",
            duration: "Jun 2021 – Jul 2023",
            points: [
              "Built cross-platform apps using Flutter and Dart.",
              "Developed Flask APIs with JWT auth and cloud sync.",
              "Integrated ML-powered smart suggestions.",
              "Used Firebase & SQLite for real-time and offline data.",
            ],
          ),
          buildExperience(
            company: "California State University, Fullerton",
            role: "Research Assistant – ML & IoT",
            duration: "Aug 2023 – May 2025",
            points: [
              "Worked on energy optimization using TinyML on Raspberry Pi.",
              "Designed ML models for edge automation with high accuracy.",
              "Deployed real-time pipelines using TensorFlow Lite.",
              "Analyzed and visualized sensor datasets with Python tools.",
            ],
          ),
        ],
      ),
    );
  }
}
