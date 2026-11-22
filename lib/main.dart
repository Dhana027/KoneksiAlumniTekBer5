import 'package:flutter/material.dart';

import 'landing_page.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'KonekSI Alumni',
      theme: AppTheme.light,
      home: const LandingPage(),
      routes: {
        // Rute sementara untuk membuka screen Akun Alumni.
        // Nanti diganti data dari Supabase setelah login.
        '/akun-alumni': (context) => const AlumniAccountScreen(
              account: AlumniAccountSummary.sample,
              personalInfo: AlumniPersonalInfo.sample,
            ),
      },
    );
  }
}