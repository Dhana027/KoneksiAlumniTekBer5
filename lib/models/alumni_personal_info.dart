class AlumniPersonalInfo {
  final String fullName;
  final String currentPosition;
  final int graduationYear;
  final String email;
  final String phoneNumber;
  final String domicile;
  final String about;

  const AlumniPersonalInfo({
    required this.fullName,
    required this.currentPosition,
    required this.graduationYear,
    required this.email,
    required this.phoneNumber,
    required this.domicile,
    required this.about,
  });

  String get initials {
    final words =
        fullName.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty);
    return words.take(2).map((w) => w[0].toUpperCase()).join();
  }

  String get alumniLabel => 'Alumni $graduationYear';

  static const AlumniPersonalInfo sample = AlumniPersonalInfo(
    fullName: 'Nadia Putri',
    currentPosition: 'Product Designer',
    graduationYear: 2022,
    email: 'nadia.putri@example.com',
    phoneNumber: '+62 812 3456 7890',
    domicile: 'Surabaya, Jawa Timur',
    about:
        'Senang menghubungkan riset pengguna dengan desain produk yang mudah digunakan.',
  );
}
