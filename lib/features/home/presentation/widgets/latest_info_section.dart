import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';

class LatestInfoSection extends StatelessWidget {
  const LatestInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Info Layanan Terbaru',
          style: TextStyle(
            color: AppColors.brandPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            height: 32 / 24,
          ),
        ),
        const SizedBox(height: 16),
        _buildInfoCard(
          imageUrl: 'https://via.placeholder.com/350x200',
          title: 'Jadwal Penyaluran Bansos PKH Februari 2026 Telah Dibuka',
          description:
              'Pemerintah mengumumkan jadwal pencairan bantuan Program Keluarga Harapan (PKH) periode Februari 2026. Total 10 juta keluarga penerima da...',
          category: 'Bantuan Sosial',
          date: '13 Feb 2026',
        ),
        const SizedBox(height: 16),
        Center(
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Lihat semua',
              style: TextStyle(
                color: AppColors.contentSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required String imageUrl,
    required String title,
    required String description,
    required String category,
    required String date,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.strokePrimary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with arrow button
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  imageUrl,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 160,
                      color: AppColors.backgroundSecondary,
                      child: const Center(
                        child: Icon(
                          Icons.image,
                          size: 48,
                          color: AppColors.contentSecondary,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_outward,
                    size: 20,
                    color: AppColors.brandPrimary,
                  ),
                ),
              ),
            ],
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.brandPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.contentSecondary,
                    fontSize: 13,
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.guide100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        category,
                        style: const TextStyle(
                          color: AppColors.guide600,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.calendar_today_outlined,
                          size: 14,
                          color: AppColors.contentSecondary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          date,
                          style: const TextStyle(
                            color: AppColors.contentSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
