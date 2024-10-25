
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:restaurante_ulises/modules/restaurant/entities/restaurant.dart';

class CustomListRestaurants extends StatelessWidget {
  const CustomListRestaurants({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          restaurant.images[0],
          width: 80,
          height: 60,
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          children: [
            Text(restaurant.name),
            SizedBox(
                width: 200, height: 100, child: Text(restaurant.description)),
          ],
        ),
        const Spacer(),
        StarRating(
          rating: restaurant.rating / restaurant.count,
          color: Colors.red,
          borderColor: Colors.purple,
          starCount: 5,
          size: 12,
          filledIcon: Icons.favorite,
          halfFilledIcon: Icons.favorite_border,
          emptyIcon: Icons.favorite_outline,
        )
      ],
    );
  }
}
