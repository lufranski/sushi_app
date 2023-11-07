import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/themes/color.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart(Food food, BuildContext context) {
    // access the shop
    final shop = context.read<Shop>();
    // remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              appBar: AppBar(
                title: const Text('My Cart'),
                backgroundColor: primaryColor,
              ),
              body: Column(
                children: [
                  // customer cart
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          // get food from cart
                          final Food food = value.cart[index];
                          // get food name
                          final String foodName = food.name;
                          // get food price
                          final String foodPrice = food.price;
                          // return list tile
                          return Container(
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 20),
                            child: ListTile(
                              title: Text(
                                foodName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              subtitle: Text(
                                foodPrice,
                                style: TextStyle(color: Colors.grey[200]),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () => removeFromCart(food, context),
                              ),
                            ),
                          );
                        }),
                  ),
                  // pay btn
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Button(
                      text: 'PAY NOW',
                      onTap: () {},
                      isPrimary: true,
                    ),
                  )
                ],
              ),
            ));
  }
}
