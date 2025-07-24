import 'package:flutter/material.dart';

class KitchenCard extends StatelessWidget {
  final String image;
  final String chefAvatar;
  final String chefName;
  final String kitchenType;
  final String years;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;

  const KitchenCard({
    Key? key,
    required this.image,
    required this.chefAvatar,
    required this.chefName,
    required this.kitchenType,
    required this.years,
    this.isFavorite = false,
    this.onTap,
    this.onFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.network(
                    image,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 140,
                      width: double.infinity,
                      color: Colors.grey.shade200,
                      child: const Icon(Icons.kitchen, size: 48, color: Colors.grey),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: onFavorite,
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red.shade400 : Colors.grey.shade400,
                      size: 24,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(chefAvatar),
                    radius: 20,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chefName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.home, size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Text(kitchenType, style: const TextStyle(fontSize: 13, color: Colors.black54)),
                      const SizedBox(width: 12),
                      Icon(Icons.timer_outlined, size: 16, color: Colors.grey.shade600),
                      const SizedBox(width: 4),
                      Text(years, style: const TextStyle(fontSize: 13, color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 