import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new MaterialApp(
            title: 'Budget Me',
            home: new BudgetScreen(),
        );
    }
}

class BudgetScreen extends StatefulWidget {
    @override
    BudgetScreenState createState() => new BudgetScreenState();
}

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                    new Text(itemName),
                    new Text(itemAmount),
                    new Text(itemDueDay)
                ]
            )
        );
      }
}

class BudgetScreenState extends State<BudgetScreen> {
    final List<BudgetItem> _budgetItems = <BudgetItem>[];

    void _newBudgetItem() async {
        final TextEditingController _nameTextController = new TextEditingController();
        final TextEditingController _amountTextController = new TextEditingController();
        final TextEditingController _dayTextController = new TextEditingController();

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
                return new AlertDialog(
                    title: new Text('Budget Item Info'),
                    content: new Column(
                        children: <Widget>[
                            new TextField(
                                autofocus: true,
                                controller: _nameTextController,
                                maxLength: 50,
                                decoration: new InputDecoration.collapsed(hintText: "Budget Item Name"),
                            ),
                            new TextField(
                                controller: _amountTextController,
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration.collapsed(hintText: "Budget Item Amount"),
                            ),
                            new TextField(
                                controller: _dayTextController,
                                maxLength: 2,
                                keyboardType: TextInputType.number,
                                decoration: new InputDecoration.collapsed(hintText: "Budget Item Day"),
                            ),
                        ],
                    ),
                    actions: <Widget>[
                        new FlatButton(
                            child: new Text("Add"),
                            onPressed: () { 
                                if (_nameTextController.text == "" 
                                        && _amountTextController.text == "" 
                                        && _dayTextController.text == "") {
                                            customShowSnackBar("Please fill in all fields");
                                }
                                else {
                                    BudgetItem budgetItem = new BudgetItem(
                                        itemName: _nameTextController.text,
                                        itemAmount: _amountTextController.text,
                                        itemDueDay: _dayTextController.text,
                                    );

                                    setState(() {
                                        _budgetItems.insert(0, budgetItem);
                                    });

                                    Navigator.of(context).pop();
                                }
                            },
                        ),
                        new FlatButton(
                            child: new Text("cancel"),
                            onPressed: () { 
                                Navigator.of(context).pop();
                            },
                        )
                    ],
                );

            }
        );
    }

    // TODO: Fix this
    void customShowSnackBar(String text) =>  Scaffold.of(context).showSnackBar(new SnackBar(content: Text(text)));
    
    @override
    Widget build(BuildContext context) {
        // _budgetItems.insert(0, new BudgetItem(
        //     itemName: "_itemName",
        //     itemAmount: "_itemAmount",
        //     itemDueDay: "_itemDay",
        // ));
        // TODO: implement build
        return new Scaffold(
            appBar: new AppBar(
                title: const Text('Budget Me'),
            ),
            body: new Column(
                children: <Widget>[
                    new Flexible(
                        child: new ListView.builder(
                            padding: new EdgeInsets.all(8.0),
                            reverse: true,
                            itemBuilder: (_, int index) => _budgetItems[index],
                            itemCount: _budgetItems.length,
                        )
                    ),
                ]
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: _newBudgetItem,
                tooltip: 'New Budget Item',
                child: new Icon(Icons.add),
            ),
        );
      }
}