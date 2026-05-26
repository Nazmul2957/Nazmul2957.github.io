import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/section_title.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 120,
            vertical: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Skills & Competencies'),
              Wrap(
                spacing: 24,
                runSpacing: 24,
                children: [
                  _buildSkillCategory(context, 'Programming Languages', 'Dart, Java, Kotlin'),
                  _buildSkillCategory(context, 'Frameworks & Tools', 'Flutter, Android SDK, Firebase, GetX, Riverpod, MVVM, Clean Architecture'),
                  _buildSkillCategory(context, 'Databases', 'SQLite, Firebase Firestore, SharedPreferences, Hive'),
                  _buildSkillCategory(context, 'APIs & Integration', 'RESTful APIs, JSON Parsing, QR Code, Payment Gateway'),
                  _buildSkillCategory(context, 'Version Control & CI/CD', 'Git, GitHub, GitLab'),
                  _buildSkillCategory(context, 'Testing & Debugging', 'Widget Testing, Debugging, Performance Optimization'),
                  _buildSkillCategory(context, 'Others', 'UI/UX Design, App Deployment, E-commerce & Enterprise App Development'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSkillCategory(BuildContext context, String title, String skills) {
    final skillList = skills.split(',').map((e) => e.trim()).toList();

    return Container(
      width: 350,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.code, color: AppTheme.primaryColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: skillList.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
                ),
                child: Text(
                  skill,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
