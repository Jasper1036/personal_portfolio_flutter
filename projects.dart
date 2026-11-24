import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:calculator/main.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $urlString');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'My Projects',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Project Card 1: Calculator
          _buildProjectCard(
            context: context,
            title: 'Calculator App',
            description:
                'A fully functional stateful calculator built in Flutter.',
            techStack: ['Dart', 'Flutter'],
            githubUrl: 'https://github.com/jasper1035/calculator_app-flutter',
            liveAppWidget: const CalculatorApp(),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required BuildContext context,
    required String title,
    required String description,
    required List<String> techStack,
    required String githubUrl,
    required Widget liveAppWidget,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Live Interactive App + Full-Screen Overlay Button
            SizedBox(
              height: 340,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    // 1. Virtual phone screen scaled down to prevent overflow
                    Positioned.fill(
                      child: Container(
                        color: Colors.black26,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: SizedBox(
                            width: 390,
                            height: 780,
                            child: liveAppWidget,
                          ),
                        ),
                      ),
                    ),

                    // 2. Small floating full-screen button
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Material(
                        color: Colors.black54,
                        shape: const CircleBorder(),
                        child: IconButton(
                          icon: const Icon(
                            Icons.fullscreen,
                            color: Colors.white,
                            size: 20,
                          ),
                          tooltip: 'Full Screen',
                          constraints: const BoxConstraints(
                            minWidth: 36,
                            minHeight: 36,
                          ),
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => _FullScreenAppWrapper(
                                  title: title,
                                  appWidget: liveAppWidget,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Tech Stack Chips
            Wrap(
              spacing: 8,
              children: techStack
                  .map((tech) => Chip(label: Text(tech)))
                  .toList(),
            ),
            const SizedBox(height: 8),

            // Description
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 12),

            // GitHub Link
            InkWell(
              onTap: () => _launchURL(githubUrl),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.github,
                      size: 18,
                      color: Colors.greenAccent,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'GitHub',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FullScreenAppWrapper extends StatelessWidget {
  final String title;
  final Widget appWidget;

  const _FullScreenAppWrapper({required this.title, required this.appWidget});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.fullscreen_exit),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(child: appWidget),
    );
  }
}
