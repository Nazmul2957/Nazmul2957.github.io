import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/providers/theme_provider.dart';

class ParticleBackground extends ConsumerStatefulWidget {
  final Widget child;
  const ParticleBackground({super.key, required this.child});

  @override
  ConsumerState<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends ConsumerState<ParticleBackground>
    with TickerProviderStateMixin {
  late AnimationController _particleController;
  late AnimationController _gradientController;
  final List<Particle> particles = [];
  final Random random = Random();
  int _particleCount = 50;

  @override
  void initState() {
    super.initState();
    _particleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initParticles();
    });
  }

  void _initParticles() {
    final size = MediaQuery.of(context).size;
    // Adjust particle count based on screen size to prevent clutter on mobile
    _particleCount = size.width < 600 ? 30 : 60;
    particles.clear();
    for (int i = 0; i < _particleCount; i++) {
      particles.add(Particle(
        x: random.nextDouble() * size.width,
        y: random.nextDouble() * size.height,
        size: random.nextDouble() * 3 + 1.5,
        speed: random.nextDouble() * 0.4 + 0.1,
        angle: random.nextDouble() * 2 * pi,
      ));
    }
  }

  @override
  void dispose() {
    _particleController.dispose();
    _gradientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeProvider.notifier).isDarkMode;
    final primaryColor = Theme.of(context).primaryColor;
    final secondaryColor = Theme.of(context).colorScheme.secondary;

    // Define gradient colors based on theme
    final gradientColors = isDark
        ? [
            const Color(0xFF0A0E17),
            primaryColor.withOpacity(0.1),
            secondaryColor.withOpacity(0.1),
            const Color(0xFF0A0E17),
          ]
        : [
            const Color(0xFFF8FAFC),
            primaryColor.withOpacity(0.1),
            secondaryColor.withOpacity(0.1),
            const Color(0xFFF8FAFC),
          ];

    return Stack(
      children: [
        // Animated Gradient Background
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _gradientController,
            builder: (context, child) {
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: gradientColors,
                    stops: [
                      0.0,
                      0.3 + (_gradientController.value * 0.2),
                      0.7 - (_gradientController.value * 0.2),
                      1.0,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Particle Constellation
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _particleController,
            builder: (context, child) {
              if (particles.isEmpty) {
                _initParticles();
                return const SizedBox.shrink();
              }
              final size = MediaQuery.of(context).size;
              for (var particle in particles) {
                particle.update(size);
              }
              return CustomPaint(
                painter: ConstellationPainter(
                  particles: particles,
                  color: isDark ? primaryColor : primaryColor.withOpacity(0.8),
                  connectionDistance: size.width < 600 ? 100 : 150,
                ),
              );
            },
          ),
        ),
        widget.child,
      ],
    );
  }
}

class Particle {
  double x;
  double y;
  double size;
  double speed;
  double angle;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.angle,
  });

  void update(Size bounds) {
    x += cos(angle) * speed;
    y += sin(angle) * speed;

    if (x < 0) x = bounds.width;
    if (x > bounds.width) x = 0;
    if (y < 0) y = bounds.height;
    if (y > bounds.height) y = 0;
  }
}

class ConstellationPainter extends CustomPainter {
  final List<Particle> particles;
  final Color color;
  final double connectionDistance;

  ConstellationPainter({
    required this.particles,
    required this.color,
    required this.connectionDistance,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1.5);

    final linePaint = Paint()
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    // Draw lines between close particles
    for (int i = 0; i < particles.length; i++) {
      for (int j = i + 1; j < particles.length; j++) {
        final p1 = particles[i];
        final p2 = particles[j];
        final dx = p1.x - p2.x;
        final dy = p1.y - p2.y;
        final distance = sqrt(dx * dx + dy * dy);

        if (distance < connectionDistance) {
          final opacity = (1.0 - (distance / connectionDistance)).clamp(0.0, 1.0);
          linePaint.color = color.withOpacity(opacity * 0.5); // Max 50% opacity for lines
          canvas.drawLine(Offset(p1.x, p1.y), Offset(p2.x, p2.y), linePaint);
        }
      }
    }

    // Draw particles
    for (var particle in particles) {
      canvas.drawCircle(Offset(particle.x, particle.y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
