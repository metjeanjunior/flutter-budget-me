import 'package:flutter/material.dart';

class BalanceHeader extends StatefulWidget {
    @override
    BalanceHeaderState createState() => BalanceHeaderState();
}

class BalanceHeaderState extends State<BalanceHeader> {
    double _bodyHeight = 0.0;

    String _balanceText = "Monthly Balance: +\$150";
    String _incomeText = "Monthly Balance: +\$150";
    String _expanseText = "Monthly Expance: -\$150";
    String _numChecksText = "4";

    _getNewHeight() {
        return this._bodyHeight == 0.0 ? 300.0 : 0.0;
    }

    _isExpanded() {
        return this._bodyHeight != 0.0;
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
                                    _balanceText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 20.1
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
                        child: Container(
                            height: this._bodyHeight,
                            child: Column(
                                children: <Widget>[
                                    Row(
                                        children: <Widget>[
                                            Text(this._balanceText),
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: null,
                                            )
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                            Text(this._incomeText),
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: null,
                                            )
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                            Text(this._expanseText),
                                            IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: null,
                                            )
                                        ]
                                    ),
                                    Row(
                                        children: <Widget>[
                                            Text(this._numChecksText),
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