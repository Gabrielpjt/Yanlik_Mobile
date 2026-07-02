import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import 'service_category_card.dart';

class ServiceCategoryList extends StatelessWidget {
  final ValueChanged<String>? onServiceTap;

  ServiceCategoryList({
    super.key,
    this.onServiceTap,
  });

  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Kependudukan',
      'count': '2 Layanan',
      'description': 'Layanan dan Program Nasional',
      'services': [
        {'name': 'Penerbitan Akta Kelahiran', 'type': 'Layanan'},
        {'name': 'Pengurusan Akta Kematian', 'type': 'Layanan'},
      ],
      'isActive': true,
    },
    {
      'title': 'BPJS',
      'count': '3 Layanan',
      'description': 'Layanan dan Program Nasional',
      'services': [
        {'name': 'Informasi Kepesertaan BPJS', 'type': 'Layanan'},
        {'name': 'Pendaftaran Pelayanan BPJS (Antrean)', 'type': 'Layanan'},
        {'name': 'Penambahan Kepesertaan BPJS', 'type': 'Layanan'},
      ],
    },
    {
      'title': 'Bantuan Sosial',
      'count': '3 Layanan',
      'description': 'Layanan dan Program Nasional',
      'services': [
        {'name': 'Mengecek Bantuan Sosial', 'type': 'Layanan'},
        {'name': 'Zakat & Infaq', 'type': 'Layanan'},
      ],
      'programs': [
        {'name': 'Program Rumah Subsidi', 'type': 'Program'},
      ],
    },
    {
      'title': 'Kesehatan & Gizi',
      'count': '5 Layanan',
      'description': 'Layanan dan Program Nasional',
      'services': [
        {'name': 'Cari Fasilitas Kesehatan', 'type': 'Layanan'},
        {'name': 'Cari Dokter', 'type': 'Layanan'},
        {'name': 'Cari Info Obat dan Makanan', 'type': 'Layanan'},
        {'name': 'Pengecekan Produk BPOM', 'type': 'Layanan'},
        {'name': 'Penurunan Stunting', 'type': 'Layanan'},
      ],
    },
    {
      'title': 'Pendidikan',
      'count': '1 Layanan',
      'description': 'Layanan dan Program Nasional',
      'services': [
        {'name': 'Pembiayaan Pendidikan', 'type': 'Layanan'},
      ],
    },
    {
      'title': 'Ketenagakerjaan',
      'count': '1 Layanan',
      'description': 'Layanan dan Program Nasional',
      'services': [
        {'name': 'Asuransi Kerja', 'type': 'Layanan'},
      ],
    },
    {
      'title': 'Perizinan',
      'count': '2 Layanan',
      'description': 'Layanan dan Program Nasional',
      'services': [
        {'name': 'Perizinan Tambang', 'type': 'Layanan'},
        {'name': 'Sertifikasi Halal', 'type': 'Layanan'},
      ],
    },
    {
      'title': 'Pemerintahan',
      'count': '2 Layanan',
      'description': 'Layanan dan Program Nasional',
      'programs': [
        {'name': 'Otorita Ibu kota Nusantara', 'type': 'Program'},
        {'name': 'Ketahanan Pangan', 'type': 'Program'},
      ],
    },
    {
      'title': 'Alam & Budaya',
      'count': '2 Layanan',
      'description': 'Layanan dan Program Nasional',
      'programs': [
        {'name': 'Keanekaragaman Hayati', 'type': 'Program'},
        {'name': 'Keanekaragaman Budaya', 'type': 'Program'},
      ],
    },
    {
      'title': 'Kedaruratan',
      'count': '1 Layanan',
      'description': 'Layanan dan Program Nasional',
      'services': [
        {'name': 'Siaga Bencana', 'type': 'Layanan'},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Scrollable Filter Chips
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildActiveChip('Semua', '9'),
              const SizedBox(width: 8),
              _buildInactiveChip('Kependudukan', '1'),
              const SizedBox(width: 8),
              _buildInactiveChip('Bantuan Sosial', '3'),
              const SizedBox(width: 8),
              _buildInactiveChip('Kesehatan', '4'),
              const SizedBox(width: 8),
              _buildInactiveChip('Pendidikan', '1'),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Info Banner
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.guide100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.guide600.withValues(alpha: 0.2),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.guide600,
                size: 18,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Untuk melihat layanan dari wilayah lainnya, Anda dapat mengubah lokasi wilayah pada bagian header atau melalui filter.',
                  style: TextStyle(
                    color: AppColors.guide600,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        // Category Cards
        ...categories.map(
          (category) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ServiceCategoryCard(
              title: category['title'],
              count: category['count'],
              description: category['description'],
              services: List<Map<String, String>>.from(
                  category['services'] ?? []),
              programs: List<Map<String, String>>.from(
                  category['programs'] ?? []),
              isActive: category['isActive'] ?? false,
              onItemTap: (serviceTitle) {
                onServiceTap?.call(serviceTitle);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActiveChip(String label, String count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.brandPrimary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Text(
              count,
              style: const TextStyle(
                color: AppColors.brandPrimary,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInactiveChip(String label, String count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.strokePrimary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.contentPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          Text(
            count,
            style: const TextStyle(
              color: AppColors.contentSecondary,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
