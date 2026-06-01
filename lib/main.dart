import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode =
      ThemeMode.dark; // Default to dark mode for portfolio style

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shweta.dev',
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9F7FC),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF0A0713),
      ),
      home: MyHomePage(
        title: 'shweta.dev',
        themeMode: _themeMode,
        onThemeToggle: _toggleTheme,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.themeMode,
    required this.onThemeToggle,
  });

  final String title;
  final ThemeMode themeMode;
  final VoidCallback onThemeToggle;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isMobile = mediaQuery.size.width < 700;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final bgGradient = isDark
        ? const LinearGradient(
            colors: [Color(0xFF0A0713), Color(0xFF1B1235)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
        : const LinearGradient(
            colors: [Color(0xFFF3E7FC), Color(0xFFE3F2FD)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            letterSpacing: -0.5,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        actions: [
          if (!isMobile) ...[
            _HoverNavButton(text: 'About', onPressed: () {}),
            _HoverNavButton(text: 'Projects', onPressed: () {}),
            _HoverNavButton(text: 'Contact', onPressed: () {}),
            const SizedBox(width: 16),
          ],
          IconButton(
            onPressed: widget.onThemeToggle,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: animation,
                child: ScaleTransition(scale: animation, child: child),
              ),
              child: widget.themeMode == ThemeMode.dark
                  ? const Icon(
                      Icons.light_mode,
                      key: ValueKey('light_mode'),
                      color: Colors.amberAccent,
                    )
                  : const Icon(
                      Icons.dark_mode,
                      key: ValueKey('dark_mode'),
                      color: Colors.indigo,
                    ),
            ),
            tooltip: 'Toggle Theme',
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(gradient: bgGradient),
        child: Stack(
          children: [
            // Decorative background blobs for a premium visual aesthetic
            Positioned(
              top: -100,
              right: -100,
              child: AnimatedOpacity(
                opacity: isDark ? 0.15 : 0.08,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark ? Colors.purpleAccent : Colors.deepPurple,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: -150,
              left: -150,
              child: AnimatedOpacity(
                opacity: isDark ? 0.15 : 0.08,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark ? Colors.cyanAccent : Colors.blueAccent,
                  ),
                ),
              ),
            ),
            // Centered main content
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 100.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Animate-in Title
                    EntranceAnimation(
                      delay: const Duration(milliseconds: 100),
                      child: ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: isDark
                              ? [
                                  Colors.cyanAccent,
                                  Colors.purpleAccent,
                                  Colors.pinkAccent,
                                ]
                              : [Colors.indigo, Colors.purple, Colors.pink],
                        ).createShader(bounds),
                        child: Text(
                          'Welcome to My Portfolio',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isMobile ? 36 : 56,
                            fontWeight: FontWeight.w900,
                            color: Colors
                                .white, // Color is overridden by ShaderMask shader, but required
                            letterSpacing: -1.5,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Animate-in Subtitle
                    EntranceAnimation(
                      delay: const Duration(milliseconds: 400),
                      child: Text(
                        'Crafting beautiful, interactive, and high-performance digital experiences.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 20,
                          color: isDark ? Colors.white70 : Colors.black54,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Animate-in Buttons
                    EntranceAnimation(
                      delay: const Duration(milliseconds: 700),
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: [
                          HoverButton(
                            text: 'Explore Work',
                            onPressed: () {},
                            primary: true,
                          ),
                          HoverButton(
                            text: 'Get In Touch',
                            onPressed: () {},
                            primary: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HoverNavButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const _HoverNavButton({required this.text, required this.onPressed});

  @override
  State<_HoverNavButton> createState() => _HoverNavButtonState();
}

class _HoverNavButtonState extends State<_HoverNavButton> {
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

class EntranceAnimation extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;

  const EntranceAnimation({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 800),
  });

  @override
  State<EntranceAnimation> createState() => _EntranceAnimationState();
}

class _EntranceAnimationState extends State<EntranceAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.forward();
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
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(position: _slideAnimation, child: widget.child),
    );
  }
}
