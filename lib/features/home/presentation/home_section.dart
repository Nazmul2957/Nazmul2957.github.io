import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        
        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 600),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 120,
            vertical: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hi, I am',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppTheme.primaryColor,
                    ),
              ),
              const SizedBox(height: 16),
              Text(
                'Nazmul Hossain Bhuiyan.',
                style: isMobile
                    ? Theme.of(context).textTheme.displaySmall
                    : Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Flutter Developer',
                style: isMobile
                    ? Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppTheme.textSecondary,
                        )
                    : Theme.of(context).textTheme.displayMedium?.copyWith(
                          color: AppTheme.textSecondary,
                        ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: isMobile ? double.infinity : 600,
                child: Text(
                  'Flutter developer with 4 years of experience building and deploying cross-platform Android and iOS applications using Flutter and Dart. Proficient in clean architecture, state management and RESTful API integration. Experienced in Firebase, CI/CD pipelines, and performance optimization to deliver scalable, high-performing apps with exceptional user experience.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 48),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      final url = Uri.parse('https://github.com/Nazmul2957');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: const Text('Check out my GitHub!'),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: () async {
                      final url = Uri.parse('https://linkedin.com/in/nazmul-hossain1');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                    child: const Text('LinkedIn'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
