import 'package:flutter/material.dart';
import 'package:my_notes/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 132, 80, 221),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            children: [
              Text(
                expense.title,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    '\$${expense.amount.toStringAsFixed(2)}',
                    style: const TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(categoryIcons[expense.category]),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        expense.formattedDate,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
