import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      color: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          Text(
            'Designed & Built by Nazmul Hossain Bhuiyan',
            style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
          ),
          const SizedBox(height: 8),
          Text(
            '© ${DateTime.now().year} All Rights Reserved.',
            style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
