# CNV Coach

CNV Coach est une application Flutter multiplateforme destinée à accompagner la pratique de la Communication NonViolente (CNV). Elle propose un journal guidé, des exercices interactifs et des ressources pour aider les utilisateurs à développer une communication empathique.

## Fonctionnalités principales
- **Journal CNV guidé** : consignez vos observations, sentiments, besoins et demandes dans un flux structuré.
- **Exercices pratiques** : entraînez-vous grâce à des activités basées sur les principes de la CNV.
- **Ressources pédagogiques** : retrouvez des références et contenus pour approfondir vos connaissances.
- **Navigation moderne** : interface fluide grâce à GoRouter, Riverpod et un thème Material 3 personnalisé.

## Prérequis
- [Flutter](https://docs.flutter.dev/get-started/install) 3.19 ou plus récent avec le canal stable.
- Un dispositif ou émulateur iOS/Android, ou un navigateur moderne pour la cible Web.
- (Optionnel) [Melos](https://melos.invertase.dev/) ou un autre outil de gestion de workspace si vous travaillez avec plusieurs packages.

Vérifiez l'installation de Flutter :
```bash
flutter --version
```

## Démarrage rapide
1. Récupérez les dépendances :
   ```bash
   flutter pub get
   ```
2. Générez les fichiers liés à Hive si vous avez modifié les modèles :
   ```bash
   flutter packages pub run build_runner build
   ```
3. Lancez l'application sur la plateforme souhaitée :
   ```bash
   flutter run
   ```

## Lancer les tests
Exécutez l'ensemble des tests Dart/Flutter avec :
```bash
flutter test
```

## Aller plus loin
Pour une description détaillée de l'architecture, des flux de données et des ressources CNV, consultez [DOCUMENTATION.md](DOCUMENTATION.md).

## Licence
Ce projet est distribué sous licence MIT. Consultez le fichier [LICENSE](LICENSE) si disponible ou adaptez selon vos besoins.
