import 'package:flutter/material.dart';

class BalanceHeader extends StatefulWidget {
    @override
    BalanceHeaderState createState() => BalanceHeaderState();
}

class BalanceHeaderState extends State<BalanceHeader> {
    double _bodyHeight = 0.0;

    int _incomeAmnt = 150;
    int _expAmnt = 150;
    int _numChecks = 4;

    _getNewHeight() {
        return this._bodyHeight == 0.0 ? 150.0 : 0.0;
    }

    _getBalanceAmnt() {
        return this._incomeAmnt - this._expAmnt;
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
                                icon: Icon(Icons.keyboard_arrow_down),
                                onPressed: () => setState(() => this._bodyHeight = _getNewHeight() ),
                            )
                        ]
                    ),
                    Card(
                        // height: this._bodyHeight,
                        child: AnimatedContainer(
                            height: this._bodyHeight,
                            curve: Curves.bounceInOut,
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
                                                onPressed: null,
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
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: null,
                                            )
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
                                                onPressed: null,
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