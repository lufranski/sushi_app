import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/components/food_tile.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/pages/sushi_detail.dart';
import 'package:sushi_app/themes/color.dart';
import 'package:sushi_app/constants/constants.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Menu
  List sushi = [
    Food(
      name: 'Salmon Nigiri',
      price: '21.00',
      imgPath: 'lib/assets/img/nigiri_salmon.png',
      rating: '4.9',
      description: descriptions.salmon,
    ),
    Food(
      name: 'Tuna Nigiri',
      price: '23.00',
      imgPath: 'lib/assets/img/nigiri_tuna.png',
      rating: '4.5',
      description: descriptions.tuna,
    ),
  ];

  // navigation to food item details page
  void navigateToSushiDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SushiDetail(
          food: sushi[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // promo banner
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // promo message
                    Text(
                      'Get 32% Promo!',
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // redeem button
                    Button(
                      text: 'Redeem',
                      onTap: () {},
                    )
                  ],
                ),
                // image
                Image.asset(
                  'lib/assets/img/nigiri_salmon.png',
                  height: 90,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Search here ...',
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Food Menu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sushi.length,
              itemBuilder: (context, index) => FoodTile(
                food: sushi[index],
                onTap: () {
                  navigateToSushiDetails(index);
                },
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          // popular food
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'lib/assets/img/gunkan.png',
                      height: 60,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    // name & price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          'Gunkan',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // price
                        Text(
                          '\$ 21.00',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // heart
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
