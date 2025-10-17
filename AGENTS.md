# Repository Guidelines

## Project Structure & Module Organization
- `lib/core` centralizes shared constants, theming, and utilities consumed across features.
- `lib/data` hosts Hive-backed models and services; update adapters here and regenerate code when fields change.
- `lib/presentation` groups Riverpod providers, screens, and widgets; mirror this layout when adding flows.
- `test/` follows the `lib/` tree for unit and widget coverage; keep fixtures alongside the features they exercise.
- Platform folders (`android/`, `ios/`, `linux/`, `macos/`, `windows/`, `web/`) only need changes when adjusting platform-specific integrations.

## Build, Test, and Development Commands
- `flutter pub get` resolves package dependencies; run after pulling changes to stay in sync.
- `flutter packages pub run build_runner build` regenerates Hive adapters and other codegen outputs; add `--delete-conflicting-outputs` when schemas change.
- `flutter run` (optionally `-d chrome` or device id) bootstraps the app locally for manual verification.
- `flutter analyze` enforces static checks and surfaces common Dart issues before review.
- `flutter test` executes the full automated test suite; run it prior to every commit or pull request.

## Coding Style & Naming Conventions
- Adhere to Flutter defaults: two-space indentation, trailing commas in widget trees, and `dart format lib test`.
- Keep provider files suffixed with `*_provider.dart` and widgets/screens with `*_widget.dart` or `*_screen.dart` to align with existing patterns.
- Favor immutable data classes with Hive annotations in `lib/data/models`; store generated `.g.dart` files under the same folder.
- Prefer descriptive Riverpod provider names (e.g., `journalEntriesProvider`) and avoid abbreviations that obscure intent.

## Testing Guidelines
- Use `flutter_test` for widget and integration-style coverage; rely on package-level `setUp`/`tearDown` helpers to isolate state.
- Mirror the `lib/` folder structure inside `test/` so new specs are easy to locate (`lib/presentation/screens` → `test/presentation/screens`).
- When Hive models change, add regression tests covering serialization and the affected services.
- For UI changes, add golden or widget tests that assert key interactive states before requesting review.

## Commit & Pull Request Guidelines
- Follow the existing Git history style: prefer Conventional Commit prefixes (`feat:`, `fix:`, `refactor:`) with concise, imperative summaries.
- Squash work-in-progress commits locally; push polished commits that narrate the change set clearly.
- Pull requests must include a short summary, testing notes (e.g., `flutter test`), and screenshots or screen recordings for visual updates.
- Link relevant issues and call out migrations, schema updates, or manual steps reviewers should perform.
