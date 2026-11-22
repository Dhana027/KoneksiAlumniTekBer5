import 'package:flutter/material.dart';

import 'screens/direktori_alumni_screen.dart';

const Color primaryTeal = Color(0xFF087D95);
const Color darkTeal = Color(0xFF075766);
const Color lightBlue = Color(0xFFEAF4F7);
const Color darkText = Color(0xFF1E293B);
const Color secondaryText = Color(0xFF657786);
const Color dividerColor = Color(0xFFE6EDF2);

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _header(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _hero(context),
                    const SizedBox(height: 20),
                    _campusImage(),
                    const SizedBox(height: 24),
                    _features(context),
                    const SizedBox(height: 18),
                    _metrics(),
                    const SizedBox(height: 24),
                    _howItWorks(),
                    const SizedBox(height: 20),
                    _privacy(context),
                    const SizedBox(height: 20),
                    _footer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // HEADER

  Widget _header(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: dividerColor),
        ),
      ),
      child: Row(
        children: [
          _logoMark(),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KonekSI Alumni',
                  style: TextStyle(
                    color: primaryTeal,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'JEJARING KARIR PORTAL',
                  style: TextStyle(
                    color: secondaryText,
                    fontSize: 8,
                    letterSpacing: 0.7,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryTeal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                minimumSize: Size.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Gabung',
                style: TextStyle(fontSize: 11),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoMark() {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(9),
      ),
      child: const Icon(
        Icons.link,
        color: primaryTeal,
        size: 18,
      ),
    );
  }

  // HERO

  Widget _hero(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 9,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.work_outline,
                  size: 12,
                  color: primaryTeal,
                ),
                SizedBox(width: 6),
                Text(
                  'Jejaring kolaborasi alumni Sistem Informasi ITS',
                  style: TextStyle(
                    color: darkTeal,
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Hubungkan Ambisi dan\nKarir Anda di KonekSI',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
            height: 1.2,
            color: darkText,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Satu portal yang menyatukan alumni dan mahasiswa aktif '
          'Sistem Informasi ITS dalam ekosistem karier, mentoring, '
          'dan peluang kerja.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: secondaryText,
            fontSize: 11,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 38,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryTeal,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Masuk Portal',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 38,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: darkText,
              side: const BorderSide(color: dividerColor),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              'Daftar Akun Baru',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // CAMPUS IMAGE

  Widget _campusImage() {
    return Container(
      height: 150,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFB8DDE8),
                  Color(0xFF518B9C),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          const Icon(
            Icons.account_balance,
            color: Colors.white70,
            size: 75,
          ),
          Positioned(
            left: 12,
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Institut Teknologi Sepuluh Nopember',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // FEATURES

  Widget _features(BuildContext context) {
    final items = [
      (
        Icons.groups_outlined,
        'Direktori Alumni',
        'Database alumni terstruktur berdasarkan keahlian, angkatan, dan perusahaan.',
        const Color(0xFF3478FF),
      ),
      (
        Icons.work_outline,
        'Rujukan Kerja & Referral',
        'Lowongan kerja dan peluang karier dari koneksi alumni.',
        const Color(0xFF00A77B),
      ),
      (
        Icons.favorite_outline,
        'Mentoring Hub 1-on-1',
        'Review portofolio, mock interview, dan konsultasi persiapan karier.',
        const Color(0xFF9747FF),
      ),
      (
        Icons.search,
        'Katalog Talenta',
        'Temukan talenta Sistem Informasi yang sesuai kebutuhan.',
        const Color(0xFFFF8A28),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Apa yang Kami Tawarkan?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: darkText,
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Fitur utama untuk mempercepat koneksi dan karier.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: secondaryText,
            fontSize: 11,
          ),
        ),
        const SizedBox(height: 14),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: item.$2 == 'Direktori Alumni'
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) =>
                              const DirektoriAlumniScreen(),
                        ),
                      );
                    }
                  : null,
              child: _featureCard(
                icon: item.$1,
                title: item.$2,
                description: item.$3,
                color: item.$4,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _featureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: dividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: color.withOpacity(0.09),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              icon,
              color: color,
              size: 17,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 10,
                    height: 1.4,
                    color: secondaryText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // METRICS

  Widget _metrics() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFF17313E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'REAL-TIME PORTAL METRICS',
            style: TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
              color: Color(0xFF70D9E8),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Kekuatan Jejaring Alumni Riil',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: 7),
          Text(
            'KonekSI mempercepat proses lamaran kerja dan '
            'memberi bimbingan berbasis pengalaman nyata.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 10,
              height: 1.5,
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: _Metric('450+', 'Alumni\nTergabung'),
              ),
              Expanded(
                child: _Metric('20+', 'Mentor\nTerpilih'),
              ),
              Expanded(
                child: _Metric('100%', 'Akademis\nTerpercaya'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // HOW IT WORKS

  Widget _howItWorks() {
    final steps = [
      (
        'Daftar / Masuk dengan Peran',
        'Pilih peran Alumni ITS atau Mahasiswa Aktif.',
      ),
      (
        'Lengkapi Portofolio',
        'Isi profil, keahlian, dan status karier.',
      ),
      (
        'Bangun Koneksi Nyata',
        'Ajukan referral atau jadwalkan sesi mentoring.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Cara Kerja Platform KonekSI',
          style: TextStyle(
            color: darkText,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Semua anggota wajib memilih peran agar fitur dan pertukaran data sesuai.',
          style: TextStyle(
            color: secondaryText,
            fontSize: 10,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 13),
        ...List.generate(steps.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 29,
                  height: 29,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '0${index + 1}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: primaryTeal,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        steps[index].$1,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: darkText,
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        steps[index].$2,
                        style: const TextStyle(
                          fontSize: 10,
                          color: secondaryText,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // PRIVACY

  Widget _privacy(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(color: dividerColor),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.shield_outlined,
              color: primaryTeal,
              size: 19,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Privasi & Kehormatan Akademik Terjaga',
            style: TextStyle(
              color: darkText,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Email dan nomor telepon tidak dipublikasikan. '
            'Direktori hanya dapat diakses oleh akun yang telah login dan terverifikasi.',
            style: TextStyle(
              fontSize: 10,
              color: secondaryText,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 36,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryTeal,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Mulai Eksplorasi Sekarang',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // FOOTER

  Widget _footer() {
    return Container(
      padding: const EdgeInsets.only(top: 14, bottom: 5),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: dividerColor),
        ),
      ),
      child: const Column(
        children: [
          Text(
            'KonekSI',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: primaryTeal,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Tentang   Ketentuan   Privasi   Kontak',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8,
              color: secondaryText,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '© 2026 KonekSI Alumni Platform',
            style: TextStyle(
              fontSize: 8,
              color: secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric(this.number, this.label);

  final String number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            color: Color(0xFF70D9E8),
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 8,
            height: 1.3,
          ),
        ),
      ],
    );
  }
}