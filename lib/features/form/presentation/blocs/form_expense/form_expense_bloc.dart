import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:money_expense/features/form/data/models/expense.dart';
import 'package:money_expense/features/form/data/models/expense_category.dart';
import 'package:money_expense/features/form/data/repository/repository.dart';

part 'form_expense_event.dart';
part 'form_expense_state.dart';

class FormExpenseBloc extends Bloc<FormExpenseEvent, FormExpenseState> {
  FormExpenseBloc() : super(FormExpenseInitial()) {
    final repository = FormRepository();
    bool isSending = false;
    Expense object = Expense();
    List<ExpenseCategory> categories = [];

    on<LoadForm>((event, emit) {
      // add categories
      categories.clear();
      categories.addAll(masterCategories);

      emit(
        FormExpenseLoaded(
          object: object,
          isSending: isSending,
          categories: categories,
        ),
      );
    });

    on<ChangeName>((event, emit) {
      object = object.copyWith(expense: event.value);
    });

    on<ChangeCategory>((event, emit) {
      object = object.copyWith(category: event.value);
      emit(
        FormExpenseLoaded(
          object: object,
          isSending: isSending,
          categories: categories,
        ),
      );
    });

    on<ChangeDate>((event, emit) {
      object = object.copyWith(date: event.value);
      emit(
        FormExpenseLoaded(
          object: object,
          isSending: isSending,
          categories: categories,
        ),
      );
    });

    on<ChangeNominal>((event, emit) {
      if (event.value.isNotEmpty) {
        object = object.copyWith(
          nominal: double.parse(event.value.replaceAll('.', '')),
        );
      } else {
        object = object.copyWith(nominal: 0);
      }
    });

    on<SimpanExpense>((event, emit) async {
      isSending = true;
      emit(
        FormExpenseLoaded(
          object: object,
          isSending: isSending,
          categories: categories,
        ),
      );

      // send data to db
      await repository.insertExpense(object.toMap());

      event.onSuccess();
      isSending = false;
      emit(
        FormExpenseLoaded(
          object: object,
          isSending: isSending,
          categories: categories,
        ),
      );
    });
  }
}
