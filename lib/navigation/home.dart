import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restaurante_ulises/modules/restaurant/entities/restaurant.dart';
import 'package:restaurante_ulises/modules/restaurant/widgets/custom_list_restaurant.dart';

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
          db.collection("restaurants").snapshots().listen((event) {
            restaurants.clear();
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
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
            padding: const EdgeInsets.all(16),
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return CustomListRestaurants(restaurant: restaurant);
            }));
  }
}
