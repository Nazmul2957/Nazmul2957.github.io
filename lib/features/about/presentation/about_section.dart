import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../../shared/widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
              const SectionTitle(title: 'Education & Certifications'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: isMobile ? 1 : 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Education',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 24),
                        _buildInfoBlock(
                          context,
                          title: 'BSc in Computer Science and Engineering',
                          subtitle: 'National University, Dhaka',
                          date: 'Graduate: 2018',
                        ),
                        const SizedBox(height: 40),
                        Text(
                          'Certifications',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 24),
                        _buildInfoBlock(
                          context,
                          title: 'Java SE',
                          subtitle: 'Bangladesh-Korea Information Access Center, Department of CSE, BUET, Dhaka',
                          date: 'Nov 2016 - Apr 2017',
                        ),
                        const SizedBox(height: 16),
                        _buildInfoBlock(
                          context,
                          title: 'Programming with C++',
                          subtitle: 'New Horizons Computer Learning Center, Dhaka',
                          date: 'Jun 2016 - Aug 2016',
                        ),
                      ],
                    ),
                  ),
                  if (!isMobile) ...[
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'References',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(height: 24),
                          _buildReference(
                            context,
                            name: 'Md Jahidul Alam',
                            designation: 'Lecturer (Department of CSE)',
                            org: 'Daffodil International University',
                            email: 'jahidul.cse@diu.edu.bd',
                            phone: '01863-098889',
                          ),
                          const SizedBox(height: 24),
                          _buildReference(
                            context,
                            name: 'Tonoy Bihari Shil',
                            designation: 'Senior Software Engineer',
                            org: 'Apprise It',
                            email: 'tonoybiharis@gmail.com',
                            phone: '01749-319359',
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              if (isMobile) ...[
                const SizedBox(height: 40),
                Text(
                  'References',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 24),
                _buildReference(
                  context,
                  name: 'Md Jahidul Alam',
                  designation: 'Lecturer (Department of CSE)',
                  org: 'Daffodil International University',
                  email: 'jahidul.cse@diu.edu.bd',
                  phone: '01863-098889',
                ),
                const SizedBox(height: 24),
                _buildReference(
                  context,
                  name: 'Tonoy Bihari Shil',
                  designation: 'Senior Software Engineer',
                  org: 'Apprise It',
                  email: 'tonoybiharis@gmail.com',
                  phone: '01749-319359',
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoBlock(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String date,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          date,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }

  Widget _buildReference(
    BuildContext context, {
    required String name,
    required String designation,
    required String org,
    required String email,
    required String phone,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Theme.of(context).textTheme.bodyLarge?.color?.withOpacity(0.05) ?? Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 4),
          Text(
            designation,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            org,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.email, size: 16, color: Theme.of(context).textTheme.bodyMedium?.color),
              const SizedBox(width: 8),
              Text(
                email,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.phone, size: 16, color: Theme.of(context).textTheme.bodyMedium?.color),
              const SizedBox(width: 8),
              Text(
                phone,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
