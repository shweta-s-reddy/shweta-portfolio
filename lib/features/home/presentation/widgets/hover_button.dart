import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool primary;

  const HoverButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.primary = true,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final primaryColor = widget.primary
        ? (isDark ? Colors.cyanAccent : theme.colorScheme.primary)
        : Colors.transparent;

    final textColor = widget.primary
        ? (isDark ? Colors.black : Colors.white)
        : (isDark ? Colors.white70 : Colors.black87);

    final borderColor = widget.primary
        ? Colors.transparent
        : (isDark ? Colors.white30 : Colors.black26);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: _isHovered
                ? (widget.primary
                      ? primaryColor.withValues(alpha: 0.9)
                      : (isDark
                            ? Colors.white10
                            : Colors.black.withValues(alpha: 0.05)))
                : primaryColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: _isHovered && !widget.primary
                  ? (isDark ? Colors.cyanAccent : theme.colorScheme.primary)
                  : borderColor,
              width: 1.5,
            ),
            boxShadow: _isHovered && widget.primary
                ? [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.4),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              child: Text(
                widget.text,
                style: TextStyle(
                  color: _isHovered && !widget.primary
                      ? (isDark ? Colors.cyanAccent : theme.colorScheme.primary)
                      : textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
