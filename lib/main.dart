import 'package:flutter/material.dart';
import 'BudgetItem.dart';
import 'BalanceHeader.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Budget Me',
            home: BudgetScreen(),
        );
    }
}

class BudgetScreen extends StatefulWidget {
    @override
    BudgetScreenState createState() => BudgetScreenState();
}



class BudgetScreenState extends State<BudgetScreen> {
    final List<BudgetItem> _budgetItems = <BudgetItem>[];

    void _newBudgetItem() {
        BudgetItem budgetItem = new BudgetItem(
            itemName: "Car Bill",
            itemAmount: "\$123",
            itemDueDay: "12",
        );

        setState(() {
            _budgetItems.insert(0, budgetItem);
        });

        return;
    
        final TextEditingController _nameTextController = TextEditingController();
        final TextEditingController _amountTextController = TextEditingController();
        final TextEditingController _dayTextController = TextEditingController();

        showDialog(
            context: context,
            // barrierDismissible: false,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Budget Item Info'),
                    content: SingleChildScrollView(
                        child: ListBody(
                            children: <Widget>[
                                TextField(
                                    autofocus: true,
                                    controller: _nameTextController,
                                    maxLength: 50,
                                    decoration: InputDecoration.collapsed(hintText: "Budget Item Name"),
                                ),
                                TextField(
                                    controller: _amountTextController,
                                    maxLength: 10,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration.collapsed(hintText: "Budget Item Amount"),
                                ),
                                TextField(
                                    controller: _dayTextController,
                                    maxLength: 2,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration.collapsed(hintText: "Budget Item Day"),
                                ),
                            ],
                        )
                    ),
                    actions: <Widget>[
                        FlatButton(
                            child: Text("Add"),
                            onPressed: () { 
                                if (_nameTextController.text == "" 
                                        && _amountTextController.text == "" 
                                        && _dayTextController.text == "") {
                                            customShowSnackBar("Please fill in all fields");
                                }
                                else {
                                    BudgetItem budgetItem = BudgetItem(
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
                        FlatButton(
                            child: Text("cancel"),
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
    void customShowSnackBar(String text) =>  Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));
    
    @override
    Widget build(BuildContext context) {
        // TODO: implement build
        return Scaffold(
            appBar: AppBar(
                title: const Text('Budget Me'),
            ),
            body: Column(
                children: <Widget>[
                    BalanceHeader(),
                    Flexible(
                        child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250.0
                            ),
                            padding: EdgeInsets.all(8.0),
                            itemBuilder: (_, int index) => _budgetItems[index],
                            itemCount: _budgetItems.length,
                        )
                    ),
                ]
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: _newBudgetItem,
                tooltip: 'New Budget Item',
                child: Icon(Icons.add),
            ),
        );
    }
}