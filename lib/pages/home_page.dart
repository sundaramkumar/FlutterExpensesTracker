import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  void openNewExpenseBox() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Add new Expense"),
              content: Column(
                children: [
                  TextField(
                    controller: nameController,
                  ),
                  TextField(
                    controller: amountController,
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: openNewExpenseBox,
        child: const Icon(Icons.add),
      ),
    );
  }
}
