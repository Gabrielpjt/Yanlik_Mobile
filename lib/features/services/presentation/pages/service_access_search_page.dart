import 'package:flutter/material.dart';

import '../../../../shared/widgets/app_footer.dart';
import '../../../../shared/widgets/app_header.dart';
import '../widgets/service_access_search_content.dart';

class ServiceAccessSearchPage extends StatelessWidget {
  final String serviceTitle;
  final bool isLoggedIn;
  final VoidCallback? onMenuTap;
  final VoidCallback? onLoginTap;

  const ServiceAccessSearchPage({
    super.key,
    required this.serviceTitle,
    this.isLoggedIn = false,
    this.onMenuTap,
    this.onLoginTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppHeader(
            isLoggedIn: isLoggedIn,
            onMenuTap: onMenuTap,
            onLoginTap: onLoginTap,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ServiceAccessSearchContent(
                    serviceTitle: serviceTitle,
                    onItemTap: (item) {
                      // UI statis dulu. Nanti bisa diarahkan ke halaman detail
                      // atau membuka data dari API sesuai kebutuhan.
                    },
                  ),
                  const SizedBox(height: 24),
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
