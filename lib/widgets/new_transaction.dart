import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final void Function(String, double) addCallback;
  NewTransaction({super.key, required this.addCallback});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addCallback(
      enteredTitle,
      enteredAmount,
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => _submitData,
                // onChanged: (value) => _titleInput = value,
              ),
              TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                onSubmitted: (_) => _submitData,
                // onChanged: (value) => _amountInput = value,
              ),
              TextButton(
                onPressed: _submitData,
                child: Text('Add Transaction'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.purple,
                ),
              )
            ]),
      ),
    );
  }
}
