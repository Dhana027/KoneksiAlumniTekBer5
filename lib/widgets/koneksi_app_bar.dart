import 'package:material_ui/material_ui.dart';
import '../theme/app_colors.dart';

class KoneksiAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onNotificationTap;
  final VoidCallback? onProfileTap;
  final VoidCallback? onMenuTap;

  const KoneksiAppBar({
    super.key,
    this.onNotificationTap,
    this.onProfileTap,
    this.onMenuTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(bottom: BorderSide(color: AppColors.divider)),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: preferredSize.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'KoneksI',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onNotificationTap,
                  icon: const Icon(Icons.notifications_none_rounded),
                  color: AppColors.primary,
                  tooltip: 'Notifikasi',
                ),
                IconButton(
                  onPressed: onProfileTap,
                  icon: const Icon(Icons.account_circle_outlined),
                  color: AppColors.primary,
                  tooltip: 'Akun',
                ),
                IconButton(
                  onPressed: onMenuTap,
                  icon: const Icon(Icons.menu_rounded),
                  color: AppColors.primary,
                  tooltip: 'Menu',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
