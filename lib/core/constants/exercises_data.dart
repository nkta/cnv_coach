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

// --- Données pour l'exercice "La Baguette Magique" ---

class MagicWandScenario {
  final String complaint;
  final List<String> requestOptions;
  final String correctRequest;
  final String tip;

  const MagicWandScenario({
    required this.complaint,
    required this.requestOptions,
    required this.correctRequest,
    required this.tip,
  });
}

const List<MagicWandScenario> magicWandData = [
  MagicWandScenario(
    complaint: 'Tu laisses toujours la vaisselle sale dans l\'évier !',
    requestOptions: [
      'Tu pourrais arrêter de salir la cuisine ?',
      'Pourrais-tu faire la vaisselle ce soir avant 21h ?',
      'Tu ne peux pas être plus organisé ?'
    ],
    correctRequest: 'Pourrais-tu faire la vaisselle ce soir avant 21h ?',
    tip: 'Une demande claire précise une action concrète, un moment et reste formulée positivement.',
  ),
  MagicWandScenario(
    complaint: 'Je n\'en peux plus que tu sois sur ton téléphone pendant nos repas.',
    requestOptions: [
      'Tu devrais avoir honte de ne pas profiter de moi.',
      'Tu ne pourrais pas faire un effort de temps en temps ?',
      'Serais-tu d\'accord pour poser ton téléphone pendant le dîner ce soir ?'
    ],
    correctRequest: 'Serais-tu d\'accord pour poser ton téléphone pendant le dîner ce soir ?',
    tip: 'Formuler une demande commence par exprimer un souhait réalisable ici et maintenant.',
  ),
  MagicWandScenario(
    complaint: 'Personne ne m\'écoute quand je donne mon avis en réunion.',
    requestOptions: [
      'Vous êtes tous irrespectueux !',
      'Pourriez-vous laisser deux minutes pour que je partage mon point de vue avant de réagir ?',
      'J\'aimerais que vous arrêtiez de parler.'
    ],
    correctRequest: 'Pourriez-vous laisser deux minutes pour que je partage mon point de vue avant de réagir ?',
    tip: 'Préciser ce que l\'on souhaite voir ou entendre aide les autres à répondre au besoin identifié.',
  ),
];

// --- Données pour l'exercice "Le Détecteur d'empathie" ---

class EmpathyDetectorScenario {
  final String statement;
  final List<String> feelingOptions;
  final String correctFeeling;
  final List<String> needOptions;
  final String correctNeed;
  final String explanation;

  const EmpathyDetectorScenario({
    required this.statement,
    required this.feelingOptions,
    required this.correctFeeling,
    required this.needOptions,
    required this.correctNeed,
    required this.explanation,
  });
}

const List<EmpathyDetectorScenario> empathyDetectorData = [
  EmpathyDetectorScenario(
    statement: 'Je t\'ai attendu une heure et tu n\'as même pas prévenu.',
    feelingOptions: ['Fâché(e)', 'Reconnaissant(e)', 'Rassuré(e)'],
    correctFeeling: 'Fâché(e)',
    needOptions: ['Respect', 'Aventure', 'Repos'],
    correctNeed: 'Respect',
    explanation: 'La colère pointe souvent vers un besoin de respect ou de considération pour ses engagements.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je viens d\'avoir cette promotion, j\'ai l\'impression que tout est possible !',
    feelingOptions: ['Enthousiaste', 'Triste', 'Méfiant(e)'],
    correctFeeling: 'Enthousiaste',
    needOptions: ['Croissance', 'Repos', 'Prévisibilité'],
    correctNeed: 'Croissance',
    explanation: 'La promotion nourrit souvent le besoin de se sentir en croissance ou de contribuer davantage.',
  ),
  EmpathyDetectorScenario(
    statement: 'Depuis que tu es parti, la maison me semble vide.',
    feelingOptions: ['Seul(e)', 'Serein(e)', 'Excité(e)'],
    correctFeeling: 'Seul(e)',
    needOptions: ['Connexion', 'Autonomie', 'Aventure'],
    correctNeed: 'Connexion',
    explanation: 'Le sentiment de solitude révèle fréquemment un besoin de connexion et de proximité.',
  ),
];
