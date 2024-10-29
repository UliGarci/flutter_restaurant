import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import '../entities/restaurant.dart';

class CustomShowRestaurant extends StatelessWidget {
  const CustomShowRestaurant({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 200.0),
                items: restaurant.images.map((imgURL) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(image: NetworkImage(imgURL))
                          ),
                          );
                    },
                  );
                }).toList(),
              ),
              // Image.network(restaurant.images[0],height: 80,width: 80,),
              const SizedBox(
                height: 16,
              ),
              StarRating(
                rating: restaurant.rating / restaurant.count,
                color: Colors.red,
                borderColor: Colors.black,
                starCount: 5,
                size: 14,
                filledIcon: Icons.favorite,
                halfFilledIcon: Icons.favorite_border,
                emptyIcon: Icons.favorite_outline,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(restaurant.description)
            ],
          ),
        ),
      ),
    );
  }
}
