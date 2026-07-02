import 'package:flutter/material.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../shared/widgets/app_header.dart';
import '../../../../shared/widgets/app_pagination.dart';
import '../../../../shared/widgets/filter_sort_row.dart';
import '../widgets/services_header.dart';
import '../widgets/service_category_list.dart';
import '../../../../shared/widgets/app_footer.dart';
import 'service_detail_page.dart';

class ServicesPage extends StatefulWidget {
  final VoidCallback? onMenuTap;
  final VoidCallback? onLoginTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onProfileTap;
  final bool isLoggedIn;

  const ServicesPage({
    super.key,
    this.onMenuTap,
    this.onLoginTap,
    this.onServicesTap,
    this.onProfileTap,
    this.isLoggedIn = false,
  });

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int _currentPage = 1;
  final int _totalPages = 4;
  String _selectedSort = 'Terbaru';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppHeader(
            onMenuTap: widget.onMenuTap,
            onLoginTap: widget.onLoginTap,
            isLoggedIn: widget.isLoggedIn,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ServicesHeader(),
                  const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.strokePrimary),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: FilterSortRow(
                      sortLabel: _selectedSort,
                      onSortTap: () {
                        setState(() {
                          _selectedSort =
                          _selectedSort == 'Terbaru' ? 'Terlama' : 'Terbaru';
                        });
                      },
                    ),
                  ),
                  const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.strokePrimary),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    child: ServiceCategoryList(
                      onServiceTap: (serviceTitle) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ServiceDetailPage(
                              serviceTitle: serviceTitle,
                              isLoggedIn: widget.isLoggedIn,
                              onMenuTap: widget.onMenuTap,
                              onLoginTap: widget.onLoginTap,
                              onServicesTap: widget.onServicesTap,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                    child: AppPagination(
                      currentPage: _currentPage,
                      totalPages: _totalPages,
                      onPageChanged: (page) {
                        setState(() => _currentPage = page);
                      },
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
}
