import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/products.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  ProductList(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
            children: products.map((tr) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tr.title.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          tr.amount.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          );
  }
}
