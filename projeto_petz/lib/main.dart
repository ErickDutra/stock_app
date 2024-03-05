import 'package:flutter/material.dart';
import 'package:projeto_petz/components/products_user.dart';

main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(25, 135, 84, 1),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            )),
            Container(
              child: Text(
                'Stock',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromRGBO(25, 135, 84, 1)),
              ),
            ),
            Container(
                child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.menu),
            ))
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: double.infinity, child: Card(child: Text('lojas'))),
          ProductsUser(),
        ],
      ),
    );
  }
}
