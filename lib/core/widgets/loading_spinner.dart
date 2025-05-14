import 'package:flutter/material.dart';

// 로딩 UI
class QuadCircleSpinner extends StatefulWidget {
  final double size;
  final List<Color>? colors;

  const QuadCircleSpinner({
    super.key,
    this.size = 80.0,
    this.colors,
  });

  @override
  State<QuadCircleSpinner> createState() => _QuadCircleSpinnerState();
}

class _QuadCircleSpinnerState extends State<QuadCircleSpinner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _animations = List.generate(4, (index) {
      return Tween<double>(begin: 0.2, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.1, 0.6 + index * 0.1, curve: Curves.easeInOut),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double circleSize = widget.size / 2.5;
    final defaultColors = [
      const Color(0xFFD3FFF3),
      const Color(0xFFD5EBFF),
      const Color(0xFFFFDADA),
      const Color(0xFFFFE7CD),
    ];
    final colors = widget.colors ?? defaultColors;

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) => Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 8,
          spacing: 8,
          children: List.generate(4, (i) {
            return Opacity(
              opacity: _animations[i].value,
              child: Container(
                width: circleSize,
                height: circleSize,
                decoration: BoxDecoration(
                  color: colors[i].withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
