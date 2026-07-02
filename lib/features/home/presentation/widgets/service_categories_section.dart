import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import 'service_grid_item.dart';

class ServiceCategoriesSection extends StatelessWidget {
  const ServiceCategoriesSection({super.key});

  static const List<List<String>> _categories = [
    ['Kependudukan', '2 Layanan'],
    ['Kesehatan & Gizi', '4 layanan'],
    ['Pendidikan', '1 layanan'],
    ['Ketenagakerjaan', '1 layanan'],
    ['Bantuan Sosial', '3 layanan'],
    ['Perizinan', '2 layanan'],
    ['Keagamaan', '1 layanan'],
    ['Pemerintahan', '2 layanan'],
    ['Kedaruratan', '1 layanan'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Jelajahi Layanan',
          style: TextStyle(
            color: AppColors.brandPrimary,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            height: 32 / 24,
          ),
        ),
        const SizedBox(height: 20),

        _buildCategoriesList(context),

        const SizedBox(height: 20),

        Center(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 12,
              ),
            ),
            child: const Text(
              'Lihat semua',
              style: TextStyle(
                color: AppColors.contentSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoriesList(BuildContext context) {
    final rows = <List<List<String>>>[];

    for (int i = 0; i < _categories.length; i += 2) {
      rows.add([
        _categories[i],
        if (i + 1 < _categories.length) _categories[i + 1],
      ]);
    }

    return Column(
      children: rows.map((row) {
        final leftItem = row[0];

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ServiceListItem(
                  title: leftItem[0],
                  subtitle: leftItem[1],
                  onTap: () {},
                ),
              ),

              const SizedBox(width: 24),

              Expanded(
                child: row.length > 1
                    ? ServiceListItem(
                  title: row[1][0],
                  subtitle: row[1][1],
                  onTap: () {},
                )
                    : const SizedBox(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}