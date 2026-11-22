class Alumni {
  const Alumni({
    required this.nama,
    required this.angkatan,
    required this.posisi,
    required this.perusahaan,
    required this.keahlian,
  });

  final String nama;
  final int angkatan;
  final String posisi;
  final String perusahaan;
  final List<String> keahlian;

  String get inisial => nama
      .trim()
      .split(RegExp(r'\s+'))
      .take(2)
      .map((kata) => kata[0].toUpperCase())
      .join();

  bool sesuaiPencarian(String kataKunci) {
    final kata = kataKunci.trim().toLowerCase();
    if (kata.isEmpty) return true;

    final informasi = [
      nama,
      posisi,
      perusahaan,
      ...keahlian,
    ].join(' ').toLowerCase();

    return kata.split(RegExp(r'\s+')).every(informasi.contains);
  }
}

const contohAlumni = <Alumni>[
  Alumni(
    nama: 'Raka Pratama',
    angkatan: 2018,
    posisi: 'Data Analyst',
    perusahaan: 'Nusa Digital',
    keahlian: ['Data Analytics', 'SQL', 'Python'],
  ),
  Alumni(
    nama: 'Nadia Putri',
    angkatan: 2018,
    posisi: 'Product Designer',
    perusahaan: 'Arunika Studio',
    keahlian: ['UI/UX Design', 'Figma', 'User Research'],
  ),
  Alumni(
    nama: 'Arga Putra',
    angkatan: 2020,
    posisi: 'Software Engineer',
    perusahaan: 'Nusa Digital',
    keahlian: ['Software Engineering', 'Flutter', 'Dart'],
  ),
];