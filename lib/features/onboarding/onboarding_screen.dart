import 'package:flutter/material.dart';
import 'package:mackys_partners/features/auth/presentation/pages/login_screen.dart';
import '../auth/presentation/pages/signup_screen.dart';
// import '../auth/presentation/pages/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<_OnboardingPageData> _pages = [
    _OnboardingPageData(
      imageUrl: 'assets/images/onboarding1.png',
      label: 'For happy customer',
      labelColor: const Color(0xFFD32F2F),
      title: 'Affordable, delicious, and made for your happiness. Enjoy every bite',
    ),
    _OnboardingPageData(
      imageUrl: 'assets/images/onboarding2.png',
      label: 'For delivery rider',
      labelColor: const Color(0xFFFBC02D),
      title: 'Fast, fresh, delivered right to your door—your favorite meals, hassle-free',
    ),
    _OnboardingPageData(
      imageUrl: 'assets/images/onboarding3.png',
      label: 'For chef in the kitchen',
      labelColor: const Color(0xFF388E3C),
      title: 'Your personal chef, crafting meals just for you. Fresh, homemade, and made with love',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0),
                    child: _OnboardingImageCard(
                      page: page,
                      showIndicator: true,
                      indicatorIndex: _currentPage,
                      indicatorCount: _pages.length,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const SignupScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF386641),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        elevation: 0,
                      ),
                      child: const Text('Create account', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 17)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        // TODO: Replace with actual login page when available
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF386641)),
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        backgroundColor: Colors.white,
                        elevation: 0,
                      ),
                      child: const Text('Have an account? Login', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingImageCard extends StatelessWidget {
  final _OnboardingPageData page;
  final bool showIndicator;
  final int indicatorIndex;
  final int indicatorCount;
  const _OnboardingImageCard({required this.page, this.showIndicator = false, this.indicatorIndex = 0, this.indicatorCount = 1});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28),
      child: Stack(
        children: [
          Image.asset(
            page.imageUrl,
            width: double.infinity,
            height: 440,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.grey[200],
              height: 440,
              child: const Icon(Icons.image_not_supported, size: 80, color: Colors.grey),
            ),
          ),
          // Overlay for gradient and content
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
            ),
          ),
          // Label
          Positioned(
            left: 20,
            bottom: 110,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                page.label,
                style: TextStyle(
                  color: page.labelColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          // Title
          Positioned(
            left: 20,
            right: 20,
            bottom: 60,
            child: Text(
              page.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                height: 1.4,
                shadows: [Shadow(blurRadius: 8, color: Colors.black26)],
              ),
            ),
          ),
          // Indicator
          if (showIndicator)
            Positioned(
              left: 20,
              bottom: 28,
              child: _PageIndicator(currentPage: indicatorIndex, pageCount: indicatorCount),
            ),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  const _PageIndicator({required this.currentPage, required this.pageCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(pageCount, (index) {
        final isActive = index == currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.only(right: 6),
          width: isActive ? 18 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(6),
          ),
        );
      }),
    );
  }
}

class _OnboardingPageData {
  final String imageUrl;
  final String label;
  final Color labelColor;
  final String title;
  const _OnboardingPageData({required this.imageUrl, required this.label, required this.labelColor, required this.title});
}
