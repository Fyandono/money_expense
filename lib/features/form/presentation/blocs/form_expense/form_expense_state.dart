part of 'form_expense_bloc.dart';

sealed class FormExpenseState extends Equatable {
  const FormExpenseState();

  @override
  List<Object> get props => [];
}

final class FormExpenseInitial extends FormExpenseState {}

final class FormExpenseLoaded extends FormExpenseState {
  final bool isSending;
  final List<ExpenseCategory> categories;
  final Expense object;

  const FormExpenseLoaded({
    required this.object,
    required this.isSending,
    required this.categories,
  });

  @override
  List<Object> get props => [object, isSending, categories];
}

final class FormExpenseError extends FormExpenseState {}
