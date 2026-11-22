import 'package:flutter/material.dart';

import '../shared/app_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _signIn() {
    if (_email.text.trim().isEmpty || _password.text.isEmpty) {
      AppFeedback.show(
        context,
        'Masukkan email dan kata sandi terlebih dahulu.',
        error: true,
      );
      return;
    }
    Navigator.pushNamedAndRemoveUntil(context, '/dashboard', (route) => false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: const BrandMark(compact: true),
    ),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 24, 22, 28),
        children: [
          const Text(
            'KONEKSI ALUMNI',
            style: TextStyle(
              color: teal,
              fontSize: 11,
              letterSpacing: 1.3,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 17),
          const Text(
            'Selamat datang\nkembali.',
            style: TextStyle(
              fontSize: 32,
              height: 1.15,
              fontWeight: FontWeight.w800,
              color: ink,
            ),
          ),
          const SizedBox(height: 9),
          const Text(
            'Masuk untuk melanjutkan koneksi dan peluangmu.',
            style: TextStyle(color: muted),
          ),
          const SizedBox(height: 30),
          LabeledField(
            label: 'Alamat email',
            hint: 'nama@email.com',
            controller: _email,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 17),
          LabeledField(
            label: 'Kata sandi',
            hint: 'Masukkan kata sandi',
            controller: _password,
            obscureText: true,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => AppFeedback.dialog(
                context,
                title: 'Lupa kata sandi?',
                message: 'Hubungi pengelola KonekSI untuk mendapatkan tautan pemulihan akun.',
                icon: Icons.lock_reset_rounded,
              ),
              child: const Text('Lupa kata sandi?'),
            ),
          ),
          const SizedBox(height: 10),
          PrimaryButton(label: 'Masuk', onPressed: _signIn),
          const SizedBox(height: 22),
          const Row(
            children: [
              Expanded(child: Divider()),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  'atau lanjut dengan',
                  style: TextStyle(color: muted, fontSize: 12),
                ),
              ),
              Expanded(child: Divider()),
            ],
          ),
          const SizedBox(height: 14),
          PrimaryButton(
            label: 'Google',
            icon: Icons.g_mobiledata_rounded,
            filled: false,
            onPressed: () => AppFeedback.show(
              context,
              'Masuk dengan Google belum dikonfigurasi.',
            ),
          ),
          const SizedBox(height: 10),
          PrimaryButton(
            label: 'LinkedIn',
            icon: Icons.work_outline_rounded,
            filled: false,
            onPressed: () => AppFeedback.show(
              context,
              'Masuk dengan LinkedIn belum dikonfigurasi.',
            ),
          ),
          const SizedBox(height: 18),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                const Text('Belum punya akun? '),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/register-role'),
                  child: const Text('Daftar'),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
