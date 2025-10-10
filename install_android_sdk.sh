#!/usr/bin/env bash

set -e

# 📌 Dossier d’installation
ANDROID_DIR="$HOME/Android"
SDK_DIR="$ANDROID_DIR/Sdk"
CMDLINE_DIR="$ANDROID_DIR/cmdline-tools"

echo "➡️ Installation du SDK Android dans $ANDROID_DIR"

# 📌 Création des dossiers
mkdir -p "$SDK_DIR"
mkdir -p "$CMDLINE_DIR"

# 📌 Téléchargement des command line tools
cd "$ANDROID_DIR"
if [ ! -f "commandlinetools-linux.zip" ]; then
  echo "⬇️ Téléchargement des Android command line tools..."
  wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O commandlinetools-linux.zip
fi

# 📌 Extraction
echo "📦 Extraction..."
unzip -o commandlinetools-linux.zip -d "$CMDLINE_DIR"
mv "$CMDLINE_DIR/cmdline-tools" "$CMDLINE_DIR/latest"

# 📌 Variables d’environnement
echo "⚙️ Configuration des variables d’environnement..."
PROFILE_FILE="$HOME/.bashrc"
{
  echo ''
  echo '# >>> Android SDK >>>'
  echo "export ANDROID_HOME=$SDK_DIR"
  echo 'export PATH=$ANDROID_HOME/platform-tools:$PATH'
  echo "export PATH=$ANDROID_DIR/cmdline-tools/latest/bin:\$PATH"
  echo '# <<< Android SDK <<<'
} >> "$PROFILE_FILE"

# 📌 Rechargement du bashrc
source "$PROFILE_FILE"

# 📌 Installation des composants SDK nécessaires
echo "📥 Installation des composants SDK..."
yes | sdkmanager --sdk_root="$SDK_DIR" "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# 📌 Vérification
echo "✅ Installation terminée."
echo "Tu peux maintenant lancer : flutter doctor --android-licenses"
