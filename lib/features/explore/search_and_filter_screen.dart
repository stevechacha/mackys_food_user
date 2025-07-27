import 'package:flutter/material.dart';
import '../../widgets/meal_card.dart';
import '../../widgets/kitchen_card.dart';

class SearchAndFilterScreen extends StatefulWidget {
  const SearchAndFilterScreen({Key? key}) : super(key: key);

  @override
  State<SearchAndFilterScreen> createState() => _SearchAndFilterScreenState();
}

class _SearchAndFilterScreenState extends State<SearchAndFilterScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Filter state
  final _mealAvailability = <String>{};
  String _preparationType = 'Instantly';
  final _cuisine = <String>{};
  final _dietary = <String>{};
  double _minPrice = 9000;
  double _maxPrice = 39000;

  // Sample data for results
  final _meals = [
    {
      'image': 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'title': 'Grilled Chicken with Jollof Rice',
      'chef': 'Chef Mathias',
      'chefAvatar': 'https://randomuser.me/api/portraits/men/32.jpg',
      'tag': 'Low-fat',
      'price': '₦5,640',
      'rating': '3.0',
      'time': '30 min',
      'isFavorite': true,
      'isAvailable': true,
      'isClosed': false,
    },
    {
      'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      'title': 'Chips dine',
      'chef': 'Chef Mathias',
      'chefAvatar': 'https://randomuser.me/api/portraits/men/33.jpg',
      'tag': 'Vegan',
      'price': '₦2,780',
      'oldPrice': '₦3,280',
      'rating': '3.0',
      'time': '30 min',
      'isFavorite': false,
      'isAvailable': true,
      'isClosed': false,
    },
    {
      'image': 'https://images.unsplash.com/photo-1464306076886-debca5e8a6b0',
      'title': 'Salad meal',
      'chef': 'Chef Mathias',
      'chefAvatar': 'https://randomuser.me/api/portraits/men/34.jpg',
      'tag': 'Low-fat',
      'price': '₦700',
      'rating': '3.0',
      'time': '30 min',
      'isFavorite': false,
      'isAvailable': false,
      'isClosed': false,
    },
  ];
  final _kitchens = [
    {
      'image': 'https://images.unsplash.com/photo-1556911220-bff31c812dba',
      'chefAvatar': 'https://randomuser.me/api/portraits/men/32.jpg',
      'chefName': 'Chef Amaka',
      'kitchenType': 'Home kitchen',
      'years': '8 Years in cooking',
      'isFavorite': true,
    },
    {
      'image': 'https://images.unsplash.com/photo-1464306076886-debca5e8a6b0',
      'chefAvatar': 'https://randomuser.me/api/portraits/men/33.jpg',
      'chefName': 'Chef Stephen',
      'kitchenType': 'Home kitchen',
      'years': '8 Years in cooking',
      'isFavorite': false,
    },
  ];

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
        title: const Text('Search and filter', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        children: [
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildFilterSection(),
          const SizedBox(height: 16),
          _buildSelectedFilters(),
          const SizedBox(height: 16),
          _buildResults(),
        ],
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search for meals, chefs... ',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
            ),
          ),
        ),
        TextButton(
          onPressed: () => _searchController.clear(),
          child: const Text('Cancel'),
        ),
      ],
    );
  }

  Widget _buildFilterSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Checkbox(
              value: true,
              onChanged: (_) {},
              activeColor: const Color(0xFF386641),
            ),
            const Text('Include filter to your search', style: TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 8),
        _buildFilterChips('Meal availability', ['Breakfast', 'Lunch', 'Dinner', 'Dessert', 'Snacks', 'Drinks'], _mealAvailability, isRadio: false),
        const SizedBox(height: 8),
        _buildFilterChips('Preparation type', ['Instantly', 'Pre-order'], {_preparationType}, isRadio: true, onRadioChanged: (v) => setState(() => _preparationType = v)),
        const SizedBox(height: 8),
        _buildFilterChips('Cuisine', ['Nigeria', 'Continental', 'Inter-continental', 'Healthy'], _cuisine, isRadio: false),
        const SizedBox(height: 8),
        _buildFilterChips('Dietary', ['Keto', 'Vegan', 'Low-fat', 'High-protein'], _dietary, isRadio: false),
        const SizedBox(height: 16),
        const Text('Meal price', style: TextStyle(fontWeight: FontWeight.w500)),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: _minPrice,
                min: 1000,
                max: 50000,
                divisions: 10,
                label: '₦${_minPrice.toInt()}',
                onChanged: (v) => setState(() => _minPrice = v),
                activeColor: const Color(0xFF386641),
                inactiveColor: Colors.grey.shade300,
              ),
            ),
            Expanded(
              child: Slider(
                value: _maxPrice,
                min: 1000,
                max: 50000,
                divisions: 10,
                label: '₦${_maxPrice.toInt()}',
                onChanged: (v) => setState(() => _maxPrice = v),
                activeColor: const Color(0xFF386641),
                inactiveColor: Colors.grey.shade300,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Minimum\n₦${_minPrice.toInt()}', style: const TextStyle(fontSize: 13)),
            Text('Maximum\n₦${_maxPrice.toInt()}', style: const TextStyle(fontSize: 13)),
          ],
        ),
      ],
    );
  }

  Widget _buildFilterChips(String label, List<String> options, Set<String> selected, {bool isRadio = false, ValueChanged<String>? onRadioChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 4),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: options.map((option) {
            final isSelected = selected.contains(option);
            return isRadio
                ? ChoiceChip(
                    label: Text(option),
                    selected: isSelected,
                    selectedColor: const Color(0xFFdbead6),
                    labelStyle: TextStyle(color: isSelected ? const Color(0xFF386641) : Colors.black54, fontWeight: FontWeight.w600),
                    onSelected: (_) => onRadioChanged?.call(option),
                  )
                : FilterChip(
                    label: Text(option),
                    selected: isSelected,
                    selectedColor: const Color(0xFFdbead6),
                    labelStyle: TextStyle(color: isSelected ? const Color(0xFF386641) : Colors.black54, fontWeight: FontWeight.w600),
                    onSelected: (v) => setState(() => isSelected ? selected.remove(option) : selected.add(option)),
                  );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSelectedFilters() {
    final pills = <String>[];
    pills.addAll(_mealAvailability);
    pills.add(_preparationType);
    pills.addAll(_cuisine);
    pills.addAll(_dietary);
    if (pills.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 8,
      children: pills.map((pill) => Chip(
        label: Text(pill),
        backgroundColor: const Color(0xFFdbead6),
        labelStyle: const TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold),
        onDeleted: () {
          setState(() {
            _mealAvailability.remove(pill);
            _cuisine.remove(pill);
            _dietary.remove(pill);
            if (_preparationType == pill) _preparationType = 'Instantly';
          });
        },
      )).toList(),
    );
  }

  Widget _buildResults() {
    // For demo, show both meals and kitchens
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Search results (318321 result found)', style: TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        ..._meals.map((meal) => MealCard(
              image: meal['image'] as String,
              title: meal['title'] as String,
              chefName: meal['chef'] as String,
              chefAvatar: meal['chefAvatar'] as String,
              tag: meal['tag'] as String,
              price: meal['price'] as String,
              oldPrice: meal['oldPrice'] as String?,
              rating: meal['rating'] as String,
              time: meal['time'] as String,
              isFavorite: meal['isFavorite'] as bool,
              isAvailable: meal['isAvailable'] as bool,
              isClosed: meal['isClosed'] as bool,
              quantity: null,
              onTap: () {},
              onFavorite: () {},
              onNotify: () {},
              onAdd: null,
              onRemove: null,
            )),
        ..._kitchens.map((kitchen) => KitchenCard(
              image: kitchen['image'] as String,
              chefAvatar: kitchen['chefAvatar'] as String,
              chefName: kitchen['chefName'] as String,
              kitchenType: kitchen['kitchenType'] as String,
              years: kitchen['years'] as String,
              isFavorite: kitchen['isFavorite'] as bool,
              onTap: () {},
              onFavorite: () {},
            )),
      ],
    );
  }

  Widget _buildBottomBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  _mealAvailability.clear();
                  _cuisine.clear();
                  _dietary.clear();
                  _preparationType = 'Instantly';
                  _minPrice = 1000;
                  _maxPrice = 50000;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFF386641)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Clear', style: TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 48,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF386641),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Show result', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 