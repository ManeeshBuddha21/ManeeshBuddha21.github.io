import 'package:flutter/material.dart';

class DelayedSlide extends StatefulWidget {
  final Offset offset;
  final Duration duration;
  final Curve curve;
  final Widget child;
  final Duration delay;

  const DelayedSlide({
    super.key,
    required this.offset,
    required this.duration,
    required this.curve,
    required this.child,
    this.delay = Duration.zero,
  });

  @override
  State<DelayedSlide> createState() => _DelayedSlideState();
}

class _DelayedSlideState extends State<DelayedSlide>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = Tween<Offset>(
      begin: widget.offset,
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    Future.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation, child: widget.child);
  }
}
