import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense/features/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:money_expense/features/dashboard/presentation/page/dashboard.dart';
import 'package:money_expense/features/form/presentation/blocs/form_expense/form_expense_bloc.dart';
import 'package:money_expense/features/form/presentation/page/form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter myRouter = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    // dashboard
    GoRoute(
      name: '/',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) => DashboardBloc()..add(LoadDashboard()),
          child: const DashboardPage(),
        );
      },
      routes: [
        // form
        GoRoute(
          name: 'form',
          path: 'form',
          builder: (BuildContext context, GoRouterState state) {
            final onRefresh = state.extra as Function();
            return BlocProvider(
              create: (context) => FormExpenseBloc()..add(LoadForm()),
              child: FormExpensePage(onRefresh: onRefresh),
            );
          },
        ),
      ],
    ),
  ],
);
