import 'package:flutter/material.dart';
import 'BudgetItemData.dart';
import 'DBHelper.dart';

class BudgetItem extends StatelessWidget {
    BudgetItem(this.budgetItemData);

    final BudgetItemData budgetItemData;

    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return new Card(
            child : new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget> [
                    new Text(
                        budgetItemData.name,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 25.1
                        ),
                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget> [
                            new Expanded(
                                child: new Text(
                                    budgetItemData.amount.toString(),
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        // fontWeight: FontWeight.bold, 
                                        fontSize: 25.1
                                    ),
                                ),
                            ),
                            new Expanded(
                                child: new Text(
                                    budgetItemData.dueDay.toString(),
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        // fontWeight: FontWeight.bold, 
                                        fontSize: 25.1
                                    ),
                                ),
                            ),
                        ]
                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget> [
                            new RaisedButton(
                                child: new Text("Paid"),
                                onPressed:  () {
                                    Scaffold.of(context).showSnackBar(new SnackBar(content: Text("Congrats")));

                                    var dbHelper = DBHelper();
                                    dbHelper.markAsPaid( budgetItemData.name );
                                },
                            )
                        ]
                    )
                ]
            )
        );
    }
}