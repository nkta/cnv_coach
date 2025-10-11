import 'package:cnv_coach/presentation/providers/device_auth_provider.dart';
import 'package:cnv_coach/presentation/providers/journal_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class JournalScreen extends ConsumerStatefulWidget {
  const JournalScreen({super.key});

  @override
  ConsumerState<JournalScreen> createState() => _JournalScreenState();
}

class _JournalScreenState extends ConsumerState<JournalScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(deviceAuthControllerProvider.notifier).authenticate();
    });
  }

  @override
  Widget build(BuildContext context) {
    final authStatus = ref.watch(deviceAuthControllerProvider);

    if (authStatus == DeviceAuthStatus.unknown ||
        authStatus == DeviceAuthStatus.authenticating) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mon Journal'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (authStatus != DeviceAuthStatus.authenticated) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mon Journal'),
        ),
        body: _LockedJournalView(onRetry: _retryAuthentication),
      );
    }

    final journalEntries = ref.watch(journalEntriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Journal'),
      ),
      body: journalEntries.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.book_outlined, size: 60, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      'Votre journal est vide.',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey[700]),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Appuyez sur le bouton + pour commencer votre première pratique d\'auto-empathie.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              itemCount: journalEntries.length,
              itemBuilder: (context, index) {
                final entry = journalEntries[index];
                return Dismissible(
                  key: ValueKey(entry.id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    ref.read(journalEntriesProvider.notifier).deleteEntry(entry.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Entrée supprimée')),
                    );
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      title: Text(entry.observation, maxLines: 2, overflow: TextOverflow.ellipsis),
                      subtitle: Text(DateFormat.yMMMd('fr_FR').format(entry.createdAt)),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        context.go('/journal/detail', extra: entry);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/journal/add/observation');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _retryAuthentication() {
    ref.read(deviceAuthControllerProvider.notifier).authenticate();
  }
}

class _LockedJournalView extends StatelessWidget {
  const _LockedJournalView({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock_outline, size: 60, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Accès verrouillé',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(height: 8),
            Text(
              'Nous n\'avons pas pu vérifier votre identité. Veuillez réessayer ou revenir à l\'accueil.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.fingerprint),
              label: const Text('Réessayer'),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Retour à l\'accueil'),
            ),
          ],
        ),
      ),
    );
  }
}
