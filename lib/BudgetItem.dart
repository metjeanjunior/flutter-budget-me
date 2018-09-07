import 'package:flutter/material.dart';

class BudgetItem extends StatelessWidget {
    BudgetItem({this.itemName, this.itemAmount, this.itemDueDay});

    final String itemName;
    final String itemAmount;
    final String itemDueDay;
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return new Card(
            child : new Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget> [
                    new Text(
                        itemName,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, 
                            fontSize: 25.1
                        ),
                    ),
                    new Row(
                        children: <Widget> [
                            new Expanded(
                                child: new Text(
                                    itemAmount,
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        // fontWeight: FontWeight.bold, 
                                        fontSize: 25.1
                                    ),
                                ),
                            ),
                            new Expanded(
                                child: new Text(
                                    itemDueDay,
                                    textAlign: TextAlign.center,
                                    style: new TextStyle(
                                        // fontWeight: FontWeight.bold, 
                                        fontSize: 25.1
                                    ),
                                ),
                            ),
                        ]
                    )
                ]
            )
        );
    }
}