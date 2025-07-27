import 'package:flutter/material.dart';
import '../order/checkout_screen.dart';

class MealDetailScreen extends StatefulWidget {
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  bool _isFavorite = false;
  int _selectedTab = 0;
  int _quantity = 0;
  final double _originalPrice = 3280.0;
  final double _discountedPrice = 2780.0;

  void _incrementQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decrementQuantity() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  double get _totalPrice => _quantity * _discountedPrice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 300.0,
                backgroundColor: Colors.white,
                elevation: 0,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
                        fit: BoxFit.cover,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.5),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.share_outlined, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      _isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () => setState(() => _isFavorite = !_isFavorite),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Grilled Chicken with Jollof Rice',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1581093450005-95a28f7d98c2'),
                            radius: 20,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Prep by Chef Mathias',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: List.generate(
                                      5,
                                      (i) => Icon(
                                        i < 3 ? Icons.star : Icons.star_border,
                                        size: 16,
                                        color: Colors.amber,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    '3.0',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: const [
                              Icon(Icons.access_time, size: 16, color: Colors.grey),
                              SizedBox(width: 4),
                              Text('30 min', style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '₦${_discountedPrice.toInt()}',
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF386641),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '₦${_originalPrice.toInt()}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          if (_quantity == 0)
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.notifications_none),
                              label: const Text('Notify me when available'),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF386641),
                              ),
                            )
                          else
                            Row(
                              children: [
                                IconButton(
                                  onPressed: _decrementQuantity,
                                  icon: const Icon(Icons.remove_circle_outline),
                                  color: const Color(0xFF386641),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFF386641)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    '$_quantity',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF386641),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: _incrementQuantity,
                                  icon: const Icon(Icons.add_circle_outline),
                                  color: const Color(0xFF386641),
                                ),
                              ],
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _buildTag('Breakfast'),
                          _buildTag('Low-fat'),
                          _buildTag('Dinner'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Tasty hot Delicious grilled chicken with jollof rice and coleslaw',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 100), // Space for bottom bar
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_quantity > 0)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        color: const Color(0xFF386641),
                        child: Row(
                          children: [
                            Text(
                              '$_quantity item${_quantity > 1 ? 's' : ''} on tray',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '₦${_totalPrice.toInt()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(width: 16),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => const CheckoutScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: const Color(0xFF386641),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text('Checkout'),
                            ),
                          ],
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: BottomNavigationBar(
                        currentIndex: _selectedTab,
                        onTap: (i) => setState(() => _selectedTab = i),
                        selectedItemColor: const Color(0xFF386641),
                        unselectedItemColor: Colors.grey,
                        showUnselectedLabels: true,
                        type: BottomNavigationBarType.fixed,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.explore),
                            label: 'Explore',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.shopping_cart_outlined),
                            label: 'Order',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.headset_mic_outlined),
                            label: 'Support',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.more_horiz),
                            label: 'More',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F5E9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF386641),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
} 