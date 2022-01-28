/*
This app to show you how to use list.generate
and list<map>
with appologise With apologies to Mr clean code and miss UI
Ayman Shehata
 */
import 'package:gridtile/Shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:gridtile/product/product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //إنشاء قائمة بها 100 منتج
  final List<Map> _products = List.generate(
      100,
      (index) => {
            "id": index, //start from 0 , index + 1 to start from
            "name": "Product $index",
            "price": Random().nextInt(100),
            "details": "تفاصيل ومعلومات $index "
          }).toList();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('المنتجات'),
          actions: [
            const Icon(
              Icons.shopping_cart,
              //size: 24,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                shoppingItems.toString(),
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),

            //عدد العناصر = عدد عناصر الليست
            itemCount: _products.length,
            itemBuilder: (BuildContext ctx, index) {
              return GridTile(
                key: ValueKey(_products[index]['id']),
                child: GestureDetector(
                  onTap: () {
                    _productDetails(
                      context,
                      // call
                      _products[index]['name'],
                      _products[index]['price'].toString(),
                      'assets/images/product' +
                          _products[index]['id'].toString() +
                          '.jpg',
                      _products[index]['details'],
                    );
                  },
                  child: Image.asset(
                    'assets/images/product' +
                        _products[index]['id'].toString() +
                        '.jpg', //)Image.network('https://www.kindacode.com/wp-content/uploads/2021/12/phone.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                footer: GridTileBar(
                  backgroundColor: Colors.black54,
                  title: Text(
                    _products[index]['name'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "ج.م ${_products[index]['price'].toString()}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      // item counter
                      setState(() {
                        shoppingItems += 1;
                      });
                      //toast
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Colors.black,
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _products[index]['name'].toString() +
                                  ' أضيف للسلة بنجاح',
                              style: const TextStyle(
                                  fontSize: 18, fontFamily: 'Cairo'),
                            ),
                            const Icon(
                              Icons.check_circle_outlined,
                              color: Colors.green,
                              size: 24,
                            ),
                          ],
                        ),
                      ));
                    },
                    child: const Icon(Icons.add_shopping_cart),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

// send data to the Second Screen
void _productDetails(BuildContext context, String prodName, String proPrice,
    String img, String details) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductView(
          name: prodName,
          price: proPrice,
          img: img,
          details: details,
        ),
      ));
}
