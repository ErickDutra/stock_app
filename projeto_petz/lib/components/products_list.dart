import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/products.dart';

class ProductList extends StatefulWidget {
  final List<Product> products;

  ProductList(this.products);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  DateTime dataToday = DateTime.now();

  int calculateDaysDifference(DateTime dataToday, DateTime dataRegistered) {
    Duration diferenca = dataRegistered.difference(dataToday);
    int diferencaDias = diferenca.inDays;
    return diferencaDias;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (ctx, index) {
          final pr = widget.products[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    pr.title.toString(),
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
                      pr.amount.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Validated:',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM y').format(pr.date),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color:
                                calculateDaysDifference(dataToday, pr.date) < 30
                                    ? const Color.fromARGB(255, 226, 110, 102)
                                    : Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
