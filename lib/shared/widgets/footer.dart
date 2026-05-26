import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      color: AppTheme.surfaceColor,
      child: Column(
        children: [
          const Text(
            'Designed & Built by Nazmul Hossain Bhuiyan',
            style: TextStyle(color: AppTheme.textSecondary),
          ),
          const SizedBox(height: 8),
          Text(
            '© ${DateTime.now().year} All Rights Reserved.',
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
