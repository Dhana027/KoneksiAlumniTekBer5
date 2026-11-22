class AlumniAccountSummary {
  final String fullName;
  final int graduationYear;
  final bool isEmailVerified;

  final double profileCompletion;

  const AlumniAccountSummary({
    required this.fullName,
    required this.graduationYear,
    required this.isEmailVerified,
    required this.profileCompletion,
  });

  String get initials {
    final words =
        fullName.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty);
    return words.take(2).map((w) => w[0].toUpperCase()).join();
  }

  String get alumniLabel => 'Alumni • Lulusan $graduationYear';

  int get profileCompletionPercent => (profileCompletion * 100).round();

  static const AlumniAccountSummary sample = AlumniAccountSummary(
    fullName: 'Nadia Putri',
    graduationYear: 2022,
    isEmailVerified: true,
    profileCompletion: 0.75,
  );
}
