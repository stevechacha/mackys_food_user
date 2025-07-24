import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, String>> _mealFavorites = [
    {
      'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      'title': 'Chips dine',
      'tag': 'Vegan',
      'price': '₦2,780',
      'oldPrice': '₦3,280',
      'rating': '3.0',
    },
  ];
  final List<Map<String, String>> _kitchenFavorites = [
    {
      'image': 'https://images.unsplash.com/photo-1464306076886-debca5e8a6b0',
      'title': "Chef Amaka's Cooking Space",
      'subtitle': 'Home kitchen • 8 years in cooking',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('Favorite', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF386641),
          unselectedLabelColor: Colors.black54,
          indicator: UnderlineTabIndicator(
            borderSide: const BorderSide(color: Color(0xFF386641), width: 2),
            insets: const EdgeInsets.symmetric(horizontal: 16.0),
          ),
          tabs: const [
            Tab(text: 'Meal'),
            Tab(text: 'Kitchen'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMealTab(),
          _buildKitchenTab(),
        ],
      ),
    );
  }

  Widget _buildMealTab() {
    if (_mealFavorites.isEmpty) {
      return _buildEmptyState();
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _mealFavorites.length,
      itemBuilder: (context, index) {
        final meal = _mealFavorites[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      meal['image']!,
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(meal['tag']!, style: const TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(Icons.favorite, color: Colors.red.shade400),
                  ),
                ],
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                ),
                title: Text(meal['title']!),
                subtitle: const Text('Prep by Chef Mathias • 30 min'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(meal['rating']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Text(meal['price']!, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF386641))),
                    const SizedBox(width: 8),
                    Text(meal['oldPrice']!, style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildKitchenTab() {
    if (_kitchenFavorites.isEmpty) {
      return _buildEmptyState();
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _kitchenFavorites.length,
      itemBuilder: (context, index) {
        final kitchen = _kitchenFavorites[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  kitchen['image']!,
                  height: 140,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/32.jpg'),
                ),
                title: Text(kitchen['title']!),
                subtitle: Text(kitchen['subtitle']!),
                trailing: Icon(Icons.favorite, color: Colors.red.shade400),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_outlined, size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          const Text('No notification', style: TextStyle(fontSize: 16, color: Colors.black54)),
          const Text('You currently have no notification', style: TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }
} 