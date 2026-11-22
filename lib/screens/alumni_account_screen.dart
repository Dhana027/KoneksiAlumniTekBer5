import 'package:material_ui/material_ui.dart';
import '../models/alumni_account_summary.dart';
import '../models/alumni_personal_info.dart';
import '../theme/app_colors.dart';
import '../widgets/account_menu_tile.dart';
import '../widgets/koneksi_app_bar.dart';
import 'alumni_profile_screen.dart';

class AlumniAccountScreen extends StatelessWidget {
  final AlumniAccountSummary account;

  final AlumniPersonalInfo personalInfo;

  final VoidCallback? onEducationCareerTap;
  final VoidCallback? onCvDocumentsTap;
  final VoidCallback? onPrivacyNotificationTap;
  final VoidCallback? onChangePasswordTap;
  final VoidCallback? onCompleteProfileTap;
  final VoidCallback? onLogoutTap;

  const AlumniAccountScreen({
    super.key,
    required this.account,
    required this.personalInfo,
    this.onEducationCareerTap,
    this.onCvDocumentsTap,
    this.onPrivacyNotificationTap,
    this.onChangePasswordTap,
    this.onCompleteProfileTap,
    this.onLogoutTap,
  });

  void _openPersonalInfo(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => AlumniProfileScreen(info: personalInfo),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KoneksiAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Akun',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            _AccountSummaryCard(
              account: account,
              onCompleteProfileTap: onCompleteProfileTap,
            ),
            const SizedBox(height: 16),
            AccountMenuTile(
              icon: Icons.person_outline_rounded,
              title: 'Informasi pribadi',
              subtitle: 'Nama, foto, dan kontak',
              onTap: () => _openPersonalInfo(context),
            ),
            const SizedBox(height: 4),
            AccountMenuTile(
              icon: Icons.school_outlined,
              title: 'Pendidikan & karier',
              subtitle: 'Almamater dan pengalaman profesional',
              onTap: onEducationCareerTap,
            ),
            const SizedBox(height: 4),
            AccountMenuTile(
              icon: Icons.description_outlined,
              title: 'CV & dokumen',
              subtitle: 'Kelola aset profesionalmu',
              onTap: onCvDocumentsTap,
            ),
            const SizedBox(height: 4),
            AccountMenuTile(
              icon: Icons.notifications_none_rounded,
              title: 'Privasi & notifikasi',
              subtitle: 'Atur visibilitas dan pemberitahuan',
              onTap: onPrivacyNotificationTap,
            ),
            const SizedBox(height: 4),
            AccountMenuTile(
              icon: Icons.verified_user_outlined,
              title: 'Ubah kata sandi',
              subtitle: 'Perbarui kata sandi akunmu',
              onTap: onChangePasswordTap,
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: onLogoutTap,
              borderRadius: BorderRadius.circular(4),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  'Keluar dari akun',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'KonekSI Alumni · versi 1.0',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountSummaryCard extends StatelessWidget {
  final AlumniAccountSummary account;
  final VoidCallback? onCompleteProfileTap;

  const _AccountSummaryCard({
    required this.account,
    this.onCompleteProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.avatarBackground,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.avatarBorder),
                ),
                child: Text(
                  account.initials,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account.fullName,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      account.alumniLabel,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (account.isEmailVerified) ...[
            const SizedBox(height: 14),
            const Row(
              children: [
                Icon(Icons.verified_user_outlined,
                    size: 20, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Email terverifikasi',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: account.profileCompletion,
              minHeight: 4,
              color: AppColors.primary,
              backgroundColor: AppColors.infoBackground,
            ),
          ),
          const SizedBox(height: 12),
          InkWell(
            onTap: onCompleteProfileTap,
            child: Text(
              'Profil ${account.profileCompletionPercent}% lengkap · Lengkapi sekarang',
              style: const TextStyle(
                color: AppColors.primary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
