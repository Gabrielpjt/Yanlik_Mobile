# Codemagic Integration Info

Repository ini menggunakan **Codemagic** untuk iOS builds, bukan GitHub Actions.

## Mengapa Codemagic?

- GitHub Actions **tidak menyediakan macOS runners gratis** untuk public repos
- Codemagic memberikan 500 build minutes gratis/bulan dengan macOS support
- Setup lebih mudah untuk Flutter + iOS

## Build Status

Lihat build status di: https://codemagic.io/apps

## Workflow Files

- `codemagic.yaml` - Di root project
- Konfigurasi: `ios-workflow`, `android-workflow`, `ios-debug-workflow`

## Manual Build Trigger

1. Login ke Codemagic dashboard
2. Pilih app: portal-layanan-publik-mobile
3. Klik "Start new build"
4. Pilih workflow dan branch
5. Klik "Start build"

## Auto Triggers

Build otomatis jalan saat:
- Push ke branch `main`
- Pull request dibuat/update
- Tag baru dibuat

## Download Artifacts

1. Buka build yang sudah selesai
2. Tab "Artifacts"
3. Download `.ipa` (iOS) atau `.aab` (Android)

---

Jika ingin migrasi ke GitHub Actions (requires paid macOS runners), lihat:
https://docs.github.com/en/actions/using-github-hosted-runners/about-github-hosted-runners
