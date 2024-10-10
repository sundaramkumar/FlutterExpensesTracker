import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class ExpenseDatabase extends ChangeNotifier {
  static late Isar isar;

  List<Expense> _allExpenses = [];

  // SETUP
  /* Initialize Db */
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    final Isar isar = await Isar.open(
      [ExpenseSchema],
      directory: dir.path,
    );
  }

  //GETTERS

  List<Expense> get allExpenses => _allExpenses;

  //OPERATIONS
  // Create new expense
  Future<void> createNewExpense(Expense newExpense) async {
    await isar.writeTxn(() => isar.expenses.put(newExpense)); // insert
    await readAllExpenses();
  }

  // Read all expenses
  Future<void> readAllExpenses() async {
    List<Expense> fetchedExpenses = await isar.expenses.where().findAll();
    _allExpenses.clear();
    _allExpenses.addAll(fetchedExpenses);

    notifyListeners(); // notify listeners
  }

  //Update
  Future<void> updateExpense(int id, Expense updatedExpense) async {
    await isar.writeTxn(() => isar.expenses.put(updatedExpense)); // update
    await readAllExpenses();
  }

  //Delete
  Future<void> deleteExpense(int id) async {
    await isar.writeTxn(() => isar.expenses.delete(id)); // delete
    await readAllExpenses(); // read again all expenses
  }

  //Helpers
}
