import 'package:flutter/material.dart';
import 'dart:math';
import 'chef_profile_screen.dart';
import 'meal_detail_screen.dart';
import 'notification_screen.dart';
import 'search_and_filter_screen.dart';
import 'order_screen.dart';
import 'more_screen.dart';
import 'support_screen.dart';
import 'complete_profile_personal_info_screen.dart';
import '../widgets/meal_card.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _showWelcomeModal = true;
  int _selectedTab = 0;

  final List<Map<String, String>> _deals = [
    {'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836', 'title': 'Top deals'},
    {'image': 'https://images.unsplash.com/photo-1464306076886-debca5e8a6b0', 'title': 'Chef special'},
  ];

  final List<Map<String, String>> _meals = [
    {'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308', 'title': 'Grilled Chicken with Jollof Rice', 'chef': 'Chef Nnamdi', 'price': '₦3,500'},
    {'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836', 'title': 'Fried Rice & Turkey', 'chef': 'Chef Amaka', 'price': '₦2,800'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: _buildAppBar(),
      ),
      body: Stack(
        children: [
          _buildContent(),
          if (_showWelcomeModal) _buildWelcomeModal(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildAppBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1528763385108-d3a3edff482d?w=100'),
              radius: 24,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('10:15 AM - Time for Breakfast', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      Text('Surulere', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Icon(Icons.expand_more, color: Color(0xFF386641)),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Color(0xFF386641), size: 28),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const NotificationScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _buildProfileCompletionBanner(),
        const SizedBox(height: 16),
        _buildSearchAndTabs(),
        const SizedBox(height: 16),
        _buildDealsSection(),
        const SizedBox(height: 16),
        _buildMealsSection(),
      ],
    );
  }

  Widget _buildProfileCompletionBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CompleteProfilePersonalInfoScreen()));
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFFf3f7f2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: const [
              Icon(Icons.person_pin, color: Color(0xFF386641), size: 28),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Complete your profile', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('A few details makes all the difference', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchAndTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchAndFilterScreen())),
            child: AbsorbPointer(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for meals, chefs and more',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextButton(onPressed: () {}, child: const Text('Marketplace')),
              ),
              Expanded(
                child: TextButton(onPressed: () {}, child: const Text("Chef's Kitchen")),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDealsSection() {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16),
        itemCount: _deals.length,
        itemBuilder: (context, index) {
          final deal = _deals[index];
          return Container(
            margin: const EdgeInsets.only(right: 12),
            width: 220,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(deal['image']!, fit: BoxFit.cover),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    bottom: 12,
                    child: Text(deal['title']!, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMealsSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _meals.length,
      itemBuilder: (context, index) {
        final meal = _meals[index];
        return MealCard(
          image: meal['image']!,
          title: meal['title']!,
          chefName: meal['chef']!,
          chefAvatar: 'https://randomuser.me/api/portraits/men/${32 + index}.jpg',
          tag: index == 0 ? 'Low-fat' : 'Vegan',
          price: meal['price']!,
          oldPrice: index == 1 ? '₦3,280' : null,
          rating: '3.0',
          time: '30 min',
          isFavorite: index == 0,
          isAvailable: index != 1, // Second meal is out of stock
          isClosed: index == 2, // Third meal is closed (if exists)
          quantity: null,
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MealDetailScreen())),
          onFavorite: () {},
          onNotify: () {},
          onAdd: null,
          onRemove: null,
        );
      },
    );
  }

  Widget _buildWelcomeModal() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: Container(
          width: 300,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const _ConfettiBackground(particleCount: 50),
                    Container(
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(color: const Color(0xFF386641), borderRadius: BorderRadius.circular(16)),
                      child: Center(child: Image.asset('assets/images/logo.png', width: 50, height: 50, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Welcome onboard, you’ve been created with N500 meal credit",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, height: 1.4),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6B9080),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () => setState(() => _showWelcomeModal = false),
                  child: const Text('Get started', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _selectedTab,
      onTap: (i) {
        if (i == 1) Navigator.of(context).push(MaterialPageRoute(builder: (_) => const OrderScreen()));
        else if (i == 2) Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SupportScreen()));
        else if (i == 3) Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MoreScreen()));
        else if (i == 0) setState(() => _selectedTab = i);
      },
      selectedItemColor: const Color(0xFF386641),
      unselectedItemColor: Colors.grey.shade600,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), activeIcon: Icon(Icons.explore), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.receipt_long_outlined), activeIcon: Icon(Icons.receipt_long), label: 'Order'),
        BottomNavigationBarItem(icon: Icon(Icons.support_agent_outlined), activeIcon: Icon(Icons.support_agent), label: 'Support'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), activeIcon: Icon(Icons.more_horiz), label: 'More'),
      ],
    );
  }
}

class _ConfettiBackground extends StatelessWidget {
  final int particleCount;
  const _ConfettiBackground({Key? key, required this.particleCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [Colors.red.shade300, Colors.green.shade300, Colors.blue.shade300, Colors.yellow.shade700];
    return Stack(
      children: List.generate(particleCount, (index) {
        final size = Random().nextDouble() * 4 + 2;
        final angle = Random().nextDouble() * 2 * pi;
        final distance = Random().nextDouble() * 60 + 20;
        final x = cos(angle) * distance;
        final y = sin(angle) * distance;
        final color = colors[Random().nextInt(colors.length)];
        return Positioned(
          left: 150 + x - size / 2, // Centered around 150
          top: 75 + y - size / 2, // Centered around 75
          child: Container(width: size, height: size, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        );
      }),
    );
  }
} 