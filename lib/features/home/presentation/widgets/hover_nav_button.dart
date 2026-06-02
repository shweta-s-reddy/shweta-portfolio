import 'package:flutter/material.dart';

class HoverNavButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const HoverNavButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  State<HoverNavButton> createState() => _HoverNavButtonState();
}

class _HoverNavButtonState extends State<HoverNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final activeColor = isDark ? Colors.cyanAccent : theme.colorScheme.primary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.text,
                style: TextStyle(
                  color: _isHovered
                      ? activeColor
                      : (isDark ? Colors.white70 : Colors.black87),
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 2),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _isHovered ? 24 : 0,
                color: activeColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
