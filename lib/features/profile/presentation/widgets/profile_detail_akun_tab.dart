import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/biometric_authentication_view.dart';

class ProfileDetailAkunTab extends StatefulWidget {
  final VoidCallback? onLogout;

  const ProfileDetailAkunTab({
    super.key,
    this.onLogout,
  });

  @override
  State<ProfileDetailAkunTab> createState() => _ProfileDetailAkunTabState();
}

class _ProfileDetailAkunTabState extends State<ProfileDetailAkunTab> {
  bool _dataTerbuka = false;

  Future<void> _handleSensitiveDataTap() async {
    if (_dataTerbuka) {
      setState(() {
        _dataTerbuka = false;
      });

      return;
    }

    final isAuthenticated =
    await Navigator.of(context).push<bool>(
      MaterialPageRoute(
        builder: (_) =>
        const BiometricAuthenticationView(
          title: 'Autentikasi Diperlukan',
          description:
          'Gunakan kunci biometrik untuk membuka data sensitif.',
          instruction:
          'Tempatkan wajah di depan kamera',
          buttonLabel: 'Mulai scan wajah',
        ),
      ),
    );

    if (!mounted || isAuthenticated != true) {
      return;
    }

    setState(() {
      _dataTerbuka = true;
    });
  }

  String _masked(String value) {
    if (value.contains('@')) {
      final parts = value.split('@');
      if (parts[0].length > 3) {
        return '${parts[0].substring(0, 3)}${'•' * (parts[0].length - 3)}@${parts[1]}';
      }
      return '•••@${parts[1]}';
    }
    if (value.startsWith('+')) {
      if (value.length > 8) {
        return '${value.substring(0, 4)} ${'•' * (value.length - 8)} ${value.substring(value.length - 4)}';
      }
    }
    if (value.length > 8) {
      return '${value.substring(0, 4)}${'•' * (value.length - 8)}${value.substring(value.length - 4)}';
    }
    return '•' * value.length;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSensitiveDataNotice(),

          const SizedBox(height: 12),

          // ── Heading: Informasi Umum ──
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Informasi Umum',
              style: TextStyle(
                color: AppColors.brandPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildInfoItem('Nomor Kartu Keluarga', '53080428061200811112',
              isSensitive: true, isVerified: true),
          _buildInfoItem('Nomor Induk Kependudukan', '53080428061200811112',
              isSensitive: true, isVerified: true),
          _buildInfoItem('Nama Depan', 'Zara Lestari Hertianti'),
          _buildInfoItem('Jenis Kelamin', 'Perempuan'),
          _buildInfoItem('Tanggal Lahir', '28 Juni 2008'),
          _buildInfoItem('Tempat Lahir', 'Kota Bandung'),
          _buildInfoItem('Golongan Darah', 'B'),
          _buildInfoItem('Agama', 'Islam'),
          _buildInfoItem('Status', 'Belum Kawin'),
          _buildInfoItem('Pekerjaan', 'Karyawan Swasta'),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: AppColors.strokePrimary, thickness: 1),
          ),

