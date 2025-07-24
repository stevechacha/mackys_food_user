import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final String image;
  final String title;
  final String chefName;
  final String chefAvatar;
  final String tag;
  final String price;
  final String? oldPrice;
  final String rating;
  final String time;
  final bool isFavorite;
  final bool isAvailable;
  final bool isClosed;
  final int? quantity;
  final VoidCallback? onTap;
  final VoidCallback? onFavorite;
  final VoidCallback? onNotify;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;

  const MealCard({
    Key? key,
    required this.image,
    required this.title,
    required this.chefName,
    required this.chefAvatar,
    required this.tag,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.time,
    this.isFavorite = false,
    this.isAvailable = true,
    this.isClosed = false,
    this.quantity,
    this.onTap,
    this.onFavorite,
    this.onNotify,
    this.onAdd,
    this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final disabled = isClosed || !isAvailable;
    return GestureDetector(
      onTap: disabled ? null : onTap,
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
                    color: disabled ? Colors.grey.withOpacity(0.5) : null,
                    colorBlendMode: disabled ? BlendMode.saturation : null,
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
                    child: Text(tag, style: const TextStyle(color: Color(0xFF386641), fontWeight: FontWeight.bold)),
                  ),
                ),
                if (isClosed)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(Icons.lock, color: Colors.grey.shade700, size: 24),
                  )
                else
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: disabled ? null : onFavorite,
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red.shade400 : Colors.grey.shade400,
                        size: 24,
                      ),
                    ),
                  ),
              ],
            ),
            ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(chefAvatar)),
              title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Prep by $chefName • $time'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(rating, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                children: [
                  Text(price, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF386641))),
                  if (oldPrice != null) ...[
                    const SizedBox(width: 8),
                    Text(oldPrice!, style: const TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey)),
                  ],
                  const Spacer(),
                  if (isClosed)
                    const SizedBox()
                  else if (!isAvailable)
                    OutlinedButton(
                      onPressed: onNotify,
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF386641)),
                        foregroundColor: const Color(0xFF386641),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Notify me when available'),
                    )
                  else if (quantity != null)
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline, color: Color(0xFF386641)),
                          onPressed: disabled || quantity == 0 ? null : onRemove,
                        ),
                        Container(
                          width: 32,
                          alignment: Alignment.center,
                          child: Text('$quantity', style: const TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline, color: Color(0xFF386641)),
                          onPressed: disabled ? null : onAdd,
                        ),
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