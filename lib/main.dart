// main.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_site/sections/about.dart';
import 'package:portfolio_site/sections/experience.dart';
import 'package:portfolio_site/sections/hero.dart';
import 'package:portfolio_site/sections/projects.dart';
import 'package:portfolio_site/sections/skills.dart';
import 'package:portfolio_site/sections/contact.dart';
import 'package:portfolio_site/widgets/app_bar.dart';
import 'package:portfolio_site/widgets/animated_section.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buddha Maneesh Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F1115),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: Colors.white),
        ),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey skillsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: CustomAppBar(
          onNavItemSelected: (section) {
            switch (section) {
              case 'Home':
                scrollToSection(heroKey);
                break;
              case 'About':
                scrollToSection(aboutKey);
                break;
              case 'Skills':
                scrollToSection(skillsKey);
                break;
              case 'Experience':
                scrollToSection(experienceKey);
                break;
              case 'Projects':
                scrollToSection(projectsKey);
                break;
              case 'Contact':
                scrollToSection(contactKey);
                break;
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedSection(child: HeroSection(key: heroKey)),
            AnimatedSection(child: AboutSection(key: aboutKey)),
            AnimatedSection(child: SkillsSection(key: skillsKey)),
            AnimatedSection(child: ExperienceSection(key: experienceKey)),
            AnimatedSection(child: ProjectsSection(key: projectsKey)),
            AnimatedSection(child: ContactSection(key: contactKey)),
          ],
        ),
      ),
    );
  }
}
