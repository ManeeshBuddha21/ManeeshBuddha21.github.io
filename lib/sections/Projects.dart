import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:portfolio_site/widgets/animated_slide_delay.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _visible = false;

  void _handleVisibility(bool visible) {
    if (visible && !_visible) {
      setState(() {
        _visible = true;
      });
    }
  }

  Widget buildProjectCard({
    required String title,
    required String description,
    required List<String> tech,
    required String link,
    required Duration delay,
  }) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeOut,
      opacity: _visible ? 1 : 0,
      child: DelayedSlide(
        offset: const Offset(0, 0.2),
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOut,
        delay: delay,
        child: Container(
          width: 400,
          margin: const EdgeInsets.all(12),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [Colors.white12, Colors.white10],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(description),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                children:
                    tech
                        .map(
                          (t) => Chip(
                            label: Text(t),
                            backgroundColor: Colors.white10,
                          ),
                        )
                        .toList(),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  final uri = Uri.parse(link);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                child: const Text("View Project"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('projects-section'),
      onVisibilityChanged:
          (info) => _handleVisibility(info.visibleFraction > 0.1),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Projects",
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              runSpacing: 16,
              children: [
                buildProjectCard(
                  title: "AI-Powered Smart Switchboard",
                  description:
                      "Built a Flutter app + Flask backend smart home system with anomaly detection, voice assistant, and edge automation.",
                  tech: ["Flutter", "Flask", "MQTT", "TinyML", "Firebase"],
                  link: "https://github.com/ManeeshBuddha21/smart-switchboard",
                  delay: const Duration(milliseconds: 0),
                ),
                buildProjectCard(
                  title: "Real-Time Object Detection",
                  description:
                      "Used YOLOv5 on Raspberry Pi for home security. Detected motion and sent live alerts via Telegram bot.",
                  tech: ["YOLOv5", "Python", "OpenCV", "Flask", "Telegram API"],
                  link: "https://github.com/ManeeshBuddha21/object-detection",
                  delay: const Duration(milliseconds: 200),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
