import 'package:flutter/material.dart';
import 'package:shweta_portfolio/core/theme/app_theme.dart';
import 'package:shweta_portfolio/core/widgets/entrance_animation.dart';
import 'package:shweta_portfolio/features/home/presentation/widgets/hover_button.dart';
import 'package:shweta_portfolio/features/home/presentation/widgets/hover_nav_button.dart';

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

    final bgGradient = AppTheme.getBackgroundGradient(isDark);

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
            HoverNavButton(text: 'About', onPressed: () {}),
            HoverNavButton(text: 'Projects', onPressed: () {}),
            HoverNavButton(text: 'Contact', onPressed: () {}),
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
