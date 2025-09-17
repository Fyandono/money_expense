import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:money_expense/features/dashboard/data/models/categorized_expense.dart';
import 'package:money_expense/features/dashboard/data/repository/repository.dart';
import 'package:money_expense/features/dashboard/presentation/util/categorize_expense.dart';
import 'package:money_expense/features/form/data/models/expense_category.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    final repository = DashboardRepository();
    on<LoadDashboard>((event, emit) async {
      try {
        final pengeluaranHariIni = await repository.getPengeluaranHariIni();
        final pengeluaranBulanIni = await repository.getPengeluaranBulanIni();
        final pengeluaranKategori =
            await repository.getPengeluaranBerdasarkanKategori();
        final allExpenses = await repository.getAllExpenses();
        final categorizedExpenses = categorizeExpensesSingleList(
          DateTime.now(),
          allExpenses,
        );
        emit(
          DashboardLoaded(
            pengeluaranHariIni: pengeluaranHariIni,
            pengeluaranBulanIni: pengeluaranBulanIni,
            pengeluaranKategori: pengeluaranKategori,
            listExpenses: List.from(categorizedExpenses),
          ),
        );
      } catch (e) {
        emit(DashboardError());
      }
    });

    on<RefreshDashboard>((event, emit) async {
      try {
        emit(DashboardInitial());
        final pengeluaranHariIni = await repository.getPengeluaranHariIni();
        final pengeluaranBulanIni = await repository.getPengeluaranBulanIni();
        final pengeluaranKategori =
            await repository.getPengeluaranBerdasarkanKategori();
        final allExpenses = await repository.getAllExpenses();
        final categorizedExpenses = categorizeExpensesSingleList(
          DateTime.now(),
          allExpenses,
        );
        emit(
          DashboardLoaded(
            pengeluaranHariIni: pengeluaranHariIni,
            pengeluaranBulanIni: pengeluaranBulanIni,
            pengeluaranKategori: pengeluaranKategori,
            listExpenses: List.from(categorizedExpenses),
          ),
        );
      } catch (e) {
        emit(DashboardError());
      }
    });
  }
}
