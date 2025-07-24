import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int _selectedTab = 0; // 0: Support, 1: Order, 2: Promotion

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Notification', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          _buildTabBar(),
          const SizedBox(height: 8),
          Expanded(child: _buildTabContent()),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    final tabs = ['Support', 'Order', 'Promotion'];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: List.generate(tabs.length, (i) {
          final selected = _selectedTab == i;
          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => _selectedTab = i),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: selected ? const Color(0xFFdbead6) : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    tabs[i],
                    style: TextStyle(
                      color: selected ? const Color(0xFF386641) : Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTabContent() {
    if (_selectedTab == 0) return _buildSupportNotifications();
    if (_selectedTab == 1) return _buildOrderNotifications();
    return _buildPromotionNotifications();
  }

  Widget _buildSupportNotifications() {
    // Example: Empty state
    return _buildEmptyState();
  }

  Widget _buildOrderNotifications() {
    final notifications = [
      NotificationData(
        icon: Icons.delivery_dining_outlined,
        iconColor: Colors.green,
        title: 'Out for Delivery',
        message: 'Your meal is on the way! Get ready to dig in—see you soon',
        date: '12 Mar 2025',
        status: 'Completed',
        statusColor: Colors.green,
      ),
      NotificationData(
        icon: Icons.soup_kitchen_outlined,
        iconColor: Colors.orange,
        title: 'Meal in Preparation',
        message: 'Your meal is being freshly prepared, it\'ll be ready to go soon',
        date: '12 Mar 2025',
        status: 'Ongoing',
        statusColor: Colors.orange,
      ),
      NotificationData(
        icon: Icons.check_circle_outline,
        iconColor: Colors.green,
        title: 'Order Confirmed',
        message: 'We\'ve received your order! Our chefs are getting started right away',
        date: '12 Mar 2025',
        status: 'Cancelled',
        statusColor: Colors.red,
      ),
    ];
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: notifications.length,
      itemBuilder: (context, i) => NotificationCard(data: notifications[i]),
    );
  }

  Widget _buildPromotionNotifications() {
    final notifications = [
      NotificationData(
        icon: Icons.card_giftcard,
        iconColor: Colors.orange,
        title: 'Welcome Message',
        message: 'Welcome to Macky\'s Food! Your next meal is just a tap away',
        date: '12 Mar 2025',
      ),
      NotificationData(
        icon: Icons.discount,
        iconColor: Colors.orange,
        title: 'First Order Discount',
        message: 'Your first order comes with a special treat! Don\'t miss out',
        date: '12 Mar 2025',
      ),
    ];
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: notifications.length,
      itemBuilder: (context, i) => NotificationCard(data: notifications[i]),
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

class NotificationData {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String message;
  final String date;
  final String? status;
  final Color? statusColor;
  NotificationData({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.message,
    required this.date,
    this.status,
    this.statusColor,
  });
}

class NotificationCard extends StatelessWidget {
  final NotificationData data;
  const NotificationCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: data.iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(data.icon, color: data.iconColor, size: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(data.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      if (data.status != null && data.statusColor != null)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: data.statusColor!.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(data.status!, style: TextStyle(color: data.statusColor, fontWeight: FontWeight.bold, fontSize: 12)),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(data.message, style: const TextStyle(color: Colors.black87)),
                  const SizedBox(height: 8),
                  Text(data.date, style: const TextStyle(color: Colors.black54, fontSize: 12)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 