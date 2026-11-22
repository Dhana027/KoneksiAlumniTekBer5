import 'package:flutter/material.dart';

import '../models/alumni.dart';

const _utama = Color(0xFF087D95);
const _teks = Color(0xFF1E293B);
const _sekunder = Color(0xFF657786);
const _garis = Color(0xFFE6EDF2);
const _lembut = Color(0xFFEAF4F7);

class DirektoriAlumniScreen extends StatefulWidget {
  const DirektoriAlumniScreen({super.key});

  @override
  State<DirektoriAlumniScreen> createState() =>
      _DirektoriAlumniScreenState();
}

class _DirektoriAlumniScreenState
    extends State<DirektoriAlumniScreen> {
  final _pencarian = TextEditingController();

  void _hapusPencarian() {
    setState(() => _pencarian.clear());
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void dispose() {
    _pencarian.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final kataKunci = _pencarian.text.trim();

    final hasil = contohAlumni
        .where((alumni) => alumni.sesuaiPencarian(kataKunci))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text('KonekSI Alumni'),
        foregroundColor: _utama,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: ListView(
              padding: const EdgeInsets.all(20),
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
              children: [
                const Text(
                  'Direktori Alumni',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: _teks,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Temukan alumni Sistem Informasi ITS dan kenali '
                  'latar belakang profesionalnya.',
                  style: TextStyle(
                    color: _sekunder,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),

                // Pencarian langsung pada daftar alumni.
                TextField(
                  controller: _pencarian,
                  onChanged: (_) => setState(() {}),
                  onSubmitted: (_) =>
                      FocusScope.of(context).unfocus(),
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText:
                        'Cari nama, perusahaan, posisi, keahlian',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: _utama,
                    ),
                    suffixIcon: _pencarian.text.isEmpty
                        ? null
                        : IconButton(
                            tooltip: 'Hapus pencarian',
                            onPressed: _hapusPencarian,
                            icon: const Icon(Icons.close),
                          ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: _garis),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: _garis),
                    ),
                  ),
                ),

                // Filter belum diaktifkan pada progres ini.
                const Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: null,
                    child: Text('Filter'),
                  ),
                ),
                const SizedBox(height: 8),

                Semantics(
                  liveRegion: true,
                  child: Text(
                    '${hasil.length} alumni'
                    '${kataKunci.isEmpty ? '' : ' ditemukan'}',
                    style: const TextStyle(
                      color: _sekunder,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 14),

                // Kondisi ketika pencarian tidak menemukan alumni.
                if (hasil.isEmpty)
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 32),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.search_off,
                          size: 48,
                          color: _utama,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Alumni belum ditemukan',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tidak ada hasil untuk “$kataKunci”. '
                          'Coba kata kunci lainnya.',
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(color: _sekunder),
                        ),
                        TextButton(
                          onPressed: _hapusPencarian,
                          child: const Text('Hapus pencarian'),
                        ),
                      ],
                    ),
                  ),

                for (final alumni in hasil)
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 14),
                    child: _KartuAlumni(alumni: alumni),
                  ),

                if (hasil.isNotEmpty)
                  const Text(
                    'Seluruh hasil telah ditampilkan.',
                    style: TextStyle(
                      fontSize: 12,
                      color: _sekunder,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _KartuAlumni extends StatelessWidget {
  const _KartuAlumni({required this.alumni});

  final Alumni alumni;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: _garis),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: _lembut,
                foregroundColor: _utama,
                child: Text(alumni.inisial),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      alumni.nama,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: _teks,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${alumni.posisi} · ${alumni.perusahaan}',
                      style: const TextStyle(color: _utama),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Alumni · Angkatan ${alumni.angkatan}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: _sekunder,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            alumni.keahlian.join(' · '),
            style: const TextStyle(
              fontSize: 12,
              color: _sekunder,
            ),
          ),

          // Detail profil belum diaktifkan pada progres ini.
          const TextButton(
            onPressed: null,
            child: Text('Lihat profil'),
          ),
        ],
      ),
    );
  }
}