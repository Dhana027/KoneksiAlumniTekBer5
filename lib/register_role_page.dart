import 'package:flutter/material.dart';

import '../shared/app_widgets.dart';

class RegisterRolePage extends StatelessWidget {
  const RegisterRolePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: const BrandMark(compact: true),
    ),
    body: ListView(
      padding: const EdgeInsets.all(22),
      children: [
        const Text(
          'LANGKAH 1 DARI 3',
          style: TextStyle(
            fontSize: 11,
            color: teal,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Buat akun KonekSI',
          style: TextStyle(
            fontSize: 29,
            color: ink,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Pilih status yang paling sesuai dengan Anda.',
          style: TextStyle(color: muted),
        ),
        const SizedBox(height: 26),
        _RoleCard(
          icon: Icons.work_outline_rounded,
          title: 'Alumni',
          description: 'Saya lulusan Sistem Informasi ITS',
          onTap: () => Navigator.pushNamed(
            context,
            '/register-profile',
            arguments: 'Alumni',
          ),
        ),
        const SizedBox(height: 14),
        _RoleCard(
          icon: Icons.school_outlined,
          title: 'Mahasiswa',
          description: 'Saya mahasiswa aktif Sistem Informasi ITS',
          onTap: () => Navigator.pushNamed(
            context,
            '/register-profile',
            arguments: 'Mahasiswa',
          ),
        ),
        const SizedBox(height: 24),
        const InfoCard(
          title: 'Verifikasi komunitas',
          message: 'Informasi akademik digunakan untuk membantu memverifikasi keanggotaan KonekSI.',
        ),
        const SizedBox(height: 20),
        Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              const Text('Sudah punya akun? '),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: const Text('Masuk'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _RoleCard extends StatelessWidget {
  const _RoleCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });
  final IconData icon;
  final String title, description;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(18),
    child: SurfaceCard(
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF3F7),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: ink, size: 26),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: ink,
                    fontWeight: FontWeight.w800,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: const TextStyle(color: muted, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded, color: muted, size: 17),
        ],
      ),
    ),
  );
}
