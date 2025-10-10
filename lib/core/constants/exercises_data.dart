enum JudgmentType { observation, judgment }

class FactSortingItem {
  final String sentence;
  final JudgmentType type;
  final String? explanation;

  const FactSortingItem({
    required this.sentence,
    required this.type,
    this.explanation,
  });
}

const List<FactSortingItem> factSortingData = [
  FactSortingItem(
    sentence: 'Le chef de projet est arrivé avec 15 minutes de retard à la réunion.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence: 'Mon collègue est irrespectueux.',
    type: JudgmentType.judgment,
    explanation: '"Irrespectueux" est une interprétation de son comportement, pas un fait observable.',
  ),
  FactSortingItem(
    sentence: 'Tu n\'écoutes jamais ce que je dis.',
    type: JudgmentType.judgment,
    explanation: '"Jamais" est une généralisation. Une observation serait : "Je ne t\'ai pas entendu reformuler ce que j\'ai dit."',
  ),
  FactSortingItem(
    sentence: 'J\'ai vu que tu as levé les yeux au ciel quand j\'ai parlé.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence: 'Ce travail est beaucoup trop difficile.',
    type: JudgmentType.judgment,
    explanation: '"Trop difficile" est une évaluation personnelle. Une observation serait : "Je n\'ai pas réussi à finir cette tâche en 3 heures."',
  ),
  FactSortingItem(
    sentence: 'Elle a dit qu\'elle ne voulait pas venir.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence: 'Il est égoïste de refuser d\'aider.',
    type: JudgmentType.judgment,
    explanation: '"Égoïste" est un jugement sur l\'intention de la personne.',
  ),
];

// --- Données pour l'exercice "Le Moteur des Émotions" ---

class EmotionEngineItem {
  final String feeling;
  final List<String> needsOptions;
  final String correctNeed;
  final String explanation;

  const EmotionEngineItem({
    required this.feeling,
    required this.needsOptions,
    required this.correctNeed,
    required this.explanation,
  });
}

const List<EmotionEngineItem> emotionEngineData = [
  EmotionEngineItem(
    feeling: 'enthousiaste',
    needsOptions: ['Créativité', 'Repos', 'Sécurité'],
    correctNeed: 'Créativité',
    explanation: 'L\'enthousiasme est souvent lié à un besoin de créativité, de découverte ou de stimulation.',
  ),
  EmotionEngineItem(
    feeling: 'seul(e)',
    needsOptions: ['Indépendance', 'Connexion', 'Ordre'],
    correctNeed: 'Connexion',
    explanation: 'Le sentiment de solitude pointe presque toujours vers un besoin de connexion, d\'appartenance ou de communauté.',
  ),
  EmotionEngineItem(
    feeling: 'stressé(e)',
    needsOptions: ['Jeu', 'Paix', 'Défi'],
    correctNeed: 'Paix',
    explanation: 'Le stress signale fréquemment un besoin de paix, de soutien ou de clarté.',
  ),
  EmotionEngineItem(
    feeling: 'fier(e)',
    needsOptions: ['Humilité', 'Contribution', 'Deuil'],
    correctNeed: 'Contribution',
    explanation: 'La fierté est souvent connectée au fait de sentir que l\'on a contribué ou que l\'on a utilisé ses compétences.',
  ),
  EmotionEngineItem(
    feeling: 'en colère',
    needsOptions: ['Harmonie', 'Acceptation', 'Respect'],
    correctNeed: 'Respect',
    explanation: 'La colère peut être un signal puissant qu\'un besoin de respect, de justice ou d\'autonomie n\'est pas satisfait.',
  ),
];
