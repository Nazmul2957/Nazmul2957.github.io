import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/section_title.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        
        int crossAxisCount = 3;
        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          crossAxisCount = 2;
        } else if (isMobile) {
          crossAxisCount = 1;
        }

        return Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 120,
            vertical: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Featured Projects'),
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                childAspectRatio: 0.85,
                children: [
                  _buildProjectCard(
                    context,
                    title: 'Metro Mart',
                    description: 'A cross-platform e-commerce application for product browsing, secure online payments, and scalable API integration.',
                    technologies: ['Flutter', 'Dart', 'GetX', 'MVVM', 'Payment Gateway'],
                    link: 'https://play.google.com/store/apps/details?id=com.fairvalue.nl.app',
                    imageUrl: 'https://play-lh.googleusercontent.com/DC06rYyEvM9Dl2M2lLMIhpGr4eYHEffQnz4XxvKs0ahGpasuIIa52l7wWOE4vghyVOWLahYf8B0UDiwOYm42Fg',
                  ),
                  _buildProjectCard(
                    context,
                    title: 'Electronics Warranty Checker',
                    description: 'Mobile app for instant electronics warranty validation and customer verification using QR code and serial number scanning.',
                    technologies: ['Flutter', 'REST API', 'GetX', 'QR Scanner'],
                    link: 'https://play.google.com/store/apps/details?id=com.warranty.nl',
                  ),
                  _buildProjectCard(
                    context,
                    title: 'HRIS Mobile App',
                    description: 'Comprehensive HRIS application streamlining employee management, attendance tracking, and payroll processing.',
                    technologies: ['Flutter', 'REST API', 'GetX', 'MVVM'],
                  ),
                  _buildProjectCard(
                    context,
                    title: 'RTM (Route-to-Market)',
                    description: 'App for nationwide sales teams enhancing field reporting, sales activity tracking, and distribution monitoring.',
                    technologies: ['Flutter', 'Provider', 'Clean Architecture', 'Location Services'],
                  ),
                  _buildProjectCard(
                    context,
                    title: 'Market Auditor',
                    description: 'Real-time market data collection, analysis, and automated reporting tool for data-driven decision-making.',
                    technologies: ['Flutter', 'Provider', 'Clean Architecture'],
                  ),
                  _buildProjectCard(
                    context,
                    title: 'Monarch Mart',
                    description: 'E-commerce mobile application enabling smooth product browsing, secure checkout, and efficient order management.',
                    technologies: ['Flutter', 'GetX', 'Clean Architecture'],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectCard(
    BuildContext context, {
    required String title,
    required String description,
    required List<String> technologies,
    String? link,
    String? imageUrl,
  }) {
    return Container(
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (imageUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.folder_open,
                      size: 40,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                )
              else
                const Icon(Icons.folder_open, size: 40, color: AppTheme.primaryColor),
              if (link != null)
                IconButton(
                  icon: const Icon(Icons.open_in_new, color: AppTheme.textSecondary),
                  onPressed: () async {
                    final url = Uri.parse(link);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          if (imageUrl != null) ...[
            const SizedBox(height: 12),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  height: 64,
                  width: 64,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(),
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: technologies.map((tech) {
              return Text(
                tech,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textSecondary,
                      fontFamily: 'monospace',
                    ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
