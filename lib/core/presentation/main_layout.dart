import 'package:flutter/material.dart';
import '../../shared/widgets/navbar.dart';
import '../../shared/widgets/footer.dart';
import '../../features/home/presentation/home_section.dart';
import '../../features/skills/presentation/skills_section.dart';
import '../../features/experience/presentation/experience_section.dart';
import '../../features/projects/presentation/projects_section.dart';
import '../../features/about/presentation/about_section.dart';
import '../../features/contact/presentation/contact_section.dart';

import '../../shared/widgets/particle_background.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(6, (index) => GlobalKey());

  void _scrollToSection(int index) {
    Scrollable.ensureVisible(
      _sectionKeys[index].currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Text(
                '<Nazmul />',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            _buildDrawerItem('Home', 0),
            _buildDrawerItem('Skills', 1),
            _buildDrawerItem('Experience', 2),
            _buildDrawerItem('Projects', 3),
            _buildDrawerItem('About', 4),
            _buildDrawerItem('Contact', 5),
          ],
        ),
      ),
      body: ParticleBackground(
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 80), // Offset for fixed navbar
                  HomeSection(key: _sectionKeys[0]),
                  SkillsSection(key: _sectionKeys[1]),
                  ExperienceSection(key: _sectionKeys[2]),
                  ProjectsSection(key: _sectionKeys[3]),
                  AboutSection(key: _sectionKeys[4]),
                  ContactSection(key: _sectionKeys[5]),
                  const Footer(),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: NavBar(onMenuTap: _scrollToSection),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(String title, int index) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context); // Close drawer
        _scrollToSection(index);
      },
    );
  }
}
