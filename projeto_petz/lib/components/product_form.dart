import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductForm extends StatefulWidget {
  final void Function(String, int, DateTime) onSubmit;

  ProductForm(this.onSubmit);
  @override
  State<StatefulWidget> createState() {
    return ProductFormState();
  }
}

class ProductFormState extends State<ProductForm> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  _submitForm() {
    final title = titleController.text;
    final amount = int.tryParse(amountController.text) ?? 0;
    final date = selectedDate;

    if (title.isEmpty || amount <= 0) {
      return;
    }

    widget.onSubmit(title, amount, date);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              onChanged: (newValue) {},
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              onChanged: (newValue) {},
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text(
                      "${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year} "),
                  onPressed: () async {
                    final DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2005),
                        lastDate: DateTime(2030));
                    if (dateTime != null) {
                      setState(() {
                        selectedDate = dateTime;
                      });
                    }
                  },
                ),
                ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Cadastrar Produto'),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
