import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../core/widgets/inputs/custom_text_field.dart';
import '../../../../shared/widgets/breadcrumb_widget.dart';
import '../widgets/divider_with_label.dart';
import '../widgets/form_field_label.dart';
import '../widgets/garuda_emblem.dart';
import '../widgets/store_button.dart';
import '../../../../shared/widgets/app_header.dart';
import '../../../main_navigation_page.dart';
import '../../../../shared/widgets/app_footer.dart';


class LoginPage extends StatefulWidget {
  /// Dipanggil saat login berhasil (jika dipakai dalam IndexedStack).
  /// Jika null, akan melakukan Navigator.pushAndRemoveUntil ke MainNavigationPage.
  final VoidCallback? onLoginSuccess;

  /// Dipanggil saat breadcrumb "Beranda" ditekan (jika dipakai dalam IndexedStack).
  /// Jika null, akan melakukan Navigator.pop().
  final VoidCallback? onNavigateHome;

  final VoidCallback? onMenuTap;

  const LoginPage({
    super.key,
    this.onLoginSuccess,
    this.onNavigateHome,
    this.onMenuTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _nikController = TextEditingController();
  final _pinController = TextEditingController();
  bool _obscurePin = true;

  @override
  void dispose() {
    _nikController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          AppHeader(
            onMenuTap: widget.onMenuTap,
            showLoginButton: false,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Breadcrumb ──────────────────────────────────────
                  BreadcrumbWidget(
                    items: [
                      BreadcrumbItem(
                        label: 'Beranda',
                        onTap: () {
                          if (widget.onNavigateHome != null) {
                            widget.onNavigateHome!();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                      const BreadcrumbItem(label: 'Masuk Akun'),
                    ],
                  ),

                  // ── Garuda Emblem ───────────────────────────────────
                  const SizedBox(height: 8),
                  const Center(child: GarudaEmblem()),

                  const SizedBox(height: 16),

                  // ── Title ───────────────────────────────────────────
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Masuk ke akun Anda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.brandPrimary,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),

                  // ── Subtitle ────────────────────────────────────────
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      'Gunakan akun Identitas Kependudukan Digital Anda '
                      'untuk akses cepat dan aman.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.contentSecondary,
                        fontSize: 13.5,
                        height: 1.5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // ── Form ────────────────────────────────────────────
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // NIK
                        const FormFieldLabel(
                          label: 'Nomor Induk Kependudukan',
                          isRequired: true,
                        ),
                        const SizedBox(height: 6),
                        CustomTextField(
                          controller: _nikController,
                          hintText:
                              'Masukkan 16 digit nomor induk kependudukan',
                          keyboardType: TextInputType.number,
                          maxLength: 16,
                        ),

                        const SizedBox(height: 16),

                        // PIN IKD
                        const FormFieldLabel(
                          label: 'PIN IKD',
                          isRequired: true,
                        ),
                        const SizedBox(height: 6),
                        CustomTextField(
                          controller: _pinController,
                          hintText: 'Masukkan 6 digit PIN IKD',
                          keyboardType: TextInputType.number,
                          maxLength: 6,
                          obscureText: _obscurePin,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePin
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.contentSecondary,
                              size: 20,
                            ),
                            onPressed: () =>
                                setState(() => _obscurePin = !_obscurePin),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // ── Login Button ──────────────────────────────
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (widget.onLoginSuccess != null) {
                                // Dipakai dalam IndexedStack: cukup panggil callback
                                widget.onLoginSuccess!();
                              } else {
                                // Standalone: navigasi ke MainNavigationPage
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (_) => const MainNavigationPage(),
                                  ),
                                  (route) => false,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.brandPrimary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Masuk ke akun IKD',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // ── Terms & Conditions ────────────────────────
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: const TextStyle(
                                color: AppColors.contentSecondary,
                                fontSize: 13,
                                height: 1.5,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'Dengan masuk ke akun IKD, Anda '
                                      'telah menyetujui ',
                                ),
                                TextSpan(
                                  text: 'Syarat dan Ketentuan',
                                  style: const TextStyle(
                                    color: AppColors.brandPrimary,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                const TextSpan(text: ' kami.'),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 28),

                        // ── Section Divider ───────────────────────────
                        const DividerWithLabel(
                          label: 'Dapatkan aplikasi IKD melalui',
                        ),

                        const SizedBox(height: 16),

                        // ── Store Buttons ─────────────────────────────
                        StoreButton(
                          type: StoreType.googlePlay,
                          onTap: () {},
                        ),
                        const SizedBox(height: 10),
                        StoreButton(
                          type: StoreType.appleStore,
                          onTap: () {},
                        ),
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
}
