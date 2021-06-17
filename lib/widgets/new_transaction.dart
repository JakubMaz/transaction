import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function newTx;
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  NewTransaction(this.newTx);

  void submitData() {
    final entiredTitle = titleControler.text;
    final entiredAmount = double.parse(amountControler.text);

    if (entiredTitle.isEmpty || entiredAmount <= 0) {
      return;
    }

    newTx(
      entiredTitle,
      entiredAmount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleControler,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControler,
              onSubmitted: (_) => submitData,
              keyboardType: TextInputType.number,
            ),
            TextButton(
              child: Text('Add Transaction'),
              style: TextButton.styleFrom(primary: Colors.purple),
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
