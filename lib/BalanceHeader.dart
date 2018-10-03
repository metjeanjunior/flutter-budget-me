import 'package:flutter/material.dart';

class BalanceHeader extends StatefulWidget {
    @override
    BalanceHeaderState createState() => BalanceHeaderState();
}

class BalanceHeaderState extends State<BalanceHeader> {
    double _bodyHeight = 0.0;

    int _incomeAmnt = 0;
    int _expAmnt = 150;
    int _numChecks = 4;

    _getNewHeight() {
        return this._bodyHeight < 1 ? 150.0 : 0.0;
    }

    _getBalanceAmnt() {
        return this._incomeAmnt - this._expAmnt;
    }

    void customShowSnackBar(String text) =>  Scaffold.of(context).showSnackBar(SnackBar(content: Text(text)));

    _updateIncome() {
        TextEditingController _incomeAmntCtr = TextEditingController();
        showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Budget Item Info'),
                    content: SingleChildScrollView(
                        child: TextField(
                            autofocus: true,
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            controller: _incomeAmntCtr,
                            decoration: InputDecoration.collapsed(hintText: "Paycheck Amount"),
                        ),
                    ),
                    actions: <Widget>[
                        FlatButton(
                            child: Text("Update"),
                            onPressed: () { 
                                if (_incomeAmntCtr.text == "")
                                        customShowSnackBar("Please fill in all fields");
                                else {
                                    setState(() {
                                        _incomeAmnt = int.parse(_incomeAmntCtr.text);
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

    _updateNumChecks() {
        final TextEditingController _numChecksCtr = TextEditingController();
        showDialog(
            context: context,
            builder: (BuildContext context) {
                return AlertDialog(
                    title: Text('Budget Item Info'),
                    content: SingleChildScrollView(
                        child: TextField(
                            autofocus: true,
                            maxLength: 2,
                            keyboardType: TextInputType.number,
                            controller: _numChecksCtr,
                            decoration: InputDecoration.collapsed(hintText: "# of Paychecks"),
                        ),
                    ),
                    actions: <Widget>[
                        FlatButton(
                            child: Text("Update"),
                            onPressed: () { 
                                if (_numChecksCtr.text == "")
                                        customShowSnackBar("Please fill in all fields");
                                else {
                                    setState(() {
                                        _numChecks = int.parse(_numChecksCtr.text);
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

    @override
    Widget build(BuildContext context) {
        return SingleChildScrollView(
            child: Column(
                children: <Widget>[
                    Row(
                        children: <Widget>[
                            Expanded(
                                child: Text(
                                    "Monthly Balance: ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 20.1
                                    ),
                                )
                            ),
                            Expanded(
                                child: Text(
                                    _getBalanceAmnt().toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 20.1,
                                        color: _getBalanceAmnt() >= 0 ? Colors.green : Colors.red
                                    ),
                                )
                            ),
                            IconButton(
                                icon: this._bodyHeight < 1 ? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                                onPressed: () => setState(() => this._bodyHeight = _getNewHeight() ),
                            )
                        ]
                    ),
                    Card(
                        child: AnimatedContainer(
                            height: this._bodyHeight,
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 500),
                            child: Column(
                                children: <Widget>[
                                    Row(
                                        children: <Widget>[
                                            Expanded(
                                                child: Text(
                                                    "Monthly Income: ",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold, 
                                                        fontSize: 20.1,
                                                    ),
                                                ),
                                            ),
                                            Expanded(
                                                child: Text(
                                                    "\$${this._incomeAmnt}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold, 
                                                        fontSize: 20.1,
                                                        color: Colors.green
                                                    ),
                                                )
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: _updateIncome
                                            )
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                            Expanded(
                                                child: Text(
                                                    "Monthly Expenses: ",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold, 
                                                        fontSize: 20.1,
                                                    ),
                                                ),
                                            ),
                                            Expanded(
                                                child: Text(
                                                    "\$${this._expAmnt}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold, 
                                                        fontSize: 20.1,
                                                        color: Colors.red
                                                    ),
                                                )
                                            ),
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                            Expanded(
                                                child: Text(
                                                    "# of Checks",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold, 
                                                        fontSize: 20.1,
                                                    ),
                                                ),
                                            ),
                                            Expanded(
                                                child: Text(
                                                    this._numChecks.toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold, 
                                                        fontSize: 20.1,
                                                    ),
                                                ),
                                            ),
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: _updateNumChecks,
                                            )
                                        ]
                                    ),
                                ]
                            )
                        )
                    )
                ]
            ),
        );
    }
}