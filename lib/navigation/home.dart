import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:restaurante_ulises/modules/restaurant/entities/restaurant.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final db = FirebaseFirestore.instance;
  List<Restaurant> restaurants = [];
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    (() async => {
          await db.collection("restaurants").get().then((event) {
            for (var doc in event.docs) {
              final restaurant = Restaurant(
                  doc.data()['name'],
                  doc.data()['description'],
                  List<String>.from(doc.data()['images']),
                  doc.data()['rating'],
                  doc.data()['count']);
              restaurants.add(restaurant);
              //print("${doc.id} => ${doc.data()}")
            }
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          })
        })();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Inicio'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                Image.network(
                  restaurants[0].images[0],
                  width: 80,
                  height: 60,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    Text(restaurants[0].name),
                    SizedBox(
                        width: 200,
                        height: 100,
                        child: Text(restaurants[0].description)),
                  ],
                ),
                const Spacer(),
                StarRating(
                  rating: restaurants[0].rating/restaurants[0].count,
                  color: Colors.red,
                  borderColor: Colors.purple,
                  starCount: 5,
                  size: 12,
                  filledIcon: Icons.favorite,
                  halfFilledIcon: Icons.favorite_border,
                  emptyIcon: Icons.favorite_outline,
                )
              ],
            )
          ],
        ));
  }
}
