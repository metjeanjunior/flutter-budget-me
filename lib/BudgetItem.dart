import 'package:flutter/material.dart';
import 'BudgetItemData.dart';
import 'DBHelper.dart';

class BudgetItem extends StatefulWidget {
    BudgetItem(this.budgetItemData);
    final BudgetItemData budgetItemData;

    BudgetItemState createState() => BudgetItemState();
}

class BudgetItemState extends State<BudgetItem> {
    // BudgetItemState(this.budgetItemData);

    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return new Card(
            color: widget.budgetItemData.isPaid == 1 ? Colors.green : Colors.red,
            child : new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget> [
                    new Text(
                        widget.budgetItemData.name,
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
                                    widget.budgetItemData.amount.toString(),
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        // fontWeight: FontWeight.bold, 
                                        fontSize: 25.1
                                    ),
                                ),
                            ),
                            new Expanded(
                                child: new Text(
                                    widget.budgetItemData.dueDay.toString(),
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
                                child: widget.budgetItemData.isPaid == 1 ? new Text("Not Paid") : new Text("Paid"),
                                onPressed:  () {
                                    var dbHelper = DBHelper();
                                    
                                    if (widget.budgetItemData.isPaid == 0)
                                    {
                                        Scaffold.of(context).showSnackBar(new SnackBar(content: Text("Congrats")));
                                        dbHelper.updatePaidStatus( widget.budgetItemData.name, 1);
                                    } else
                                        dbHelper.updatePaidStatus( widget.budgetItemData.name, 0);

                                    setState(() {
                                        widget.budgetItemData.isPaid =  widget.budgetItemData.isPaid == 0 ? 1 : 0;                                  
                                    });

                                },
                            )
                        ]
                    )
                ]
            )
        );
    }
}