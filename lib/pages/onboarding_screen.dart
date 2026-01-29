import 'package:flutter/material.dart';
import 'onboarding_page.dart'; // Ensure this is the correct path

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  void _navigateToLogin() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          OnboardingPage(
            imagePath: 'assets/images/image_1.png',
            title: 'A Breath of Fresh Air',
            description:
                'There’s nothing more refreshing than going outside on a fresh day.',
            onNext: _nextPage,
          ),
          OnboardingPage(
            imagePath: 'assets/images/image_18.png',
            title: 'But the outside is unpredictable',
            description:
                'It is important to have measures of the quality of air, its relative humidity and the outside temperature to know the appropriate measures to take.',
            onPrevious: _previousPage,
            onNext: _nextPage,
          ),
          OnboardingPage(
            imagePath: 'assets/images/image_3.png',
            title: 'Check and Control',
            description:
                'With one notification, you can check and decide about the atmosphere around you!',
            onPrevious: _previousPage,
            onNext: _nextPage,
          ),
          OnboardingPage(
            imagePath: 'assets/images/green_thumbs_up_1124611.png',
            title: 'Get Started',
            description: 'Ready to get started? Let’s move on to the login.',
            isLastPage: true,
            onStart: _navigateToLogin,
            onPrevious: _previousPage,
          ),
        ],
      ),
    );
  }
}
