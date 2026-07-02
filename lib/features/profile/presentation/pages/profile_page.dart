import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/app_header.dart';
import '../../../../shared/widgets/app_footer.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_benefit_section.dart';
import '../widgets/profile_detail_akun_tab.dart';
import '../widgets/profile_e_dokumen_tab.dart';
import '../widgets/profile_status_tab.dart';
import '../../../../shared/widgets/breadcrumb_widget.dart';
import '../widgets/profile_settings_tab.dart';
import '../../../benefit/presentation/pages/benefit_page.dart';
import '../../../benefit/presentation/pages/benefit_detail_page.dart';

class ProfilePage extends StatefulWidget {
  final VoidCallback? onLogout;
  final VoidCallback? onMenuTap;
  final VoidCallback? onBerandaTap;
  final int initialTabIndex;

  const ProfilePage({
    super.key,
    this.onLogout,
    this.onMenuTap,
    this.onBerandaTap,
    this.initialTabIndex = 0,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: widget.initialTabIndex,
    );
  }

  @override
  void didUpdateWidget(ProfilePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Lompat ke tab yang diminta saat parent mengubah initialTabIndex
    if (oldWidget.initialTabIndex != widget.initialTabIndex) {
      _tabController.animateTo(widget.initialTabIndex);
    }
  }

  void _openBenefitPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BenefitPage(
            isLoggedIn: true,
            onBerandaTap: widget.onBerandaTap,
            onKeluarAkunTap: widget.onLogout,
          );
        },
      ),
    );
  }

  void _openBenefitDetail(String benefitName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return BenefitDetailPage(
            benefitTitle: benefitName,
            isLoggedIn: true,
            onBerandaTap: widget.onBerandaTap,
            onKeluarAkunTap: widget.onLogout,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundSecondary,
      body: Column(
        children: [
          // ── 1. Header sama seperti halaman lain ──
          AppHeader(
            onMenuTap: widget.onMenuTap,
            isLoggedIn: true,
            showLoginButton: false,
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // ── 2. Breadcrumb ──
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: BreadcrumbWidget(
                    items: [
                      BreadcrumbItem(
                        label: 'Beranda',
                        onTap: widget.onBerandaTap,
                      ),
                      const BreadcrumbItem(label: 'Akun Saya'),
                    ],
                  ),
                ),

                // ── 3. Profile Info Card ──
                const ProfileInfoCard(
                  name: 'Ahmad Andrawan',
                  joinDate: 'Bergabung sejak April 2025',
                  avatarUrl:
                  'https://randomuser.me/api/portraits/men/43.jpg',
                ),

                const SizedBox(height: 8),

                // ── 4. Benefit Section ──
                ProfileBenefitSection(
                  benefits: const [
                    'Program Keluarga Harapan',
                    'Subsidi LPG',
                    'BPJS PBI',
                    'Bantuan Pangan Non Tunai',
                  ],
                  totalBenefitsLabel: '6 benefit',
                  onSeeAllTap: _openBenefitPage,
                  onBenefitTap: _openBenefitDetail,
                ),

                const SizedBox(height: 8),

                // ── 5. Tab Bar & Content ──
                _buildTabSection(),

                // ── 6. App Footer ──
                const AppFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Tab Section ──
  Widget _buildTabSection() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.zero,
            labelPadding: const EdgeInsets.only(left: 16, right: 16),
            labelColor: AppColors.guide600,
            unselectedLabelColor: AppColors.contentSecondary,
            indicatorColor: AppColors.guide600,
            indicatorWeight: 2.5,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
            tabs: const [
              Tab(
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text('Detail Akun'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.folder_shared_outlined,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text('E-Dokumen'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.workspace_premium_outlined,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text('Status'),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 18,
                    ),
                    SizedBox(width: 6),
                    Text('Pengaturan'),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        AnimatedBuilder(
          animation: _tabController,
          builder: (context, _) {
            switch (_tabController.index) {
              case 1:
                return const ProfileEDokumenTab();

              case 2:
                return ProfileStatusTab(
                  onMenuTap: widget.onMenuTap,
                );

              case 3:
                return const ProfileSettingsTab();

              default:
                return ProfileDetailAkunTab(
                  onLogout: widget.onLogout,
                );
            }
          },
        ),
      ],
    );
  }
}