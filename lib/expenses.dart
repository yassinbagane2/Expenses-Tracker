import 'package:flutter/material.dart';
import 'package:my_notes/widgets/expenses_list.dart';
import 'package:my_notes/models/expense.dart';
import 'package:my_notes/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _savedExpenses = [
    Expense(
      title: 'Flutter course',
      amount: 19.99,
      category: Category.work,
      date: DateTime.now(),
    ),
    Expense(
      title: 'Dummy expense',
      amount: 8.99,
      category: Category.food,
      date: DateTime.now(),
    ),
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _savedExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _savedExpenses.indexOf(expense);
    setState(() {
      _savedExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 142, 91, 230),
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _savedExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text('No Expenses found!'));
    if (_savedExpenses.isNotEmpty) {
      setState(() {
        mainContent = ExpensesList(
          expenses: _savedExpenses,
          onRemoveExpense: _removeExpense,
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 55, 9, 133),
        title: const Text(
          'Expense Tracker',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpensesOverlay,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
