import 'package:flutter/material.dart';
import 'dart:async';
import 'order_details_screen.dart';
import 'cancel_order_screen.dart';

enum OrderStatus { confirmed, preparing, onTheWay }

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({Key? key}) : super(key: key);

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> with TickerProviderStateMixin {
  OrderStatus _status = OrderStatus.confirmed;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    // Simulate order progression
    Timer(const Duration(seconds: 4), () {
      if (mounted) setState(() { _status = OrderStatus.preparing; _controller.forward(from: 0); });
    });
    Timer(const Duration(seconds: 8), () {
      if (mounted) setState(() { _status = OrderStatus.onTheWay; _controller.forward(from: 0); });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        title: const Text('Order status', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const OrderDetailsScreen()),
              );
            },
            child: const Text('Order details', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
              child: _buildStatusCard(key: ValueKey(_status)),
            ),
            const SizedBox(height: 32),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, anim) => SlideTransition(
                position: Tween<Offset>(begin: const Offset(0.2, 0), end: Offset.zero).animate(anim),
                child: FadeTransition(opacity: anim, child: child),
              ),
              child: _buildProgressIndicator(key: ValueKey(_status)),
            ),
            const SizedBox(height: 32),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, anim) => FadeTransition(opacity: anim, child: child),
              child: _buildContextualDetails(key: ValueKey(_status)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard({Key? key}) {
    IconData icon;
    String title;
    String message;
    Color cardColor = const Color(0xFFE8F5E9);
    Widget? customIcon;

    switch (_status) {
      case OrderStatus.confirmed:
        icon = Icons.receipt_long_outlined;
        title = 'Order confirmed';
        message = 'Your order has been received and is now in the works!';
        customIcon = Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFD6F5D6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.receipt_long_outlined, size: 32, color: Color(0xFF386641)),
        );
        break;
      case OrderStatus.preparing:
        icon = Icons.soup_kitchen_outlined;
        title = 'Meal in preparation';
        message = 'Our chefs are carefully preparing your meal. It\'ll be ready soon!';
        customIcon = Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFD6F5D6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.soup_kitchen_outlined, size: 32, color: Color(0xFF386641)),
        );
        break;
      case OrderStatus.onTheWay:
        icon = Icons.delivery_dining_outlined;
        title = 'Your meal is on its way';
        message = 'Your meal pilot is heading to your location—stay tuned!';
        customIcon = Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: const Color(0xFFD6F5D6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.delivery_dining_outlined, size: 32, color: Color(0xFF386641)),
        );
        break;
    }

    return Card(
      key: key,
      color: cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
        child: Column(
          children: [
            customIcon,
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black87, fontSize: 15)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('5:00', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF386641), fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressIndicator({Key? key}) {
    int currentStep;
    switch (_status) {
      case OrderStatus.confirmed:
        currentStep = 1;
        break;
      case OrderStatus.preparing:
        currentStep = 2;
        break;
      case OrderStatus.onTheWay:
        currentStep = 3;
        break;
    }

    return Row(
      key: key,
      children: [
        _buildStep(1, currentStep),
        _buildConnector(1, currentStep),
        _buildStep(2, currentStep),
        _buildConnector(2, currentStep),
        _buildStep(3, currentStep),
      ],
    );
  }

  Widget _buildStep(int step, int currentStep) {
    bool isActive = step <= currentStep;
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF386641) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isActive ? const Color(0xFF386641) : Colors.grey.shade300, width: 2),
      ),
      child: Center(
        child: Text('$step', style: TextStyle(color: isActive ? Colors.white : Colors.black54, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildConnector(int step, int currentStep) {
    return Expanded(
      child: Container(
        height: 2,
        color: step < currentStep ? const Color(0xFF386641) : Colors.grey.shade300,
      ),
    );
  }

  Widget _buildContextualDetails({Key? key}) {
    switch (_status) {
      case OrderStatus.confirmed:
        return Container(key: key, child: _buildCancellationPolicy());
      case OrderStatus.preparing:
        return Container(key: key, child: _buildSupportContact());
      case OrderStatus.onTheWay:
        return Container(key: key, child: _buildPilotDetails());
    }
  }

  Widget _buildCancellationPolicy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Cancellation policy', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        const Text(
          'You can only cancel your order during the Order Confirmation stage. Once preparation begins, cancellation will require full payment.',
          style: TextStyle(color: Colors.black54, fontSize: 15),
        ),
        const SizedBox(height: 12),
        TextButton.icon(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CancelOrderScreen()),
            );
          },
          icon: const Icon(Icons.cancel_outlined, color: Colors.red),
          label: const Text('Cancel meal', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildSupportContact() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'By clicking "Contact Macky\'s food support" you agree to Macky\'s food Terms of service and Cancellation policy.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black54, fontSize: 14),
            ),
            const SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.support_agent, color: Color(0xFF386641)),
              label: const Text('Contact Macky\'s food support', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPilotDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Meal pilot details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 16),
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d'),
          ),
          title: const Text('Pilot Adesina', style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: const Text('08100000000'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(Icons.star, color: Colors.amber, size: 16),
              SizedBox(width: 2),
              Text('3.0', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const Divider(),
        const ListTile(
          leading: Icon(Icons.directions_bike, color: Color(0xFF386641)),
          title: Text('Bike'),
        ),
        const ListTile(
          leading: Icon(Icons.location_on_outlined, color: Color(0xFF386641)),
          title: Text('Sapele Road, Benin City'),
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.report_problem_outlined, color: Colors.red),
          label: const Text('Report pilot', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 24),
        _buildSupportContact(),
      ],
    );
  }
} 