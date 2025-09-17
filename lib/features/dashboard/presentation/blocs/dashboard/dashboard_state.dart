part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

final class DashboardLoaded extends DashboardState {
  final double pengeluaranHariIni;
  final double pengeluaranBulanIni;
  final Map<ExpenseCategory, double> pengeluaranKategori;
  final List<CategorizedExpense> listExpenses;
  const DashboardLoaded({
    required this.pengeluaranHariIni,
    required this.pengeluaranBulanIni,
    required this.pengeluaranKategori,
    required this.listExpenses,
  });

  @override
  List<Object> get props => [
    pengeluaranHariIni,
    pengeluaranBulanIni,
    pengeluaranKategori,
    listExpenses,
  ];
}

final class DashboardError extends DashboardState {}
