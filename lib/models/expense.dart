import 'package:isar/isar.dart';

// to generate the isar file
// run in terminal: dart run build_runner build
part 'expense.g.dart';

@Collection()
class Expense {
  Id id = Isar.autoIncrement;
  final String name;
  final String category;
  final String transactionType;
  final double amount;
  final DateTime date;

  Expense({
    required this.name,
    required this.category,
    required this.amount,
    required this.date,
    required this.transactionType,
  });
}