          // ── Heading: Informasi Kontak ──
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Informasi Kontak',
              style: TextStyle(
                color: AppColors.brandPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildInfoItem('Email', 'zara.lestari@gmail.com',
              isSensitive: true, isVerified: true),
          _buildInfoItem('Nomor Handphone', '+62 8210 0022 2233',
              isSensitive: true, isVerified: true),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: AppColors.strokePrimary, thickness: 1),
          ),

          // ── Heading: Alamat ──
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Alamat',
              style: TextStyle(
                color: AppColors.brandPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildInfoItem('Provinsi', 'Jawa Barat'),
          _buildInfoItem('Kota/Kabupaten', 'Kota Bandung'),
          _buildInfoItem('Kecamatan', 'Cibeunying Kidul'),
          _buildInfoItem('Kelurahan', 'Padasuka'),
          _buildInfoItem('Alamat Lengkap', 'Jl. Cikutra, Gang. Pengayom No. 24',
              isSensitive: true),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: AppColors.strokePrimary, thickness: 1),
          ),

          // ── Heading: Pendidikan ──
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Pendidikan',
              style: TextStyle(
                color: AppColors.brandPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildPendidikanItem(
            school: 'Universitas Pendidikan Indonesia',
            degree: 'Sarjana Sains Terapan, Teknologi Sistem Komputer',
            gpa: 'IPK: 3,60',
            periodAndLocation: 'Jun 2016 - Sep 2020 | Kota Bandung',
          ),
          _buildPendidikanItem(
            school: 'Universitas Pendidikan Indonesia',
            degree: 'Magister Bisnis, Teknologi Sistem Komputer',
            gpa: 'IPK: 3,60',
            periodAndLocation: 'Jun 2016 - Sep 2020 | Kota Bandung',
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(color: AppColors.strokePrimary, thickness: 1),
          ),

          // ── Heading: Pekerjaan ──
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Pekerjaan',
              style: TextStyle(
                color: AppColors.brandPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _buildPekerjaanItem(
            position: 'Business Analyst',
            company: 'PT. Adi Karya Semesta',
            periodAndLocation: 'Jun 2016 - Sep 2020 | Kota Bandung',
          ),
          _buildPekerjaanItem(
            position: 'Project Manager',
            company: 'PT. Karya Nusantara Adidaya',
            periodAndLocation: 'Jun 2016 - Sep 2020 | Kota Bandung',
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: AppColors.strokePrimary, thickness: 1),
          ),

          // ── Logout button ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: GestureDetector(
              onTap: () => _showLogoutDialog(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red.shade100),
                ),
                child: Row(
                  children: [
                    Icon(Icons.logout_rounded,
                        size: 18, color: Colors.red.shade600),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Keluar dari Akun',
                        style: TextStyle(
                          color: Colors.red.shade600,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(Icons.chevron_right_rounded,
                        color: Colors.red.shade300, size: 18),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSensitiveDataNotice() {
    final backgroundColor = _dataTerbuka
        ? const Color(0xFFF0FDF4)
        : const Color(0xFFFFFBEB);

    final borderColor = _dataTerbuka
        ? const Color(0xFF16A34A)
        : const Color(0xFFD97706);

    final iconColor = _dataTerbuka
        ? const Color(0xFF15803D)
        : const Color(0xFF92400E);

    final title = _dataTerbuka
        ? 'Semua data sensitif sedang ditampilkan'
        : 'Beberapa data sensitif disembunyikan untuk keamanan';

    final description = _dataTerbuka
        ? 'Pastikan menutup data Anda kembali setelah selesai.'
        : 'Data seperti NIK, Nomor Kartu Keluarga, Email, No. Telepon, dan Alamat detail telah di-masking untuk melindungi privasi Anda.';

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info,
                color: iconColor,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color:
                    AppColors.contentPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Padding(
            padding:
            const EdgeInsets.only(left: 26),
            child: Text(
              description,
              style: const TextStyle(
                color:
                AppColors.contentSecondary,
                fontSize: 11.5,
                height: 1.5,
              ),
            ),
          ),

          const SizedBox(height: 12),

          Padding(
            padding:
            const EdgeInsets.only(left: 26),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap:
                _handleSensitiveDataTap,
                borderRadius:
                BorderRadius.circular(6),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.circular(6),
                    border: Border.all(
                      color: const Color(
                        0xFFE2E8F0,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisSize:
                    MainAxisSize.min,
                    children: [
                      Icon(
                        _dataTerbuka
                            ? Icons
                            .visibility_off_outlined
                            : Icons
                            .visibility_outlined,
                        color: AppColors
                            .brandPrimary,
                        size: 16,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        _dataTerbuka
                            ? 'Tutup data'
                            : 'Buka data',
                        style: const TextStyle(
                          color: AppColors
                              .brandPrimary,
                          fontSize: 12,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    String label,
    String value, {
    bool isSensitive = false,
    bool isVerified = false,
  }) {
    final displayValue = isSensitive && !_dataTerbuka ? _masked(value) : value;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.contentSecondary,
              fontSize: 12.5,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Flexible(
                child: Text(
                  displayValue,
                  style: const TextStyle(
                    color: AppColors.contentPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (isVerified) ...[
                const SizedBox(width: 6),
                const Icon(
                  Icons.verified,
                  color: AppColors.guide600,
                  size: 16,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPendidikanItem({
    required String school,
    required String degree,
    required String gpa,
    required String periodAndLocation,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            school,
            style: const TextStyle(
              color: AppColors.contentPrimary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            degree,
            style: const TextStyle(
              color: AppColors.contentSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            gpa,
            style: const TextStyle(
              color: AppColors.contentSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            periodAndLocation,
            style: const TextStyle(
              color: AppColors.contentSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPekerjaanItem({
    required String position,
    required String company,
    required String periodAndLocation,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            position,
            style: const TextStyle(
              color: AppColors.contentPrimary,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            company,
            style: const TextStyle(
              color: AppColors.contentSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            periodAndLocation,
            style: const TextStyle(
              color: AppColors.contentSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Keluar dari Akun',
          style: TextStyle(
            color: AppColors.contentPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        content: const Text(
          'Apakah Anda yakin ingin keluar dari akun IKD?',
          style: TextStyle(color: AppColors.contentSecondary, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal',
                style: TextStyle(color: AppColors.contentSecondary)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              widget.onLogout?.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              elevation: 0,
            ),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }
}
