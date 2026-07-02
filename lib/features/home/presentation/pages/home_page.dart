import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/app_header.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/popular_topics_section.dart';
import '../widgets/service_categories_section.dart';
import '../widgets/latest_info_section.dart';
import '../widgets/home_benefit_section.dart';
import '../../../../shared/widgets/app_footer.dart';
import '../../../benefit/presentation/pages/benefit_page.dart';
import '../../../services/presentation/pages/service_detail_page.dart';
import '../widgets/service_grid_item.dart';
import '../../../benefit/presentation/pages/benefit_detail_page.dart';
import '../../../profile/presentation/pages/document_detail_page.dart';

class HomePage extends StatelessWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onLoginTap;
  final bool isLoggedIn;
  final VoidCallback? onServicesTap;
  final VoidCallback? onEdokumenTap;
  final VoidCallback? onAkunSayaTap;
  final VoidCallback? onKeluarAkunTap;

  const HomePage({
    super.key,
    this.onMenuTap,
    this.onLoginTap,
    this.onServicesTap,
    this.onEdokumenTap,
    this.onAkunSayaTap,
    this.onKeluarAkunTap,
    this.isLoggedIn = false,
  });

  // Data layanan populer
  static const _popularServices = [
    'Pengurusan Akta Kelahiran',
    'Mengecek Bantuan Sosial',
    'Pencarian Layanan Keseha...',
    'Pengecekan Produk BPOM',
    'Bantuan Pendidikan',
    'Asuransi Kerja',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppHeader(
            onMenuTap: onMenuTap,
            onLoginTap: onLoginTap,
            isLoggedIn: isLoggedIn,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 16),
                        const SearchBarWidget(),
                        const SizedBox(height: 24),

                        // ── Benefit & E-Dokumen (saat login) ─────────────
                        if (isLoggedIn) ...[
                          HomeBenefitSection(
                            onBenefitTap: (benefitName) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return BenefitDetailPage(
                                      benefitTitle: benefitName,
                                      isLoggedIn: isLoggedIn,
                                      onLoginTap: onLoginTap,
                                      onBerandaTap: () {},
                                      onAkunSayaTap: onAkunSayaTap,
                                      onKeluarAkunTap: onKeluarAkunTap,
                                    );
                                  },
                                ),
                              );
                            },

                            onDocumentTap: (
                                documentName,
                                category,
                                number,
                                verified,
                                ) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) {
                                    return DocumentDetailPage(
                                      onMenuTap: onMenuTap,
                                      document: DocumentData(
                                        title: documentName,
                                        validUntil: '31 Des 2026',
                                        isVerified: verified,
                                        ownerName: 'Ayu Lestari',
                                        ownerRole: 'Kepala keluarga',
                                        documentNumber: number,
                                        issueDate: '12 Jan 2026',
                                        issuedBy: 'Dinas Kependudukan dan Pencatatan Sipil',
                                      ),
                                    );
                                  },
                                ),
                              );
                            },

                            onLihatSemuaBenefit: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => BenefitPage(
                                    isLoggedIn: isLoggedIn,
                                    onLoginTap: onLoginTap,
                                    onBerandaTap: () {},
                                    onAkunSayaTap: onAkunSayaTap,
                                    onKeluarAkunTap: onKeluarAkunTap,
                                  ),
                                ),
                              );
                            },

                            onLihatSemuaDokumen: onEdokumenTap,
                          ),
                          const SizedBox(height: 28),
                        ],

                        // ── Layanan Populer ──────────────────────────────
                        const Text(
                          'Layanan Populer',
                          style: TextStyle(
                            color: AppColors.brandPrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            height: 32 / 24,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Layanan Populer Nasional',
                          style: TextStyle(
                            color: AppColors.contentSecondary,
                            fontSize: 18,
                            height: 24 / 18,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // 2-column list with dividers
                        _buildPopularServicesList(context),

                        const SizedBox(height: 12),

                        // Lihat Semua button — outlined full width
                        _buildLihatSemuaButton(),
                        const SizedBox(height: 32),
                        const PopularTopicsSection(),
                        const SizedBox(height: 32),
                        const ServiceCategoriesSection(),
                        const SizedBox(height: 32),
                        const LatestInfoSection(),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularServicesList(BuildContext context) {
    final rows = <List<String>>[];

    for (int i = 0; i < _popularServices.length; i += 2) {
      rows.add([
        _popularServices[i],
        if (i + 1 < _popularServices.length)
          _popularServices[i + 1],
      ]);
    }

    return Column(
      children: rows.map((row) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ServiceListItem(
                  title: row[0],
                  onTap: () {
                    _openServiceDetail(
                      context,
                      serviceTitle: row[0],
                    );
                  },
                ),
              ),

              const SizedBox(width: 24),

              Expanded(
                child: row.length > 1
                    ? ServiceListItem(
                  title: row[1],
                  onTap: () {
                    _openServiceDetail(
                      context,
                      serviceTitle: row[1],
                    );
                  },
                )
                    : const SizedBox(),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildLihatSemuaButton() {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.strokePrimary, width: 1),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: const Center(
            child: Text(
              'Lihat semua',
              style: TextStyle(
                color: AppColors.brandPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _openServiceDetail(
      BuildContext context, {
        required String serviceTitle,
      }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ServiceDetailPage(
          serviceTitle: serviceTitle,
          isLoggedIn: isLoggedIn,
          onMenuTap: onMenuTap,
          onLoginTap: onLoginTap,
          onServicesTap: onServicesTap,
        ),
      ),
    );
  }
}
