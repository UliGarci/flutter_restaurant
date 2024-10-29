import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../entities/restaurant.dart';
import 'custom_show_restaurant.dart';

class CustomListRestaurants extends StatelessWidget {
  const CustomListRestaurants({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CustomShowRestaurant(restaurant: restaurant),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(restaurant.images[0],width: 60,),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    restaurant.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StarRating(
                  rating: restaurant.rating / max(restaurant.count, 1),
                  color: Colors.red,
                  borderColor: Colors.purple,
                  starCount: 5,
                  size: 18,
                  filledIcon: Icons.favorite,
                  halfFilledIcon: Icons.favorite_border,
                  emptyIcon: Icons.favorite_outline,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
