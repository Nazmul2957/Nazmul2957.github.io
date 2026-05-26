import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
              const SectionTitle(title: 'Work Experience'),
              _buildExperienceItem(
                context,
                title: 'Software Engineer',
                company: 'Akij Venture Ltd, Gulshan1, Dhaka',
                period: 'January 2024 - Present',
                description:
                    'Developed and maintained multiple enterprise and e-commerce applications including Fair Value, Electronics Warranty Checker, HRIS, RTM, and Market Auditor. Specialized in Flutter, Dart, REST API, GetX, Provider, and Clean Architecture.',
              ),
              _buildExperienceItem(
                context,
                title: 'Mobile Application Developer',
                company: 'Softavion Limited, Motijheel, Dhaka',
                period: 'June 2022 - December 2023',
                description:
                    'Built the Monarch Mart e-commerce mobile application and a Ticket Checker app using QR code scanning. Supported and maintained existing e-commerce platforms, improving app performance and resolving production issues.',
              ),
              _buildExperienceItem(
                context,
                title: 'Jr Android Developer',
                company: 'STITBD, Dhanmondi, Dhaka',
                period: 'March 2021 - May 2022',
                description:
                    'Developed a Courier Service app to streamline delivery tracking, built an Educational Institute app for student management, and created a Shop Management app to handle inventory and sales.',
                isLast: true,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExperienceItem(
    BuildContext context, {
    required String title,
    required String company,
    required String period,
    required String description,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: AppTheme.primaryColor.withOpacity(0.3),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    company,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppTheme.primaryColor,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    period,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
