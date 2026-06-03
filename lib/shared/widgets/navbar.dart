import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/theme_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends ConsumerWidget {
  final Function(int) onMenuTap;

  const NavBar({super.key, required this.onMenuTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeProvider.notifier).isDarkMode;

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        bool isMobile = sizingInformation.deviceScreenType == DeviceScreenType.mobile;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '<Nazmul />',
                style: GoogleFonts.inter(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              if (!isMobile)
                Row(
                  children: [
                    _NavBarItem(title: 'Home', onTap: () => onMenuTap(0)),
                    _NavBarItem(title: 'Skills', onTap: () => onMenuTap(1)),
                    _NavBarItem(title: 'Experience', onTap: () => onMenuTap(2)),
                    _NavBarItem(title: 'Projects', onTap: () => onMenuTap(3)),
                    _NavBarItem(title: 'About', onTap: () => onMenuTap(4)),
                    const SizedBox(width: 16),
                    IconButton(
                      icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () async {
                        final url = Uri.parse('mailto:csenazmul.sbpgc@gmail.com');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      child: const Text('Contact Me'),
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    IconButton(
                      icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
                    ),
                    IconButton(
                      icon: Icon(Icons.menu, color: Theme.of(context).textTheme.bodyLarge?.color),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
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
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onTap,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Text(
          title,
          style: GoogleFonts.inter(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

