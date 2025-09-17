import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense/features/dashboard/presentation/blocs/dashboard/dashboard_bloc.dart';
import 'package:money_expense/features/dashboard/presentation/widgets/Category.dart';
import 'package:money_expense/features/dashboard/presentation/widgets/expense_list.dart';
import 'package:money_expense/features/dashboard/presentation/widgets/pengeluaran.dart';
import 'package:money_expense/global/color/colors.dart';
import 'package:money_expense/global/widgets/text.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    void onRefresh() {
      context.read<DashboardBloc>().add(RefreshDashboard());
    }

    void onTapAdd() {
      context.pushNamed("form", extra: onRefresh);
    }

    return SafeArea(
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: onTapAdd,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.blueBackground,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.2),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(Icons.add, color: AppColors.white, size: 48),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: "Halo, Riva",
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8),
              MyText(
                text: "Jangan lupa catat keuanganmu setiap hari!",
                fontSize: 14,
                color: AppColors.greyText2,
              ),
              SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<DashboardBloc, DashboardState>(
                  builder: (context, state) {
                    if (state is DashboardInitial) {
                      return Center(child: CupertinoActivityIndicator());
                    } else if (state is DashboardLoaded) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: PengeluaranTodayOrMonth(
                                  keterangan: "Pengeluaran\nhari ini",
                                  nominal: state.pengeluaranHariIni,
                                  color: AppColors.blueBackground,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: PengeluaranTodayOrMonth(
                                  keterangan: "Pengeluaran\nbulan ini",
                                  nominal: state.pengeluaranBulanIni,
                                  color: AppColors.tealBackground,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          MyText(
                            text: "Pengeluaran berdasarkan kategori",
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          SizedBox(height: 16),
                          SingleChildScrollView(
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  state.pengeluaranKategori.entries.map((e) {
                                    return CategoryExpenseWidget(
                                      category: e.key,
                                      nominal: e.value,
                                    );
                                  }).toList(),
                            ),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: CategorizedExpenseList(
                              categorizedExpenses: state.listExpenses,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Center(
                        child: MyText(
                          text: "Error Occurred",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
