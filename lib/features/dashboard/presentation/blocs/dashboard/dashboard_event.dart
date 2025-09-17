part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

final class LoadDashboard extends DashboardEvent {}

final class RefreshDashboard extends DashboardEvent {}
