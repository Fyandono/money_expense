class ExpenseCategory {
  final int id;
  final String value;
  final String asset;

  const ExpenseCategory({
    required this.id,
    required this.value,
    required this.asset,
  });

  static ExpenseCategory? getCategoryById(int? id) {
    if (id == null) return null;
    try {
      return masterCategories.firstWhere((cat) => cat.id == id);
    } catch (e) {
      return null;
    }
  }
}

final List<ExpenseCategory> masterCategories = [
  ExpenseCategory(id: 1, value: 'Makanan', asset: 'assets/icons/makanan.png'),
  ExpenseCategory(id: 2, value: 'Internet', asset: 'assets/icons/internet.png'),
  ExpenseCategory(id: 3, value: 'Edukasi', asset: 'assets/icons/edukasi.png'),
  ExpenseCategory(id: 4, value: 'Hadiah', asset: 'assets/icons/hadiah.png'),
  ExpenseCategory(
    id: 5,
    value: 'Transport',
    asset: 'assets/icons/transport.png',
  ),
  ExpenseCategory(id: 6, value: 'Belanja', asset: 'assets/icons/belanja.png'),
  ExpenseCategory(
    id: 7,
    value: 'Alat Rumah',
    asset: 'assets/icons/alat_rumah.png',
  ),
  ExpenseCategory(id: 8, value: 'Olahraga', asset: 'assets/icons/olahraga.png'),
  ExpenseCategory(id: 9, value: 'Hiburan', asset: 'assets/icons/hiburan.png'),
];
