import 'package:flutter/material.dart';
import '../models/alumni_personal_info.dart';
import '../theme/app_colors.dart';
import '../widgets/info_notice_box.dart';
import '../widgets/koneksi_app_bar.dart';
import '../widgets/profile_info_row.dart';
import '../widgets/sub_page_header.dart';

class AlumniProfileScreen extends StatelessWidget {
  final AlumniPersonalInfo info;
  final VoidCallback? onEditTap;

  const AlumniProfileScreen({
    super.key,
    required this.info,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KoneksiAppBar(),
      body: Column(
        children: [
          const SubPageHeader(title: 'Informasi pribadi'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProfileHeader(info: info),
                  const SizedBox(height: 20),
                  _ContactCard(info: info),
                  const SizedBox(height: 16),
                  _AboutCard(about: info.about),
                  const SizedBox(height: 16),
                  const InfoNoticeBox(
                    title: 'Email dan NRP bersifat pribadi',
                    message:
                        'Atur informasi yang boleh dilihat komunitas melalui menu Privasi.',
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: FilledButton(
                onPressed: onEditTap,
                child: const Text('Edit informasi pribadi'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final AlumniPersonalInfo info;

  const _ProfileHeader({required this.info});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 78,
          height: 78,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.avatarBackground,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.avatarBorder),
          ),
          child: Text(
            info.initials,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                info.fullName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                info.currentPosition,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.badgeBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  info.alumniLabel,
                  style: const TextStyle(
                    color: Color(0xFF003B4A),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ContactCard extends StatelessWidget {
  final AlumniPersonalInfo info;

  const _ContactCard({required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration,
      child: Column(
        children: [
          ProfileInfoRow(
            icon: Icons.mail_outline_rounded,
            label: 'Email',
            value: info.email,
          ),
          const _CardDivider(),
          ProfileInfoRow(
            icon: Icons.smartphone_rounded,
            label: 'Nomor telepon',
            value: info.phoneNumber,
          ),
          const _CardDivider(),
          ProfileInfoRow(
            icon: Icons.language_rounded,
            label: 'Domisili',
            value: info.domicile,
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final String about;

  const _AboutCard({required this.about});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tentang saya',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            about,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 15,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardDivider extends StatelessWidget {
  const _CardDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Divider(height: 1, thickness: 1, color: AppColors.divider),
    );
  }
}

final BoxDecoration _cardDecoration = BoxDecoration(
  color: AppColors.surface,
  borderRadius: BorderRadius.circular(14),
  border: Border.all(color: AppColors.border),
);
