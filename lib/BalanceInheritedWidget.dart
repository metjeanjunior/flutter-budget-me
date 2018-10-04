import 'package:flutter/material.dart';

class BalanceInheritedWidget extends InheritedWidget {
    final int expAmnt;

    BalanceInheritedWidget({Key key, this.expAmnt, Widget child}): super(key:key, child: child);

    static BalanceInheritedWidget of(BuildContext context) {
        return context.inheritFromWidgetOfExactType(BalanceInheritedWidget);
    }

    @override
    bool updateShouldNotify(BalanceInheritedWidget old) =>
        expAmnt != old.expAmnt;
}