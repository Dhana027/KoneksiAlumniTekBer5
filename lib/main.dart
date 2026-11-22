import 'package:material_ui/material_ui.dart';
import 'models/alumni_account_summary.dart';
import 'models/alumni_personal_info.dart';
import 'screens/alumni_account_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const KoneksiAlumniApp());
}

class KoneksiAlumniApp extends StatelessWidget {
  const KoneksiAlumniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KonekSI Alumni',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const AlumniAccountScreen(
        account: AlumniAccountSummary.sample,
        personalInfo: AlumniPersonalInfo.sample,
      ),
    );
  }
}