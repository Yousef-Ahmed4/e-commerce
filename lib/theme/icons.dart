import 'package:flutter/material.dart';
import 'package:yousef/models/models.dart';
import 'package:yousef/screens/cart.dart';

iconbag(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.shopping_bag),
    color: Colors.black,
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return CartScreen();
      }));
    },
  );
}

