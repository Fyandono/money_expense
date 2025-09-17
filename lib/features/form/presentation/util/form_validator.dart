class FormValidator {
  String? nama(String? value) {
    if (value == null || value.isEmpty) {
      return "Mohon masukkan nama expense!";
    } else {
      return null;
    }
  }

  String? kategori(String? value) {
    if (value == null || value.isEmpty) {
      return "Mohon pilih kategori!";
    } else {
      return null;
    }
  }

  String? calendar(String? value) {
    if (value == null || value.isEmpty) {
      return "Mohon pilih tanggal expense!";
    } else {
      return null;
    }
  }

  String? nominal(String? value) {
    if (value == null || value.isEmpty) {
      return "Mohon masukkan nominal expense!";
    } else if (int.parse(value.replaceAll(".", "")) <= 0) {
      return "Mohon masukkan nominal expense lebih dari 0!";
    } else {
      return null;
    }
  }

  String? nomorTeleponPIC(String? value) {
    if (value == null || value.isEmpty) {
      return "Mohon masukkan nomor telepon PIC!";
    } else {
      return null;
    }
  }

  String? username(String? value) {
    if (value == null || value.isEmpty) {
      return "Mohon masukkan username!";
    } else {
      return null;
    }
  }

  String? password(String? value) {
    if (value == null || value.isEmpty) {
      return "Mohon masukkan password!";
    } else {
      return null;
    }
  }
}
