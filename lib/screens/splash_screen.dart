import 'package:bookie/screens/app_home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _imageAnimation;
  late Animation<double> _textAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration:
          const Duration(seconds: 2), // Adjust the animation duration here
    );

    _imageAnimation = Tween(begin: -300.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInCirc),
    );

    _textAnimation = Tween(begin: 300.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc),
    );

    _controller.forward();

    // Simulate a few seconds delay before navigating to the HomeScreen
    Future.delayed(
        const Duration(seconds: 4) + const Duration(milliseconds: 200), () {
      Navigator.pushReplacementNamed(context,
          '/home'); // Replace '/' with the route name for your AppHomeScreen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2E2E2E),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: Offset(_imageAnimation.value, 0),
                  child: Image.asset(
                    'assets/images/5836.jpg',
                    width: 240,
                    height: 240,
                  ),
                ),
                const SizedBox(height: 20),
                Transform.translate(
                  offset: Offset(_textAnimation.value, 0),
                  child: const Text(
                    'Bookie',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Transform.translate(
                  offset: Offset(_textAnimation.value, 0),
                  child: const Text(
                    'Search any book and read it for free',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
