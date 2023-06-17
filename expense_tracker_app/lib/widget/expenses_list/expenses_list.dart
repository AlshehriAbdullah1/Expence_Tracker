import 'package:expense_tracker_app/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemoveExpense});

  final void Function(Expense expense) onRemoveExpense;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
              background: Container(
                color: Theme.of(context)
                    .colorScheme
                    .error
                    .withOpacity(0.75)
                    .withRed(244),
                margin: EdgeInsets.symmetric(
                    horizontal: Theme.of(context).cardTheme.margin!.horizontal),
              ),
              onDismissed: (direction) {
                onRemoveExpense(expenses[index]);
              },
              key: ValueKey(expenses[index]),
              child: ExpenseItem(
                expense: expenses[index],
              ),
            ));
  }
}
