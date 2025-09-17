part of 'form_expense_bloc.dart';

sealed class FormExpenseEvent extends Equatable {
  const FormExpenseEvent();

  @override
  List<Object> get props => [];
}

final class LoadForm extends FormExpenseEvent {}

final class ChangeName extends FormExpenseEvent {
  final String value;
  const ChangeName({required this.value});

  @override
  List<Object> get props => [value];
}

final class ChangeCategory extends FormExpenseEvent {
  final ExpenseCategory value;
  const ChangeCategory({required this.value});

  @override
  List<Object> get props => [value];
}

final class ChangeDate extends FormExpenseEvent {
  final String value;
  const ChangeDate({required this.value});

  @override
  List<Object> get props => [value];
}

final class ChangeNominal extends FormExpenseEvent {
  final String value;
  const ChangeNominal({required this.value});

  @override
  List<Object> get props => [value];
}

final class SimpanExpense extends FormExpenseEvent {
  final dynamic onSuccess;
  const SimpanExpense({required this.onSuccess});

  @override
  List<Object> get props => [onSuccess];
}
