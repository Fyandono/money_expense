import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:money_expense/features/form/presentation/blocs/form_expense/form_expense_bloc.dart';
import 'package:money_expense/features/form/presentation/util/form_validator.dart';
import 'package:money_expense/features/form/presentation/widgets/category_bottom_sheet.dart';
import 'package:money_expense/global/color/colors.dart';
import 'package:money_expense/global/extension/keyboard_type_int.dart';
import 'package:money_expense/global/extension/thousand_separator.dart';
import 'package:money_expense/global/widgets/bottom_button.dart';
import 'package:money_expense/global/widgets/calendar_single.dart';
import 'package:money_expense/global/widgets/header_back.dart';
import 'package:money_expense/global/widgets/text.dart';
import 'package:money_expense/global/widgets/text_field.dart';

class FormExpensePage extends StatelessWidget {
  final Function() onRefresh;
  const FormExpensePage({required this.onRefresh, super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final formValidator = FormValidator();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderBack(title: "Tambah Pengeluaran Baru"),
            Expanded(
              child: BlocBuilder<FormExpenseBloc, FormExpenseState>(
                builder: (context, state) {
                  if (state is FormExpenseInitial) {
                    return Center(child: CupertinoActivityIndicator());
                  } else if (state is FormExpenseLoaded) {
                    void onChangedNama(String? value) {
                      if (value != null) {
                        context.read<FormExpenseBloc>().add(
                          ChangeName(value: value),
                        );
                      }
                    }

                    void onTapKategori() {
                      showCategoryBottomSheet(
                        categories: state.categories,
                        onTap: (selected) {
                          context.read<FormExpenseBloc>().add(
                            ChangeCategory(value: selected),
                          );
                        },
                      );
                    }

                    void onTapDate() {
                      void method(selected) {
                        context.read<FormExpenseBloc>().add(
                          ChangeDate(value: selected),
                        );
                      }

                      showModalCalendarSingle(
                        date: state.object.date ?? '',
                        enablePastDates: true,
                        enableFutureDates: false,
                        method: method,
                      );
                    }

                    void onChangedNominal(String? value) {
                      if (value != null) {
                        context.read<FormExpenseBloc>().add(
                          ChangeNominal(value: value),
                        );
                      }
                    }

                    void onTapSubmit() {
                      if (formKey.currentState?.validate() ?? false) {
                        void onSuccess() {
                          onRefresh();
                          context.goNamed("/");
                        }

                        context.read<FormExpenseBloc>().add(
                          SimpanExpense(onSuccess: onSuccess),
                        );
                      }
                    }

                    return Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            child: Form(
                              key: formKey,
                              child: Wrap(
                                runSpacing: 20,
                                children: [
                                  MyTextField(
                                    enabled: !state.isSending,
                                    key: Key("expense${state.object.expense}"),
                                    initialValue: state.object.expense,
                                    label: "Nama Pengeluaran",
                                    onChanged: onChangedNama,
                                    validator: formValidator.nama,
                                  ),
                                  MyTextField(
                                    enabled: !state.isSending,
                                    key: Key(
                                      "kategori${state.object.category?.id}",
                                    ),
                                    initialValue: state.object.category?.value,
                                    prefixIcon:
                                        state.object.category != null
                                            ? Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: SizedBox(
                                                width: 16,
                                                height: 16,
                                                child: Image.asset(
                                                  state.object.category!.asset,
                                                ),
                                              ),
                                            )
                                            : null,
                                    suffixIcon: Icon(
                                      Icons.play_circle_filled_rounded,
                                      size: 20,
                                      color: AppColors.greyText2,
                                    ),
                                    label: "Kategori",
                                    onTap: onTapKategori,
                                    validator: formValidator.kategori,
                                  ),
                                  MyTextField(
                                    enabled: !state.isSending,
                                    key: Key("date${state.object.date}"),
                                    initialValue: state.object.dateFormatted,
                                    label: "Tanggal Pengeluaran",
                                    onTap: onTapDate,
                                    suffixIcon: Icon(
                                      Icons.calendar_month_outlined,
                                      size: 20,
                                      color: AppColors.greyText2,
                                    ),
                                    validator: formValidator.calendar,
                                  ),
                                  MyTextField(
                                    enabled: !state.isSending,
                                    key: Key("nominal${state.object.nominal}"),
                                    initialValue: state.object.nominalFormatted,
                                    label: "Nominal",
                                    onChanged: onChangedNominal,
                                    keyboardType: keyboardTypeInt,
                                    prefixText: "Rp",
                                    // validator: validator.nominal,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(13),
                                      ThousandSeparator(),
                                    ],
                                    validator: formValidator.nominal,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        MyBottomButton(
                          onPressed: onTapSubmit,
                          labelText: "Simpan",
                          isLoading: state.isSending,
                        ),
                      ],
                    );
                  } else {
                    return Center(
                      child: MyText(text: "Terjadi Kesalahan", fontSize: 16),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
