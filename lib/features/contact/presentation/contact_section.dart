import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Get In Touch',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 600,
                child: Text(
                  'I am currently looking for new opportunities. Whether you have a question or just want to say hi, I will try my best to get back to you!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Theme.of(context).textTheme.bodyMedium?.color),
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 24,
                runSpacing: 24,
                children: [
                  _buildContactItem(
                    context,
                    icon: Icons.phone,
                    title: 'Phone',
                    content: '+880 1629-668325',
                    onTap: () async {
                      final url = Uri.parse('tel:+8801629668325');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                  ),
                  _buildContactItem(
                    context,
                    icon: Icons.location_on,
                    title: 'Location',
                    content: 'Dhaka, Bangladesh',
                  ),
                  _buildContactItem(
                    context,
                    icon: Icons.link,
                    title: 'LinkedIn',
                    content: 'linkedin.com/in/nazmul-hossain1',
                    onTap: () async {
                      final url = Uri.parse('https://linkedin.com/in/nazmul-hossain1');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                  ),
                  _buildContactItem(
                    context,
                    icon: Icons.code,
                    title: 'GitHub',
                    content: 'github.com/Nazmul2957',
                    onTap: () async {
                      final url = Uri.parse('https://github.com/Nazmul2957');
                      if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String content,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.05) ?? Colors.black12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32, color: Theme.of(context).primaryColor),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              content,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
