import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.white12, Colors.white10],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white10.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Buddha Maneesh",
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Flutter • Flask • Machine Learning Developer",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.grey[300]),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              children: [
                ElevatedButton(
                  onPressed:
                      () => _launch("https://github.com/ManeeshBuddha21"),
                  child: const Text("GitHub"),
                ),
                ElevatedButton(
                  onPressed:
                      () => _launch(
                        "https://www.linkedin.com/in/buddhamaneeshgupta",
                      ),
                  child: const Text("LinkedIn"),
                ),
                OutlinedButton(
                  onPressed:
                      () => _launch("mailto:buddhamaneeshgupta@gmail.com"),
                  child: const Text("Contact Me"),
                ),
                OutlinedButton(
                  onPressed: () => _launch("https://example.com/resume.pdf"),
                  child: const Text("Download Résumé"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
