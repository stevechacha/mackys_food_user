import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _tabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });
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
        title: const Text('Order', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          if (_tabIndex == 0)
            TextButton(
              onPressed: () {},
              child: const Text('Clear tray', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
            ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 3, color: Color(0xFF386641)),
                insets: EdgeInsets.symmetric(horizontal: 24),
              ),
              labelColor: const Color(0xFF386641),
              unselectedLabelColor: Colors.black54,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              tabs: const [
                Tab(text: 'My tray'),
                Tab(text: 'Ongoing'),
                Tab(text: 'Cancelled'),
                Tab(text: 'Completed'),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMyTray(),
          _buildOngoing(),
          _buildCancelled(),
          _buildCompleted(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildMyTray() {
    // Example: Empty state
    final trayEmpty = false;
    if (trayEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            const Text('No item on tray', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            const Text('You currently have no item on tray', style: TextStyle(color: Colors.black54)),
          ],
        ),
      );
    }
    // Example: Grouped by chef
    final trayData = [
      {
        'chef': 'Chef Amake',
        'avatar': null,
        'items': [
          {
            'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
            'name': 'Chips dine',
            'qty': 1,
            'price': '₦3,500',
          },
        ],
        'total': '₦3,500',
      },
      {
        'chef': 'Chef Adesina',
        'avatar': null,
        'items': [
          {
            'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
            'name': 'Grilled Chicken with Jollof Rice',
            'qty': 2,
            'price': '₦3,500',
          },
        ],
        'total': '₦3,500',
      },
    ];
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: trayData.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (context, i) {
        final chef = trayData[i];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (chef['avatar'] != null && chef['avatar'] is String)
                      CircleAvatar(radius: 16, backgroundImage: NetworkImage(chef['avatar'] as String))
                    else
                      CircleAvatar(radius: 16, backgroundColor: Colors.grey.shade200, child: Icon(Icons.person, color: Colors.grey.shade400)),
                    const SizedBox(width: 8),
                    Text(chef['chef'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    Text('Pack 1', style: TextStyle(color: Colors.grey.shade600)),
                  ],
                ),
                const SizedBox(height: 8),
                ...List.generate((chef['items'] as List).length, (j) {
                  final item = (chef['items'] as List)[j];
                  return _TrayMealCard(
                    image: item['image'] as String,
                    name: item['name'] as String,
                    qty: item['qty'] as int,
                    price: item['price'] as String,
                    onAdd: () {},
                    onRemove: () {},
                  );
                }),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text('${(chef['items'] as List).length} items', style: const TextStyle(color: Colors.black54)),
                    const SizedBox(width: 8),
                    Text(chef['total'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Add to pack', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF386641),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOngoing() {
    final ongoingOrders = [
      {
        'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
        'name': 'Chips dine',
        'qty': 1,
        'price': '₦3,500',
      },
      {
        'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
        'name': 'Grilled Chicken with Jollof Rice',
        'qty': 2,
        'price': '₦3,500',
      },
    ];
    if (ongoingOrders.isEmpty) {
      return _buildEmptyState('No ongoing orders', 'You have no ongoing orders');
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: ongoingOrders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, i) {
        final order = ongoingOrders[i];
        return _OrderCard(
          image: order['image'] as String,
          name: order['name'] as String,
          qty: order['qty'] as int,
          price: order['price'] as String,
          action: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xFF386641)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text('Track order', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
          ),
        );
      },
    );
  }

  Widget _buildCancelled() {
    final cancelledOrders = [
      {
        'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
        'name': 'Chips dine',
        'qty': 1,
        'price': '₦3,500',
        'badge': 'Cancelled',
      },
      {
        'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
        'name': 'Grilled Chicken with Jollof Rice',
        'qty': 2,
        'price': '₦3,500',
        'badge': 'Rejected',
      },
    ];
    if (cancelledOrders.isEmpty) {
      return _buildEmptyState('No cancelled orders', 'You have no cancelled orders');
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: cancelledOrders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, i) {
        final order = cancelledOrders[i];
        return _OrderCard(
          image: order['image'] as String,
          name: order['name'] as String,
          qty: order['qty'] as int,
          price: order['price'] as String,
          badge: order['badge'] as String?,
          action: order['badge'] == 'Cancelled'
              ? OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF386641)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Reorder', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
                )
              : null,
        );
      },
    );
  }

  Widget _buildCompleted() {
    final completedOrders = [
      {
        'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
        'name': 'Grilled Chicken with Jollof Rice',
        'qty': 2,
        'price': '₦3,500',
        'feedback': true,
        'rated': false,
      },
      {
        'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
        'name': 'Chips dine',
        'qty': 1,
        'price': '₦3,500',
        'feedback': false,
        'rated': true,
        'stars': 4,
      },
    ];
    if (completedOrders.isEmpty) {
      return _buildEmptyState('No completed orders', 'You have no completed orders');
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: completedOrders.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (context, i) {
        final order = completedOrders[i];
        return _OrderCard(
          image: order['image'] as String,
          name: order['name'] as String,
          qty: order['qty'] as int,
          price: order['price'] as String,
          action: order['feedback'] == true
              ? OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF386641)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('Leave feedback', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
                )
              : order['rated'] == true
                  ? Row(
                      children: List.generate((order['stars'] as int? ?? 5), (star) => Icon(Icons.star, color: Colors.amber, size: 18)),
                    )
                  : null,
        );
      },
    );
  }

  Widget _buildEmptyState(String title, String subtitle) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_bag_outlined, size: 64, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Text(subtitle, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: 1,
      selectedItemColor: const Color(0xFF386641),
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.explore_outlined), label: 'Explore'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Order'),
        BottomNavigationBarItem(icon: Icon(Icons.support_agent_outlined), label: 'Support'),
        BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
      ],
      onTap: (i) {},
    );
  }
}

class _TrayMealCard extends StatelessWidget {
  final String image;
  final String name;
  final int qty;
  final String price;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  const _TrayMealCard({required this.image, required this.name, required this.qty, required this.price, required this.onAdd, required this.onRemove});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(image, width: 56, height: 56, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w500))),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline, color: Color(0xFF386641)),
                onPressed: onRemove,
              ),
              Container(
                width: 32,
                alignment: Alignment.center,
                child: Text('$qty', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Color(0xFF386641)),
                onPressed: onAdd,
              ),
            ],
          ),
          const SizedBox(width: 8),
          Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  final String image;
  final String name;
  final int qty;
  final String price;
  final String? badge;
  final Widget? action;
  const _OrderCard({required this.image, required this.name, required this.qty, required this.price, this.badge, this.action});
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(image, width: 56, height: 56, fit: BoxFit.cover),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text('$qty items', style: const TextStyle(color: Colors.black54, fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
                  if (badge != null) ...[
                    const SizedBox(height: 4),
                    _OrderBadge(badge: badge!),
                  ],
                  if (action != null) ...[
                    const SizedBox(height: 8),
                    action!,
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderBadge extends StatelessWidget {
  final String badge;
  const _OrderBadge({required this.badge});
  @override
  Widget build(BuildContext context) {
    Color color = Colors.red.shade100;
    Color textColor = Colors.red.shade700;
    if (badge == 'Rejected') {
      color = Colors.orange.shade100;
      textColor = Colors.orange.shade700;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(badge, style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 12)),
    );
  }
} 