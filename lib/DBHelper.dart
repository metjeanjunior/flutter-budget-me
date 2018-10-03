// inspired by: https://medium.com/@mohamedraja_77/sqflite-database-in-flutter-c0b7be83bcd2

import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'BudgetItemData.dart';

class DBHelper{

    static Database _db;

    Future<Database> get db async {
        if(_db != null)
            return _db;
        _db = await initDb();
        return _db;
    }

    //Creating a database with name budget.db in your directory
    initDb() async {
        io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
        String path = join(documentsDirectory.path, "budget.db");
        var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
        return theDb;
    }

    // Creating a table name Employee with fields
    void _onCreate(Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            "CREATE TABLE budget(id INTEGER PRIMARY KEY, name TEXT, amount INTEGER, dueDay INTEGER, isPaid INTEGER)");
        print("Created tables");
    }

    Future<List<BudgetItemData>> getAllBudgetItemData() async {
        var dbClient = await db;
        List<Map> list = await dbClient.rawQuery('SELECT * FROM budget');
        List<BudgetItemData> budgetItemsData = new List();

        for (int i = 0; i < list.length; i++) {
            budgetItemsData.add(
                new BudgetItemData(
                    list[i]["name"], 
                    list[i]["amount"],
                    list[i]["dueDay"],
                    list[i]["isPaid"]
                )
            );
        }

        print(budgetItemsData.length);
        return budgetItemsData;
    }

    void saveBudgetItem(BudgetItemData budgetItemData) async {
        var dbClient = await db;
        
        await dbClient.transaction((txn) async {
            return await txn.rawInsert(
                'INSERT INTO budget(name, amount, dueDay, isPaid ) VALUES(?, ?, ?, ?)',
                [budgetItemData.name, budgetItemData.amount.toString(), budgetItemData.dueDay.toString(), budgetItemData.isPaid.toString()]
            );
        });
    }

    void updatePaidStatus(String itemName, int paidStatus) async {
        var dbClient = await db;

        await dbClient.rawUpdate(
            'UPDATE budget SET isPaid = ? WHERE name = ?',
            [paidStatus, itemName]
        );
    }
}