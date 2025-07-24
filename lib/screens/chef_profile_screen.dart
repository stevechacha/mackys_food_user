import 'package:flutter/material.dart';
import 'meal_detail_screen.dart';
import '../widgets/meal_card.dart';
import '../widgets/kitchen_card.dart';

class ChefProfileScreen extends StatefulWidget {
  const ChefProfileScreen({Key? key}) : super(key: key);

  @override
  State<ChefProfileScreen> createState() => _ChefProfileScreenState();
}

class _ChefProfileScreenState extends State<ChefProfileScreen> {
  bool _showFullAbout = false;

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
        title: const Text("Chef's profile", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        children: [
          _buildChefCard(context),
          const SizedBox(height: 16),
          _buildChefDetails(),
          const SizedBox(height: 24),
          _buildAboutSection(),
          const SizedBox(height: 24),
          _buildMealsSection(),
          const SizedBox(height: 24),
          _buildKitchenSection(),
          const SizedBox(height: 24),
          _buildAmenitiesSection(),
          const SizedBox(height: 24),
          _buildReviewsSection(),
          const SizedBox(height: 24),
          _buildBottomActions(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildChefCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: GestureDetector(
        onTap: () => _showChefImageModal(context),
        child: Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.shade200)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: const NetworkImage('https://images.unsplash.com/photo-1581093450005-95a28f7d98c2'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Chef Amaka', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          _buildBadge(Icons.verified, 'Vetted', Colors.green.shade700),
                          const SizedBox(width: 8),
                          _buildBadge(Icons.verified_user, 'Certified', Colors.green.shade700, outlined: true),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(IconData icon, String text, Color color, {bool outlined = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : color.withOpacity(0.1),
        border: outlined ? Border.all(color: color) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildChefDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow(Icons.work_outline, '8 Years in cooking'),
          _buildInfoRow(Icons.location_on_outlined, 'Sapele Road, Benin City'),
          _buildInfoRow(Icons.school_outlined, 'God is Good Culinary School'),
          _buildInfoRow(Icons.home_work_outlined, 'Home service and event catering'),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey.shade600),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 15)),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    final about = 'Mathias is a professional chef with years of experience, rigorous training, and a commitment to hygiene and premium meal service. He specializes in crafting personalized, high-quality meals for busy consumers.';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Meet Amaka', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          Text(
            _showFullAbout ? about : about.substring(0, 90) + '... ',
            style: const TextStyle(color: Colors.black54, height: 1.5),
          ),
          GestureDetector(
            onTap: () => setState(() => _showFullAbout = !_showFullAbout),
            child: Text(_showFullAbout ? 'Show less' : 'Show more', style: const TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildMealsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Meals', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => MealCard(
                image: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38',
                title: index == 0 ? 'Grilled Chicken with Jollof Rice' : (index == 1 ? 'Chips dine' : 'Salad meal'),
                chefName: 'Chef Amaka',
                chefAvatar: 'https://randomuser.me/api/portraits/men/32.jpg',
                tag: index == 0 ? 'Low-fat' : (index == 1 ? 'Vegan' : 'Low-fat'),
                price: index == 1 ? '₦2,780' : (index == 2 ? '₦700' : '₦5,640'),
                oldPrice: index == 1 ? '₦3,280' : null,
                rating: '3.0',
                time: '30 min',
                isFavorite: index == 0,
                isAvailable: index != 2, // Third meal is out of stock
                isClosed: false,
                quantity: null,
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const MealDetailScreen())),
                onFavorite: () {},
                onNotify: () {},
                onAdd: null,
                onRemove: null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(right: 12),
      child: SizedBox(
        width: 160,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.network(
                'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38', // placeholder
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Grilled Chicken with Jollof Rice', style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      _buildTag('Breakfast'),
                      const SizedBox(width: 4),
                      _buildTag('Dinner'),
                      const SizedBox(width: 4),
                      const Icon(Icons.timer_outlined, size: 14, color: Colors.grey),
                      const Text('30 min', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text('₦5,640', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF386641))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(text, style: const TextStyle(fontSize: 11, color: Colors.black87)),
    );
  }

  Widget _buildKitchenSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Where your meals are made', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) => KitchenCard(
                image: index == 0
                    ? 'https://images.unsplash.com/photo-1556911220-bff31c812dba'
                    : 'https://images.unsplash.com/photo-1464306076886-debca5e8a6b0',
                chefAvatar: 'https://randomuser.me/api/portraits/men/32.jpg',
                chefName: 'Chef Amaka',
                kitchenType: 'Home kitchen',
                years: '8 Years in cooking',
                isFavorite: index == 0,
                onTap: () {
                  // For now, just show a dialog
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Kitchen Detail'),
                      content: const Text('Show kitchen detail view here.'),
                      actions: [TextButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Close'))],
                    ),
                  );
                },
                onFavorite: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenitiesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Amenities', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 8),
          _buildInfoRow(Icons.local_fire_department_outlined, 'Gas cooker'),
          _buildInfoRow(Icons.kitchen_outlined, 'Charcoal Stove/Wood-Fire Stove'),
          _buildInfoRow(Icons.microwave_outlined, 'Microwave & Oven'),
          _buildInfoRow(Icons.blender_outlined, 'Electric or Manual Blender'),
          _buildInfoRow(Icons.restaurant_menu_outlined, 'Cooking pot & Pans'),
        ],
      ),
    );
  }

  Widget _buildReviewsSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Chef Amaka's review", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 16),
          _buildReviewSummary(),
          const SizedBox(height: 16),
          _buildReviewItem(),
          const SizedBox(height: 16),
          _buildReviewItem(),
          const SizedBox(height: 24),
          Center(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF386641),
                side: const BorderSide(color: Color(0xFF386641)),
              ),
              child: const Text('View all reviews'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewSummary() {
    return Row(
      children: [
        Column(
          children: const [
            Text('4.5', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            Text('25 reviews', style: TextStyle(color: Colors.black54)),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            children: [
              _buildRatingBar('5', 0.8),
              _buildRatingBar('4', 0.6),
              _buildRatingBar('3', 0.2),
              _buildRatingBar('2', 0.1),
              _buildRatingBar('1', 0.05),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRatingBar(String label, double value) {
    return Row(
      children: [
        Text(label),
        const Icon(Icons.star, color: Colors.amber, size: 14),
        const SizedBox(width: 4),
        Expanded(
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.grey.shade300,
            color: const Color(0xFF386641),
          ),
        ),
      ],
    );
  }

  Widget _buildReviewItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d'), // Placeholder
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Jimoh Adesina', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: List.generate(5, (i) => Icon(i < 4 ? Icons.star : Icons.star_border, color: Colors.amber, size: 16)),
                ),
              ],
            ),
            const Spacer(),
            const Text('November 2024', style: TextStyle(color: Colors.black54, fontSize: 12)),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Responsible and responsive chef, I like the food, good cooked according to my taste, quick delivery',
          style: TextStyle(color: Colors.black54, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                foregroundColor: Colors.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Report chef'),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF386641),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Message chef', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  void _showChefImageModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://images.unsplash.com/photo-1581093450005-95a28f7d98c2',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text('Chef Amaka', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _BadgeModal(icon: Icons.verified, text: 'Vetted', color: Colors.green),
                  SizedBox(width: 8),
                  _BadgeModal(icon: Icons.verified_user, text: 'Certified', color: Colors.green, outlined: true),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _BadgeModal extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final bool outlined;
  const _BadgeModal({required this.icon, required this.text, required this.color, this.outlined = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: outlined ? Colors.transparent : color.withOpacity(0.1),
        border: outlined ? Border.all(color: color) : null,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 13)),
        ],
      ),
    );
  }
} 