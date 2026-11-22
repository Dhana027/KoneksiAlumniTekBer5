import 'package:flutter/material.dart';

import '../shared/app_widgets.dart';

class RegisterCredentialsPage extends StatefulWidget {
  const RegisterCredentialsPage({super.key});
  @override
  State<RegisterCredentialsPage> createState() =>
      _RegisterCredentialsPageState();
}

class _RegisterCredentialsPageState extends State<RegisterCredentialsPage> {
  bool accepted = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      title: const Text('Keamanan akun'),
    ),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(22, 10, 22, 28),
      children: [
        const Text(
          'LANGKAH 3 DARI 3',
          style: TextStyle(
            fontSize: 11,
            color: teal,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Amankan akunmu',
          style: TextStyle(
            fontSize: 28,
            color: ink,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Tambahkan email dan kata sandi untuk menyelesaikan pendaftaran.',
          style: TextStyle(color: muted),
        ),
        const SizedBox(height: 24),
        const LabeledField(
          label: 'Alamat email',
          hint: 'nama@email.com',
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        const LabeledField(
          label: 'Kata sandi',
          hint: 'Buat kata sandi',
          obscureText: true,
        ),
        const SizedBox(height: 16),
        const LabeledField(
          label: 'Konfirmasi kata sandi',
          hint: 'Ulangi kata sandi',
          obscureText: true,
        ),
        const SizedBox(height: 12),
        CheckboxListTile(
          value: accepted,
          onChanged: (value) => setState(() => accepted = value ?? false),
          contentPadding: EdgeInsets.zero,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text(
            'Saya menyetujui syarat penggunaan dan kebijakan privasi.',
            style: TextStyle(color: muted, fontSize: 13),
          ),
        ),
        const SizedBox(height: 10),
        PrimaryButton(
          label: 'Buat akun & kirim kode',
          icon: Icons.mark_email_read_outlined,
          onPressed: () async {
            if (!accepted) {
              AppFeedback.show(
                context,
                'Setujui syarat penggunaan untuk melanjutkan.',
                error: true,
              );
              return;
            }
            await AppFeedback.dialog(
              context,
              title: 'Periksa emailmu',
              message: 'Kode verifikasi dikirim untuk menyelesaikan pendaftaran akun.',
              action: 'Ke halaman masuk',
              icon: Icons.mark_email_read_outlined,
            );
            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            }
          },
        ),
      ],
    ),
  );
}
