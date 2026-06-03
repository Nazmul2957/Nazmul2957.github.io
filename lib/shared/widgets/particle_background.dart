import 'dart:math';
import 'package:flutter/material.dart';

class ParticleBackground extends StatefulWidget {
  final Widget child;
  const ParticleBackground({super.key, required this.child});

  @override
  State<ParticleBackground> createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Particle> particles = [];
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      for (int i = 0; i < 30; i++) {
        particles.add(Particle(
          x: random.nextDouble() * size.width,
          y: random.nextDouble() * size.height,
          size: random.nextDouble() * 4 + 2,
          speed: random.nextDouble() * 0.5 + 0.1,
          angle: random.nextDouble() * 2 * pi,
          color: Colors.blueAccent.withOpacity(random.nextDouble() * 0.5 + 0.1),
        ));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              if (particles.isEmpty) return const SizedBox.shrink();
              final size = MediaQuery.of(context).size;
              for (var particle in particles) {
                particle.update(size);
              }
              return CustomPaint(
                painter: ParticlePainter(particles: particles),
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
  Color color;

  Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speed,
    required this.angle,
    required this.color,
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

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;

  ParticlePainter({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      final paint = Paint()
        ..color = particle.color
        ..style = PaintingStyle.fill
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
      canvas.drawCircle(Offset(particle.x, particle.y), particle.size, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
