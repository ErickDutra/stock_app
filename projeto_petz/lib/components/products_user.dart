import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_petz/components/products_list.dart';
import '../models/products.dart';
import 'product_form.dart';

class ProductsUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductsUserState();
  }
}

class _ProductsUserState extends State<ProductsUser> {
  final _products = [
    Product(
      id: 't1',
      title: 'Farinha lactea',
      amount: 30,
      date: DateTime.now(),
    ),
    Product(
      id: 't1',
      title: 'Refrigerante coca-cola',
      amount: 30,
      date: DateTime.now(),
    )
  ];

  _addProduct(String title, int amount, DateTime date) {
    final newProduct =Product(
        id: Random().nextDouble().toString(),
        title: title,
        amount: amount,
        date: date);
        setState(() {
          _products.add(newProduct);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ProductList(_products), ProductForm(_addProduct)],
    );
  }
}
