import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;
        
        Widget content = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi, I am',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).primaryColor,
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
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      )
                  : Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
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
        );

        Widget imageWidget = Center(
          child: Container(
            width: isMobile ? 220 : 300,
            height: isMobile ? 220 : 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.2),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/images/profile.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );

        return Container(
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 600),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 24 : 120,
            vertical: 80,
          ),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    imageWidget,
                    const SizedBox(height: 40),
                    content,
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(flex: 3, child: content),
                    const SizedBox(width: 40),
                    Expanded(flex: 2, child: imageWidget),
                  ],
                ),
        );
      },
    );
  }
}
