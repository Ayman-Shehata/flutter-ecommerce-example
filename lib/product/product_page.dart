/*
This app to show you how to use list.generate
and list<map>
with appologise With apologies to Mr clean code and miss UI
Ayman shehata
 */

import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final String? name;
  final String? price;
  final String? img;
  final String? details;
  // constructor
  const ProductView({Key? key, this.name, this.price, this.img, this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              img!,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
              child: Text(
            details ?? 'There is no details',
            style: const TextStyle(fontSize: 18),
          )),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              name ?? 'No data',
              style: const TextStyle(fontSize: 22),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(6),
            child: ElevatedButton.icon(
              onPressed: () {
                // ignore: avoid_print
                print("$name add to cart with price: $price L.E ");
              },
              icon: const Icon(Icons.shopping_cart_outlined),
              label: Text(
                "$price ج.م",
                style: const TextStyle(fontSize: 28, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
