import 'package:flutter/material.dart';
import 'BudgetItem.dart';

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



class BudgetScreenState extends State<BudgetScreen> {
    final List<BudgetItem> _budgetItems = <BudgetItem>[];

    void _newBudgetItem() {
        // BudgetItem budgetItem = new BudgetItem(
        //     itemName: "Car Bill",
        //     itemAmount: "\$123",
        //     itemDueDay: "12",
        // );

        // setState(() {
        //     _budgetItems.insert(0, budgetItem);
        // });

        // return;
    
        final TextEditingController _nameTextController = new TextEditingController();
        final TextEditingController _amountTextController = new TextEditingController();
        final TextEditingController _dayTextController = new TextEditingController();

        showDialog(
            context: context,
            // barrierDismissible: false,
            builder: (BuildContext context) {
                return new AlertDialog(
                    title: new Text('Budget Item Info'),
                    content: new SingleChildScrollView(
                        child: new ListBody(
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
                        )
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
                                        itemAmount: '\$' + _amountTextController.text,
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
        // TODO: implement build
        return new Scaffold(
            appBar: new AppBar(
                title: const Text('Budget Me'),
            ),
            body: new Column(
                children: <Widget>[
                    new Flexible(
                        child: new GridView.builder(
                            gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250.0
                            ),
                            padding: new EdgeInsets.all(8.0),
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