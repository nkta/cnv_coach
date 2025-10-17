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
    sentence:
        'Lors du point d\'équipe de lundi, Jade a interrompu sa présentation après trois minutes pour répondre à un appel.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'À 9h45, le serveur a redémarré sans prévenir et a déconnecté tous les participants de la visio.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'En sortant de la salle, Marc a refermé la porte sans regarder qu\'il restait du matériel à l\'intérieur.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Dans le compte rendu envoyé hier, aucune décision n\'a été consignée dans la section "Actions".',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Pendant l\'entretien de feedback, Léa a regardé sa montre cinq fois en quinze minutes.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Sur le tableau de suivi, la colonne dédiée aux tests est restée vide les deux dernières semaines.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Lorsque Sophie a présenté le projet, elle a montré quatre diapositives sur les risques.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le client a répondu au dernier mail en joignant le contrat signé à 22h17.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le budget a été dépassé de 14% selon les chiffres partagés mercredi.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Dans la conversation Slack, Thomas a ajouté trois messages avec des captures d\'écran distinctes.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Au moment du déjeuner, Amine a laissé trois dossiers sur la table de la salle commune.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Vendredi dernier, le support a clôturé le ticket #582 sans ajouter de commentaire de résolution.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Pendant le brainstorming, trois idées ont été notées sur le tableau et entourées.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Sara a déplacé la réunion de planification du mardi au jeudi à 8h30.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'À l\'entrée du bâtiment, une affiche indique que l\'ascenseur est en maintenance jusqu\'au 15.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Sur le planning partagé, le créneau de Clara est resté bloqué de 14h à 16h pour "visite médicale".',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le mail envoyé par Hugo comporte deux pièces jointes de 4 Mo chacune.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Lorsque le client a posé la question, Paul a pris 12 secondes avant de répondre.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le module de paiement a généré cinq erreurs 502 consécutives ce matin.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Dans le fichier de specs, la section "Pré-requis" est surlignée en jaune.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'À 7h15, un message Teams indiquait que la sauvegarde nocturne était terminée avec succès.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Pendant la formation, trois participants ont quitté la visioconférence avant la fin.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le tableau de bord affiche un pic de trafic à 18h42 avec 1 200 connexions simultanées.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Camille a posé deux questions sur la roadmap dans le canal #produit.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'La facture du mois d\'avril indique une remise de 12% sur la ligne "volume".',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Sur la photo partagée, Julien porte le badge visiteur numéro 314.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le shift de nuit a livré 28 colis supplémentaires par rapport à l\'objectif.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Hier, le coach agile a dessiné trois cercles concentriques au tableau.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'À l\'ouverture de la session, le micro de Claire était coupé pendant 90 secondes.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'La page de login affiche un message d\'erreur rouge "Credential invalid" après deux tentatives.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Sur le canal support, six demandes ont été marquées comme critiques depuis lundi.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Louis a ajouté une note manuscrite "À valider" sur le dossier bleu.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Durant le comité, personne n\'a répondu aux deux questions ouvertes posées par Alex.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le fichier Excel comporte un onglet supplémentaire nommé "Hypothèses".',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'À 16h20, la climatisation s\'est arrêtée et l\'écran de contrôle a affiché "maintenance".',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Maya a appelé le client trois fois entre 13h et 13h30 selon le journal téléphonique.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence: 'La formation en ligne a duré 2h17 selon l\'outil de suivi.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence: 'L\'enveloppe envoyée au siège contenait deux contrats signés.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Pendant la démo, Victor a partagé son écran et a navigué dans cinq menus différents.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Sur la vidéo de surveillance, on voit un camion entrer dans l\'entrepôt à 5h58.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le rapport hebdomadaire mentionne que cinq lots ont été bloqués pour contrôle qualité.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Au tableau Kanban, trois cartes sont restées en colonne "À tester" depuis huit jours.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le support a réouvert le ticket #641 après la mise en production de mardi.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Dans le CRM, la fiche client a été mise à jour avec un nouveau numéro de téléphone le 4 mai.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Pendant l\'atelier, deux participants ont pris des notes sur papier, les autres sur ordinateur.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'À 11h02, l\'imprimante du troisième étage a affiché le code erreur P26.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Lors du bilan trimestriel, la direction a présenté huit graphiques comparatifs.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Sur le planning mural, une note rose indique "penser à prévenir finance".',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le badge de sécurité de Nina a été refusé deux fois avant d\'être accepté.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence:
        'Le script de déploiement a tourné pendant 14 minutes avant de s\'arrêter.',
    type: JudgmentType.observation,
  ),
  FactSortingItem(
    sentence: 'Il se fiche complètement des délais.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "se fiche complètement" prête une intention; une observation serait : "Il n\'a pas rendu les deux derniers livrables à la date prévue."',
  ),
  FactSortingItem(
    sentence: 'Ce plan est une catastrophe totale.',
    type: JudgmentType.judgment,
    explanation:
        'Qualifier le plan de "catastrophe" est une évaluation globale; une observation possible serait : "Le plan ne couvre pas les risques identifiés pour les fournisseurs B et C."',
  ),
  FactSortingItem(
    sentence: 'Ils ne respectent jamais les consignes.',
    type: JudgmentType.judgment,
    explanation:
        'Le mot "jamais" généralise; on peut observer : "Sur les quatre derniers audits, deux consignes obligatoires n\'ont pas été appliquées."',
  ),
  FactSortingItem(
    sentence: 'Clara est clairement indifférente aux retours clients.',
    type: JudgmentType.judgment,
    explanation:
        'Attribuer "indifférente" parle de l\'intention; une observation serait : "Clara n\'a pas répondu aux trois mails clients envoyés depuis lundi."',
  ),
  FactSortingItem(
    sentence: 'Ce dossier est totalement bâclé.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "bâclé" juge la qualité; une observation serait : "Le dossier ne contient ni pièces jointes ni plan de test."',
  ),
  FactSortingItem(
    sentence: 'Tu dramatises tout ce qu\'on te dit.',
    type: JudgmentType.judgment,
    explanation:
        'Accuser de "dramatiser" est une interprétation; une observation serait : "Tu as élevé la voix et quitté la salle lors de la remarque."',
  ),
  FactSortingItem(
    sentence: 'Le service juridique est complètement perdu.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "complètement perdu" évalue l\'équipe; on peut observer : "Le service n\'a pas fourni de réponse aux trois questions envoyées hier."',
  ),
  FactSortingItem(
    sentence:
        'C\'est irresponsable d\'avoir laissé partir le client sans réponse.',
    type: JudgmentType.judgment,
    explanation:
        'Qualifier de "irresponsable" est un jugement; une observation serait : "Le client est reparti sans recevoir d\'information sur les délais."',
  ),
  FactSortingItem(
    sentence: 'Il est allergique à la critique.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "allergique" est métaphorique; une observation serait : "Quand on lui a donné un feedback, il a quitté la réunion sans commenter."',
  ),
  FactSortingItem(
    sentence: 'Notre direction ne comprend rien à nos enjeux.',
    type: JudgmentType.judgment,
    explanation:
        'Affirmer "ne comprend rien" est une supposition; une observation serait : "Les priorités demandées ne mentionnent pas les contraintes identifiées en atelier."',
  ),
  FactSortingItem(
    sentence: 'Tu es trop susceptible pour travailler en équipe.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "trop susceptible" juge la personnalité; une observation serait : "Tu es parti de deux réunions après une remarque."',
  ),
  FactSortingItem(
    sentence: 'Ces chiffres sont n\'importe quoi.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "n\'importe quoi" dénigre; une observation serait : "Les chiffres ne correspondent pas aux données collectées le mois dernier."',
  ),
  FactSortingItem(
    sentence: 'Elle manipule tout le monde pour obtenir ce qu\'elle veut.',
    type: JudgmentType.judgment,
    explanation:
        'Accuser de "manipuler" prête une intention; une observation serait : "Elle a changé l\'ordre du jour sans prévenir et a imposé son sujet."',
  ),
  FactSortingItem(
    sentence: 'Ce process est totalement inutile.',
    type: JudgmentType.judgment,
    explanation:
        'Qualifier de "totalement inutile" est un jugement; une observation serait : "Le process ne change pas le délai de traitement mesuré sur trois semaines."',
  ),
  FactSortingItem(
    sentence: 'Vous êtes tous démotivés ces temps-ci.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "tous démotivés" généralise; une observation serait : "Dans les deux dernières réunions, personne n\'a proposé de piste d\'amélioration."',
  ),
  FactSortingItem(
    sentence: 'Il est bien trop perfectionniste pour avancer.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "perfectionniste" juge la personne; une observation serait : "Il a repris trois fois le rapport avant de le partager, dépassant le délai."',
  ),
  FactSortingItem(
    sentence: 'Cette équipe est complètement désorganisée.',
    type: JudgmentType.judgment,
    explanation:
        'Qualifier l\'équipe de "désorganisée" est une évaluation; une observation serait : "Les réunions débutent avec quinze minutes de retard et aucun ordre du jour affiché."',
  ),
  FactSortingItem(
    sentence: 'Tu ne prends jamais tes responsabilités.',
    type: JudgmentType.judgment,
    explanation:
        'Le mot "jamais" généralise; une observation serait : "Tu as demandé à Léa de présenter les deux rapports à ta place."',
  ),
  FactSortingItem(
    sentence: 'Ce plan de test est beaucoup trop scolaire.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "trop scolaire" juge le travail; une observation serait : "Le plan de test réutilise mot pour mot le modèle 2022 sans adapter les cas."',
  ),
  FactSortingItem(
    sentence: 'Ils sont incapables de prioriser quoi que ce soit.',
    type: JudgmentType.judgment,
    explanation:
        'Qualifier "incapables" est un jugement; une observation serait : "Les trois premiers lots ont été démarrés en parallèle sans estimation."',
  ),
  FactSortingItem(
    sentence: 'Tu fais exprès de compliquer la situation.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "fais exprès" suppose une intention; une observation serait : "Tu as ajouté trois validations supplémentaires sans en discuter avec l\'équipe."',
  ),
  FactSortingItem(
    sentence: 'Ce client est insupportable.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "insupportable" juge la personne; une observation serait : "Le client a appelé six fois en deux heures en coupant la parole."',
  ),
  FactSortingItem(
    sentence: 'La réunion était totalement inutile.',
    type: JudgmentType.judgment,
    explanation:
        'Qualifier la réunion d\'"inutile" est un jugement; une observation serait : "Aucune décision ni action n\'a été notée pendant la réunion."',
  ),
  FactSortingItem(
    sentence: 'Il est toujours négatif quand on propose quelque chose.',
    type: JudgmentType.judgment,
    explanation:
        'Le mot "toujours" généralise; une observation serait : "Il a émis trois objections sans proposer d\'alternative lors des deux dernières réunions."',
  ),
  FactSortingItem(
    sentence: 'Elle n\'a aucune empathie pour ses collègues.',
    type: JudgmentType.judgment,
    explanation:
        'Supposer "aucune empathie" prête une intention; une observation serait : "Elle n\'a pas réagi quand Julie a partagé sa difficulté."',
  ),
  FactSortingItem(
    sentence: 'Tu as saboté la présentation.',
    type: JudgmentType.judgment,
    explanation:
        'Accuser de sabotage suppose une intention; une observation serait : "Tu as supprimé trois slides sans nous prévenir avant la présentation."',
  ),
  FactSortingItem(
    sentence: 'Ce budget est ridicule.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "ridicule" est une évaluation; une observation serait : "Le budget proposé est inférieur de 60% aux estimations des fournisseurs."',
  ),
  FactSortingItem(
    sentence: 'Il est incapable d\'écouter sans interrompre.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "incapable" juge la personne; une observation serait : "Il a interrompu quatre collègues en dix minutes."',
  ),
  FactSortingItem(
    sentence: 'Notre support fait preuve d\'un laxisme total.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "laxisme total" évalue le service; une observation serait : "Les tickets urgents sont restés sans réponse plus de 48h."',
  ),
  FactSortingItem(
    sentence: 'Cette politique RH est complètement archaïque.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "archaïque" est un jugement; une observation serait : "La politique ne prévoit pas de télétravail malgré les demandes depuis un an."',
  ),
  FactSortingItem(
    sentence: 'Vous ne pensez qu\'au chiffre.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "ne pensez qu\'au chiffre" suppose une intention; une observation serait : "Les objectifs présentés ne mentionnent pas la satisfaction client."',
  ),
  FactSortingItem(
    sentence: 'Il est impossible de travailler avec elle.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "impossible" est une exagération; une observation serait : "Nous n\'avons pas trouvé de créneau commun malgré quatre propositions."',
  ),
  FactSortingItem(
    sentence: 'Tu es totalement fermé aux idées nouvelles.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "totalement fermé" juge la personne; une observation serait : "Tu as refusé d\'examiner les deux prototypes proposés."',
  ),
  FactSortingItem(
    sentence: 'Ce rapport est bourré d\'erreurs grossières.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "bourré d\'erreurs" est une étiquette; une observation serait : "Les sections 3 et 4 contiennent des chiffres différents de ceux du CRM."',
  ),
  FactSortingItem(
    sentence: 'Notre hiérarchie est déconnectée de la réalité.',
    type: JudgmentType.judgment,
    explanation:
        'Attribuer "déconnectée" est un jugement; une observation serait : "Lors de la visite, la hiérarchie n\'a pas consulté le planning de production."',
  ),
  FactSortingItem(
    sentence: 'Tu prends tout personnellement.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "tu prends tout personnellement" interprète ton attitude; une observation serait : "Après le commentaire de Paul, tu as cessé de participer au reste de la réunion."',
  ),
  FactSortingItem(
    sentence: 'Les partenaires sont de mauvaise foi.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "mauvaise foi" prête une intention; une observation serait : "Ils ont contesté les engagements signés dans le contrat."',
  ),
  FactSortingItem(
    sentence: 'C\'est toujours le chaos quand tu diriges un projet.',
    type: JudgmentType.judgment,
    explanation:
        'Le mot "toujours" généralise; une observation serait : "Sur les deux derniers projets, les plannings n\'ont pas été partagés."',
  ),
  FactSortingItem(
    sentence: 'Ce fournisseur est complètement incompétent.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "incompétent" juge la personne; une observation serait : "Le fournisseur n\'a pas respecté les spécifications sur les deux dernières livraisons."',
  ),
  FactSortingItem(
    sentence: 'Il adore se mettre en avant.',
    type: JudgmentType.judgment,
    explanation:
        'Attribuer "adore se mettre en avant" suppose une intention; une observation serait : "Il a mentionné ses résultats personnels trois fois en réunion."',
  ),
  FactSortingItem(
    sentence: 'Tu boudes dès qu\'on te contredit.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "tu boudes" suppose une intention; une observation serait : "Quand on a contesté ta proposition, tu t\'es tu pendant le reste de la réunion."',
  ),
  FactSortingItem(
    sentence: 'Ce projet est voué à l\'échec.',
    type: JudgmentType.judgment,
    explanation:
        'Affirmer qu\'un projet est "voué à l\'échec" est une prédiction; une observation serait : "Le projet n\'a pas de ressources dédiées ni de planning validé."',
  ),
  FactSortingItem(
    sentence: 'Ils sont obsédés par les détails.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "obsédés" juge leur attitude; une observation serait : "Ils ont demandé cinq corrections mineures sur des éléments non critiques."',
  ),
  FactSortingItem(
    sentence: 'Tu ne fais aucun effort pour t\'améliorer.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "aucun effort" généralise; une observation serait : "Tu n\'as pas suivi le plan de formation proposé depuis trois mois."',
  ),
  FactSortingItem(
    sentence: 'Cette démarche est pure perte de temps.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "pure perte de temps" est un jugement; une observation serait : "La démarche a pris deux heures sans produire de livrable."',
  ),
  FactSortingItem(
    sentence: 'Il dramatise tout ce qui se passe.',
    type: JudgmentType.judgment,
    explanation:
        'Accuser de "dramatiser" interprète son intention; une observation serait : "Il a décrit l\'incident comme critique alors que le service n\'a été interrompu que dix minutes."',
  ),
  FactSortingItem(
    sentence: 'Elle cherche constamment à avoir le dernier mot.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "cherche constamment" suppose une intention; une observation serait : "Elle a répliqué après chaque remarque sans laisser conclure."',
  ),
  FactSortingItem(
    sentence: 'Le marketing est complètement déconnecté du terrain.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "complètement déconnecté" est un jugement; une observation serait : "Ils n\'ont pas consulté l\'équipe support avant de lancer la campagne."',
  ),
  FactSortingItem(
    sentence: 'Tu fais ton possible pour retarder la décision.',
    type: JudgmentType.judgment,
    explanation:
        'Accuser de "faire son possible" suppose une intention; une observation serait : "Tu as demandé trois reports supplémentaires sans fournir de nouvelles informations."',
  ),
  FactSortingItem(
    sentence: 'Cette solution est tout simplement absurde.',
    type: JudgmentType.judgment,
    explanation:
        'Dire "absurde" est un jugement; une observation serait : "La solution double les coûts sans répondre au besoin identifié."',
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
    feeling: 'débordé(e)',
    needsOptions: ['Clarté', 'Autonomie', 'Reconnaissance'],
    correctNeed: 'Clarté',
    explanation:
        'Se sentir débordé(e) signale souvent un besoin de clarté pour hiérarchiser ce qui compte et réduire la dispersion.',
  ),
  EmotionEngineItem(
    feeling: 'apaisé(e)',
    needsOptions: ['Clarté', 'Sécurité', 'Contribution'],
    correctNeed: 'Sécurité',
    explanation:
        'L\'apaisement traduit que le besoin de sécurité et de stabilité immédiate est nourri.',
  ),
  EmotionEngineItem(
    feeling: 'frustré(e)',
    needsOptions: ['Appartenance', 'Sens', 'Progrès'],
    correctNeed: 'Progrès',
    explanation:
        'La frustration pointe un besoin de progrès tangible ou de marge d\'action pour avancer.',
  ),
  EmotionEngineItem(
    feeling: 'euphorique',
    needsOptions: ['Célébration', 'Apprentissage', 'Stabilité'],
    correctNeed: 'Célébration',
    explanation:
        'L\'euphorie répond à un besoin de célébration et de partage de la réussite.',
  ),
  EmotionEngineItem(
    feeling: 'inquiet/inquiète',
    needsOptions: ['Respect', 'Prévisibilité', 'Expression'],
    correctNeed: 'Prévisibilité',
    explanation:
        'L\'inquiétude souligne un besoin de prévisibilité et de repères rassurants.',
  ),
  EmotionEngineItem(
    feeling: 'résigné(e)',
    needsOptions: ['Prévisibilité', 'Créativité', 'Autonomie'],
    correctNeed: 'Autonomie',
    explanation:
        'La résignation révèle un besoin d\'autonomie pour retrouver du pouvoir de choix.',
  ),
  EmotionEngineItem(
    feeling: 'curieux/curieuse',
    needsOptions: ['Apprentissage', 'Équité', 'Repos'],
    correctNeed: 'Apprentissage',
    explanation:
        'La curiosité nourrit un besoin d\'apprentissage et de découverte continue.',
  ),
  EmotionEngineItem(
    feeling: 'découragé(e)',
    needsOptions: ['Coopération', 'Soutien', 'Authenticité'],
    correctNeed: 'Soutien',
    explanation:
        'Le découragement indique un besoin de soutien concret ou moral.',
  ),
  EmotionEngineItem(
    feeling: 'serein(e)',
    needsOptions: ['Partage', 'Solidarité', 'Harmonie'],
    correctNeed: 'Harmonie',
    explanation:
        'La sérénité témoigne d\'un besoin d\'harmonie intérieure et relationnelle satisfait.',
  ),
  EmotionEngineItem(
    feeling: 'méfiant(e)',
    needsOptions: ['Fiabilité', 'Progrès', 'Célébration'],
    correctNeed: 'Fiabilité',
    explanation:
        'La méfiance signale un besoin de fiabilité et d\'engagements respectés.',
  ),
  EmotionEngineItem(
    feeling: 'enthousiasmé(e)',
    needsOptions: ['Détente', 'Créativité', 'Aventure'],
    correctNeed: 'Créativité',
    explanation:
        'L\'enthousiasme jaillit souvent quand le besoin de créativité ou de nouveauté est nourri.',
  ),
  EmotionEngineItem(
    feeling: 'désorienté(e)',
    needsOptions: ['Autonomie', 'Reconnaissance', 'Structure'],
    correctNeed: 'Structure',
    explanation:
        'La désorientation met en avant un besoin de structure et de repères explicites.',
  ),
  EmotionEngineItem(
    feeling: 'confiant(e)',
    needsOptions: ['Sécurité', 'Clarté', 'Contribution'],
    correctNeed: 'Sécurité',
    explanation:
        'La confiance révèle un besoin de sécurité et de soutien solide reconnu.',
  ),
  EmotionEngineItem(
    feeling: 'amer/amère',
    needsOptions: ['Appartenance', 'Équité', 'Sens'],
    correctNeed: 'Équité',
    explanation:
        'L\'amertume révèle souvent un besoin d\'équité ou de réparation d\'un tort perçu.',
  ),
  EmotionEngineItem(
    feeling: 'galvanisé(e)',
    needsOptions: ['Apprentissage', 'Stabilité', 'Impact'],
    correctNeed: 'Impact',
    explanation:
        'Se sentir galvanisé(e) pointe un besoin d\'impact et de contribution visible.',
  ),
  EmotionEngineItem(
    feeling: 'coupable',
    needsOptions: ['Intégrité', 'Respect', 'Expression'],
    correctNeed: 'Intégrité',
    explanation:
        'La culpabilité éclaire un besoin d\'intégrité et de cohérence avec ses valeurs.',
  ),
  EmotionEngineItem(
    feeling: 'soulagé(e)',
    needsOptions: ['Prévisibilité', 'Repos', 'Créativité'],
    correctNeed: 'Repos',
    explanation:
        'Le soulagement suggère un besoin de repos et de relâchement après la tension.',
  ),
  EmotionEngineItem(
    feeling: 'nostalgique',
    needsOptions: ['Équité', 'Repos', 'Appartenance'],
    correctNeed: 'Appartenance',
    explanation:
        'La nostalgie rappelle un besoin d\'appartenance ou de connexion à un groupe.',
  ),
  EmotionEngineItem(
    feeling: 'vulnérable',
    needsOptions: ['Soutien', 'Coopération', 'Authenticité'],
    correctNeed: 'Soutien',
    explanation:
        'La vulnérabilité révèle un besoin de soutien et de bienveillance explicite.',
  ),
  EmotionEngineItem(
    feeling: 'inspiré(e)',
    needsOptions: ['Partage', 'Sens', 'Solidarité'],
    correctNeed: 'Sens',
    explanation:
        'L\'inspiration nourrit un besoin de sens et de direction partagée.',
  ),
  EmotionEngineItem(
    feeling: 'enjoué(e)',
    needsOptions: ['Progrès', 'Célébration', 'Amusement'],
    correctNeed: 'Amusement',
    explanation: 'L\'état enjoué répond au besoin d\'amusement et de légèreté.',
  ),
  EmotionEngineItem(
    feeling: 'crispé(e)',
    needsOptions: ['Détente', 'Aventure', 'Acceptation'],
    correctNeed: 'Détente',
    explanation:
        'La crispation indique un besoin de détente et d\'espace pour se relâcher.',
  ),
  EmotionEngineItem(
    feeling: 'revendicatif/revendicative',
    needsOptions: ['Autonomie', 'Équité', 'Reconnaissance'],
    correctNeed: 'Équité',
    explanation:
        'Le ton revendicatif pointe un besoin d\'équité ou de reconnaissance de droits.',
  ),
  EmotionEngineItem(
    feeling: 'rassuré(e)',
    needsOptions: ['Clarté', 'Contribution', 'Sécurité'],
    correctNeed: 'Sécurité',
    explanation:
        'Se sentir rassuré(e) montre que le besoin de sécurité émotionnelle est rencontré.',
  ),
  EmotionEngineItem(
    feeling: 'hésitant(e)',
    needsOptions: ['Clarté', 'Appartenance', 'Sens'],
    correctNeed: 'Clarté',
    explanation:
        'L\'hésitation met en valeur un besoin de clarté ou d\'information supplémentaire.',
  ),
  EmotionEngineItem(
    feeling: 'perplexe',
    needsOptions: ['Apprentissage', 'Clarté', 'Stabilité'],
    correctNeed: 'Clarté',
    explanation:
        'La perplexité traduit un besoin de clarté ou d\'explications cohérentes.',
  ),
  EmotionEngineItem(
    feeling: 'valorisé(e)',
    needsOptions: ['Respect', 'Expression', 'Reconnaissance'],
    correctNeed: 'Reconnaissance',
    explanation:
        'Se sentir valorisé(e) répond à un besoin de reconnaissance explicite.',
  ),
  EmotionEngineItem(
    feeling: 'isolé(e)',
    needsOptions: ['Appartenance', 'Prévisibilité', 'Créativité'],
    correctNeed: 'Appartenance',
    explanation:
        'Le sentiment d\'isolement révèle un besoin d\'appartenance et de lien.',
  ),
  EmotionEngineItem(
    feeling: 'impatient(e)',
    needsOptions: ['Équité', 'Progrès', 'Repos'],
    correctNeed: 'Progrès',
    explanation:
        'L\'impatience signale un besoin de progrès ou d\'avancement concret.',
  ),
  EmotionEngineItem(
    feeling: 'satisfait(e)',
    needsOptions: ['Coopération', 'Authenticité', 'Contribution'],
    correctNeed: 'Contribution',
    explanation:
        'La satisfaction traduit souvent un besoin de contribution utile reconnu.',
  ),
  EmotionEngineItem(
    feeling: 'anxieux/anxieuse',
    needsOptions: ['Sécurité', 'Partage', 'Solidarité'],
    correctNeed: 'Sécurité',
    explanation:
        'L\'anxiété met en lumière un besoin de sécurité et de soutien stable.',
  ),
  EmotionEngineItem(
    feeling: 'fier/fière',
    needsOptions: ['Progrès', 'Reconnaissance', 'Célébration'],
    correctNeed: 'Reconnaissance',
    explanation:
        'La fierté est liée à un besoin de reconnaissance et de célébration du chemin accompli.',
  ),
  EmotionEngineItem(
    feeling: 'honteux/honteuse',
    needsOptions: ['Détente', 'Aventure', 'Acceptation'],
    correctNeed: 'Acceptation',
    explanation:
        'Le sentiment de honte révèle un besoin d\'acceptation et de bienveillance.',
  ),
  EmotionEngineItem(
    feeling: 'ouvert(e)',
    needsOptions: ['Expression', 'Autonomie', 'Reconnaissance'],
    correctNeed: 'Expression',
    explanation:
        'L\'ouverture traduit un besoin d\'expression authentique et d\'écoute mutuelle.',
  ),
  EmotionEngineItem(
    feeling: 'passif/passive',
    needsOptions: ['Sécurité', 'Autonomie', 'Clarté'],
    correctNeed: 'Autonomie',
    explanation:
        'La passivité signale un besoin d\'autonomie ou de pouvoir d\'agir.',
  ),
  EmotionEngineItem(
    feeling: 'déterminé(e)',
    needsOptions: ['Appartenance', 'Sens', 'Maîtrise'],
    correctNeed: 'Maîtrise',
    explanation:
        'La détermination reflète un besoin de maîtrise et de capacité d\'action.',
  ),
  EmotionEngineItem(
    feeling: 'nerveux/nerveuse',
    needsOptions: ['Prévisibilité', 'Apprentissage', 'Stabilité'],
    correctNeed: 'Prévisibilité',
    explanation:
        'La nervosité révèle un besoin de prévisibilité et de repères stabilisants.',
  ),
  EmotionEngineItem(
    feeling: 'déçu(e)',
    needsOptions: ['Respect', 'Reconnaissance', 'Expression'],
    correctNeed: 'Reconnaissance',
    explanation:
        'La déception pointe un besoin de reconnaissance ou de prise en compte.',
  ),
  EmotionEngineItem(
    feeling: 'zélé(e)',
    needsOptions: ['Prévisibilité', 'Créativité', 'Contribution'],
    correctNeed: 'Contribution',
    explanation:
        'Le zèle nourrit un besoin de contribution et de sens donné au travail.',
  ),
  EmotionEngineItem(
    feeling: 'apathique',
    needsOptions: ['Sens', 'Équité', 'Repos'],
    correctNeed: 'Sens',
    explanation:
        'L\'apathie traduit un besoin de sens ou de motivation renouvelée.',
  ),
  EmotionEngineItem(
    feeling: 'bouleversé(e)',
    needsOptions: ['Coopération', 'Soutien', 'Authenticité'],
    correctNeed: 'Soutien',
    explanation:
        'Le bouleversement souligne un besoin de soutien émotionnel et de présence.',
  ),
  EmotionEngineItem(
    feeling: 'énergisé(e)',
    needsOptions: ['Partage', 'Solidarité', 'Créativité'],
    correctNeed: 'Créativité',
    explanation:
        'Se sentir énergisé(e) répond à un besoin de créativité et de défi stimulant.',
  ),
  EmotionEngineItem(
    feeling: 'jaloux/jalouse',
    needsOptions: ['Appartenance', 'Progrès', 'Célébration'],
    correctNeed: 'Appartenance',
    explanation:
        'La jalousie pointe un besoin d\'appartenance et de reconnaissance du lien.',
  ),
  EmotionEngineItem(
    feeling: 'reconnaissant(e)',
    needsOptions: ['Détente', 'Partage', 'Aventure'],
    correctNeed: 'Partage',
    explanation:
        'La reconnaissance nourrit un besoin de partage et de gratitude mutuelle.',
  ),
  EmotionEngineItem(
    feeling: 'morose',
    needsOptions: ['Autonomie', 'Reconnaissance', 'Amusement'],
    correctNeed: 'Amusement',
    explanation:
        'La morosité informe d\'un besoin d\'amusement ou de légèreté retrouvée.',
  ),
  EmotionEngineItem(
    feeling: 'assuré(e)',
    needsOptions: ['Sécurité', 'Clarté', 'Contribution'],
    correctNeed: 'Sécurité',
    explanation:
        'Le fait de se sentir assuré(e) répond à un besoin de sécurité intérieure.',
  ),
  EmotionEngineItem(
    feeling: 'démuni(e)',
    needsOptions: ['Appartenance', 'Soutien', 'Sens'],
    correctNeed: 'Soutien',
    explanation:
        'Le sentiment de dénuement éclaire un besoin de soutien ou de ressources.',
  ),
  EmotionEngineItem(
    feeling: 'tranquille',
    needsOptions: ['Apprentissage', 'Stabilité', 'Repos'],
    correctNeed: 'Repos',
    explanation:
        'La tranquillité témoigne d\'un besoin de repos et de calme honoré.',
  ),
  EmotionEngineItem(
    feeling: 'sceptique',
    needsOptions: ['Fiabilité', 'Respect', 'Expression'],
    correctNeed: 'Fiabilité',
    explanation:
        'Le scepticisme pointe un besoin de fiabilité ou de preuves tangibles.',
  ),
  EmotionEngineItem(
    feeling: 'surpris(e)',
    needsOptions: ['Créativité', 'Prévisibilité', 'Impact'],
    correctNeed: 'Prévisibilité',
    explanation:
        'La surprise met en avant un besoin de prévisibilité ou de préparation.',
  ),
  EmotionEngineItem(
    feeling: 'impuissant(e)',
    needsOptions: ['Équité', 'Repos', 'Autonomie'],
    correctNeed: 'Autonomie',
    explanation:
        'Le sentiment d\'impuissance reflète un besoin d\'autonomie ou de marge de manœuvre.',
  ),
  EmotionEngineItem(
    feeling: 'comblé(e)',
    needsOptions: ['Célébration', 'Coopération', 'Authenticité'],
    correctNeed: 'Célébration',
    explanation:
        'Se sentir comblé(e) répond à un besoin de célébration et de gratitude.',
  ),
  EmotionEngineItem(
    feeling: 'exaspéré(e)',
    needsOptions: ['Partage', 'Respect', 'Solidarité'],
    correctNeed: 'Respect',
    explanation:
        'L\'exaspération révèle un besoin de respect et de considération de ses limites.',
  ),
  EmotionEngineItem(
    feeling: 'léger/légère',
    needsOptions: ['Progrès', 'Célébration', 'Amusement'],
    correctNeed: 'Amusement',
    explanation:
        'La légèreté traduit un besoin d\'amusement et de simplicité satisfait.',
  ),
  EmotionEngineItem(
    feeling: 'ému(e)',
    needsOptions: ['Partage', 'Détente', 'Aventure'],
    correctNeed: 'Partage',
    explanation:
        'L\'émotion ressentie souligne un besoin de partage et de connexion.',
  ),
  EmotionEngineItem(
    feeling: 'tendu(e)',
    needsOptions: ['Autonomie', 'Détente', 'Reconnaissance'],
    correctNeed: 'Détente',
    explanation: 'La tension indique un besoin de détente et de relâchement.',
  ),
  EmotionEngineItem(
    feeling: 'déboussolé(e)',
    needsOptions: ['Sécurité', 'Clarté', 'Structure'],
    correctNeed: 'Structure',
    explanation:
        'Le sentiment d\'être déboussolé(e) pointe un besoin de structure et de guidage.',
  ),
  EmotionEngineItem(
    feeling: 'sérieux/sérieuse',
    needsOptions: ['Sens', 'Appartenance', 'Amusement'],
    correctNeed: 'Sens',
    explanation: 'Le sérieux reflète un besoin de sens et d\'intention claire.',
  ),
  EmotionEngineItem(
    feeling: 'rafraîchi(e)',
    needsOptions: ['Apprentissage', 'Repos', 'Stabilité'],
    correctNeed: 'Repos',
    explanation:
        'Se sentir rafraîchi(e) répond à un besoin de repos et de renouvellement.',
  ),
  EmotionEngineItem(
    feeling: 'lucide',
    needsOptions: ['Respect', 'Expression', 'Clarté'],
    correctNeed: 'Clarté',
    explanation:
        'La lucidité montre que le besoin de clarté et de cohérence est satisfait.',
  ),
  EmotionEngineItem(
    feeling: 'pressé(e)',
    needsOptions: ['Progrès', 'Prévisibilité', 'Créativité'],
    correctNeed: 'Progrès',
    explanation:
        'La sensation d\'être pressé(e) révèle un besoin de progrès et d\'efficacité.',
  ),
  EmotionEngineItem(
    feeling: 'rassasié(e)',
    needsOptions: ['Équité', 'Simplicité', 'Repos'],
    correctNeed: 'Simplicité',
    explanation:
        'La satiété pointe un besoin de simplicité et de suffisance comblé.',
  ),
  EmotionEngineItem(
    feeling: 'stimulé(e)',
    needsOptions: ['Coopération', 'Authenticité', 'Créativité'],
    correctNeed: 'Créativité',
    explanation:
        'Le fait d\'être stimulé(e) répond à un besoin de créativité ou de défi.',
  ),
  EmotionEngineItem(
    feeling: 'dubitatif/dubitative',
    needsOptions: ['Fiabilité', 'Partage', 'Solidarité'],
    correctNeed: 'Fiabilité',
    explanation:
        'Le doute exprime un besoin de fiabilité ou de données vérifiables.',
  ),
  EmotionEngineItem(
    feeling: 'outré(e)',
    needsOptions: ['Progrès', 'Respect', 'Célébration'],
    correctNeed: 'Respect',
    explanation: 'L\'outrage souligne un besoin de respect et d\'équité.',
  ),
  EmotionEngineItem(
    feeling: 'excité(e)',
    needsOptions: ['Détente', 'Acceptation', 'Aventure'],
    correctNeed: 'Aventure',
    explanation:
        'L\'excitation répond à un besoin d\'aventure ou de nouveauté.',
  ),
  EmotionEngineItem(
    feeling: 'prudent(e)',
    needsOptions: ['Sécurité', 'Autonomie', 'Reconnaissance'],
    correctNeed: 'Sécurité',
    explanation: 'La prudence reflète un besoin de sécurité et de prévention.',
  ),
  EmotionEngineItem(
    feeling: 'coopératif/coopérative',
    needsOptions: ['Sécurité', 'Coopération', 'Clarté'],
    correctNeed: 'Coopération',
    explanation:
        'L\'élan coopératif nourrit un besoin de coopération et de soutien mutuel.',
  ),
  EmotionEngineItem(
    feeling: 'solidaire',
    needsOptions: ['Appartenance', 'Sens', 'Solidarité'],
    correctNeed: 'Solidarité',
    explanation:
        'Le sentiment de solidarité répond à un besoin de solidarité et d\'entraide.',
  ),
  EmotionEngineItem(
    feeling: 'accablé(e)',
    needsOptions: ['Soutien', 'Apprentissage', 'Stabilité'],
    correctNeed: 'Soutien',
    explanation:
        'L\'accablement met en avant un besoin de soutien et de partage de charge.',
  ),
  EmotionEngineItem(
    feeling: 'aligné(e)',
    needsOptions: ['Respect', 'Authenticité', 'Expression'],
    correctNeed: 'Authenticité',
    explanation:
        'Se sentir aligné(e) répond à un besoin d\'authenticité et de cohérence intérieure.',
  ),
  EmotionEngineItem(
    feeling: 'révolté(e)',
    needsOptions: ['Prévisibilité', 'Créativité', 'Équité'],
    correctNeed: 'Équité',
    explanation:
        'La révolte signale un besoin d\'équité ou de justice restaurée.',
  ),
  EmotionEngineItem(
    feeling: 'paisible',
    needsOptions: ['Harmonie', 'Équité', 'Repos'],
    correctNeed: 'Harmonie',
    explanation: 'Le sentiment de paix indique un besoin d\'harmonie comblé.',
  ),
  EmotionEngineItem(
    feeling: 'revigoré(e)',
    needsOptions: ['Coopération', 'Repos', 'Authenticité'],
    correctNeed: 'Repos',
    explanation:
        'Se sentir revigoré(e) répond à un besoin de repos et de récupération.',
  ),
  EmotionEngineItem(
    feeling: 'tourmenté(e)',
    needsOptions: ['Partage', 'Solidarité', 'Sens'],
    correctNeed: 'Sens',
    explanation: 'Le tourment pointe un besoin de sens et de compréhension.',
  ),
  EmotionEngineItem(
    feeling: 'radieux/radieuse',
    needsOptions: ['Célébration', 'Progrès', 'Intégrité'],
    correctNeed: 'Célébration',
    explanation:
        'La radiance reflète un besoin de célébration et de partager la joie.',
  ),
  EmotionEngineItem(
    feeling: 'détaché(e)',
    needsOptions: ['Détente', 'Simplicité', 'Aventure'],
    correctNeed: 'Simplicité',
    explanation:
        'Le détachement révèle un besoin de simplicité ou de distance pour retrouver de l\'espace.',
  ),
  EmotionEngineItem(
    feeling: 'stoïque',
    needsOptions: ['Autonomie', 'Reconnaissance', 'Maîtrise'],
    correctNeed: 'Maîtrise',
    explanation:
        'L\'attitude stoïque traduit un besoin de maîtrise et de stabilité intérieure.',
  ),
  EmotionEngineItem(
    feeling: 'incrédule',
    needsOptions: ['Fiabilité', 'Sécurité', 'Clarté'],
    correctNeed: 'Fiabilité',
    explanation:
        'L\'incrédulité indique un besoin de fiabilité ou de preuves concrètes.',
  ),
  EmotionEngineItem(
    feeling: 'motivé(e)',
    needsOptions: ['Appartenance', 'Impact', 'Sens'],
    correctNeed: 'Impact',
    explanation:
        'La motivation répond à un besoin d\'impact et de contribution efficace.',
  ),
  EmotionEngineItem(
    feeling: 'alarmé(e)',
    needsOptions: ['Apprentissage', 'Stabilité', 'Sécurité'],
    correctNeed: 'Sécurité',
    explanation:
        'L\'alarme ressentie souligne un besoin de sécurité immédiate.',
  ),
  EmotionEngineItem(
    feeling: 'repentant(e)',
    needsOptions: ['Intégrité', 'Respect', 'Expression'],
    correctNeed: 'Intégrité',
    explanation:
        'Le repentir met en avant un besoin d\'intégrité et de réparation.',
  ),
  EmotionEngineItem(
    feeling: 'ambitieux/ambitieuse',
    needsOptions: ['Prévisibilité', 'Progrès', 'Créativité'],
    correctNeed: 'Progrès',
    explanation: 'L\'ambition nourrit un besoin de progrès et d\'évolution.',
  ),
  EmotionEngineItem(
    feeling: 'humilié(e)',
    needsOptions: ['Équité', 'Repos', 'Respect'],
    correctNeed: 'Respect',
    explanation: 'L\'humiliation révèle un besoin de respect et de dignité.',
  ),
  EmotionEngineItem(
    feeling: 'confus(e)',
    needsOptions: ['Clarté', 'Coopération', 'Authenticité'],
    correctNeed: 'Clarté',
    explanation: 'La confusion montre un besoin de clarté ou d\'explication.',
  ),
  EmotionEngineItem(
    feeling: 'ravi(e)',
    needsOptions: ['Partage', 'Célébration', 'Solidarité'],
    correctNeed: 'Célébration',
    explanation: 'Le ravissement répond à un besoin de célébration partagée.',
  ),
  EmotionEngineItem(
    feeling: 'dérangé(e)',
    needsOptions: ['Progrès', 'Célébration', 'Détente'],
    correctNeed: 'Détente',
    explanation:
        'Se sentir dérangé(e) pointe un besoin de détente ou d\'espace protégé.',
  ),
  EmotionEngineItem(
    feeling: 'vigilant(e)',
    needsOptions: ['Sécurité', 'Détente', 'Aventure'],
    correctNeed: 'Sécurité',
    explanation: 'La vigilance reflète un besoin de sécurité et de prévention.',
  ),
  EmotionEngineItem(
    feeling: 'abattu(e)',
    needsOptions: ['Autonomie', 'Soutien', 'Reconnaissance'],
    correctNeed: 'Soutien',
    explanation:
        'L\'abattement indique un besoin de soutien et d\'encouragement.',
  ),
  EmotionEngineItem(
    feeling: 'vivifié(e)',
    needsOptions: ['Sécurité', 'Clarté', 'Créativité'],
    correctNeed: 'Créativité',
    explanation:
        'Se sentir vivifié(e) répond à un besoin de créativité ou de renouveau.',
  ),
  EmotionEngineItem(
    feeling: 'respecté(e)',
    needsOptions: ['Respect', 'Appartenance', 'Sens'],
    correctNeed: 'Respect',
    explanation:
        'Le sentiment d\'être respecté(e) montre que le besoin de respect est comblé.',
  ),
  EmotionEngineItem(
    feeling: 'ahuri(e)',
    needsOptions: ['Apprentissage', 'Clarté', 'Stabilité'],
    correctNeed: 'Clarté',
    explanation:
        'L\'état ahuri met en lumière un besoin de clarté ou de pause.',
  ),
  EmotionEngineItem(
    feeling: 'impliqué(e)',
    needsOptions: ['Respect', 'Expression', 'Contribution'],
    correctNeed: 'Contribution',
    explanation:
        'Se sentir impliqué(e) répond à un besoin de contribution active.',
  ),
  EmotionEngineItem(
    feeling: 'réjoui(e)',
    needsOptions: ['Amusement', 'Prévisibilité', 'Créativité'],
    correctNeed: 'Amusement',
    explanation:
        'La joie ressentie nourrit un besoin d\'amusement et de partage.',
  ),
  EmotionEngineItem(
    feeling: 'agacé(e)',
    needsOptions: ['Équité', 'Respect', 'Repos'],
    correctNeed: 'Respect',
    explanation:
        'L\'agacement révèle un besoin de respect et de limites reconnues.',
  ),
  EmotionEngineItem(
    feeling: 'énergique',
    needsOptions: ['Coopération', 'Authenticité', 'Impact'],
    correctNeed: 'Impact',
    explanation:
        'L\'énergie ressentie traduit un besoin d\'impact et de mouvement.',
  ),
  EmotionEngineItem(
    feeling: 'mal à l\'aise',
    needsOptions: ['Sécurité', 'Partage', 'Solidarité'],
    correctNeed: 'Sécurité',
    explanation:
        'Le malaise signale un besoin de sécurité et de cadre rassurant.',
  ),
  EmotionEngineItem(
    feeling: 'ombrageux/ombrageuse',
    needsOptions: ['Progrès', 'Respect', 'Célébration'],
    correctNeed: 'Respect',
    explanation:
        'Le fait d\'être ombrageux/ombrageuse indique un besoin de respect et de reconnaissance.',
  ),
  EmotionEngineItem(
    feeling: 'appréhensif/appréhensive',
    needsOptions: ['Détente', 'Aventure', 'Prévisibilité'],
    correctNeed: 'Prévisibilité',
    explanation:
        'L\'appréhension souligne un besoin de prévisibilité et d\'informations fiables.',
  ),
  EmotionEngineItem(
    feeling: 'grisé(e)',
    needsOptions: ['Aventure', 'Autonomie', 'Reconnaissance'],
    correctNeed: 'Aventure',
    explanation:
        'Le fait d\'être grisé(e) répond à un besoin d\'aventure ou d\'intensité.',
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
    complaint:
        'Quand tu quittes l\'open space, tu laisses toujours les lumières allumées.',
    requestOptions: [
      'Tu pourrais penser un peu aux factures ?',
      'Est-ce que tu serais ok pour éteindre les lumières en partant ce soir à 19h ?',
      'Tu ne peux pas être plus soigneux ?',
    ],
    correctRequest:
        'Est-ce que tu serais ok pour éteindre les lumières en partant ce soir à 19h ?',
    tip:
        'Une demande efficace décrit l\'action attendue, le moment et parfois le lieu.',
  ),
  MagicWandScenario(
    complaint:
        'Depuis trois semaines, la salle de réunion est jonchée de câbles après tes tests.',
    requestOptions: [
      'T\'as pas fini de transformer le bureau en chantier ?',
      'Est-ce que tu pourrais ranger les câbles dans le bac noir dès que tu finis un test ?',
      'J\'aimerais bien que tu sois plus pro.',
    ],
    correctRequest:
        'Est-ce que tu pourrais ranger les câbles dans le bac noir dès que tu finis un test ?',
    tip:
        'Préciser le déclencheur « dès que » aide à ancrer la nouvelle habitude.',
  ),
  MagicWandScenario(
    complaint:
        'À chaque rétro, tu réponds aux messages Slack en plein échange.',
    requestOptions: [
      'Tu te rends compte que c\'est impoli ?',
      'Ce serait possible de mettre ton téléphone en silencieux pendant la rétro de demain ?',
      'Fais un effort, quoi.',
    ],
    correctRequest:
        'Ce serait possible de mettre ton téléphone en silencieux pendant la rétro de demain ?',
    tip:
        'Une demande orientée comportement est plus actionnable qu\'une critique.',
  ),
  MagicWandScenario(
    complaint:
        'Tu laisses toujours les dossiers clients sur ton bureau alors qu\'ils sont confidentiels.',
    requestOptions: [
      'Tu te fiches de la confidentialité ?',
      'Peux-tu verrouiller les dossiers clients dans l\'armoire sécurisée avant de quitter le bureau ce soir ?',
      'Arrête d\'oublier.',
    ],
    correctRequest:
        'Peux-tu verrouiller les dossiers clients dans l\'armoire sécurisée avant de quitter le bureau ce soir ?',
    tip: 'Mentionner l\'endroit où poser l\'action limite l\'ambiguïté.',
  ),
  MagicWandScenario(
    complaint: 'Tu annules nos points d\'avancement le jour même.',
    requestOptions: [
      'Sois professionnel quand même !',
      'Est-ce qu\'on peut valider ensemble un créneau fixe le mardi à 10h pour nos points d\'avancement ?',
      'Tu pourrais arrêter d\'improviser ?',
    ],
    correctRequest:
        'Est-ce qu\'on peut valider ensemble un créneau fixe le mardi à 10h pour nos points d\'avancement ?',
    tip: 'Co-construire la solution augmente la chance d\'adhésion.',
  ),
  MagicWandScenario(
    complaint:
        'Quand je te parle, tu regardes souvent ton écran sans me répondre.',
    requestOptions: [
      'Tu pourrais être plus respectueux ?',
      'Peux-tu prendre deux minutes sans écran quand je viens poser une question ?',
      'Ça m\'énerve de te voir faire ça.',
    ],
    correctRequest:
        'Peux-tu prendre deux minutes sans écran quand je viens poser une question ?',
    tip: 'Limiter dans le temps la demande la rend plus facile à accepter.',
  ),
  MagicWandScenario(
    complaint: 'Tu poses ta tasse pleine de café sur mon carnet chaque matin.',
    requestOptions: [
      'Tu fais exprès de tout salir ou quoi ?',
      'Serais-tu d\'accord pour utiliser le sous-verre vert quand tu poses ta tasse sur mon bureau ?',
      'Arrête de laisser des traces.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour utiliser le sous-verre vert quand tu poses ta tasse sur mon bureau ?',
    tip: 'Pointer un objet précis clarifie le geste attendu.',
  ),
  MagicWandScenario(
    complaint:
        'Tu changes l\'ordre du jour pendant les réunions sans prévenir.',
    requestOptions: [
      'Tu devrais arrêter de nous surprendre comme ça.',
      'Peux-tu partager ton ordre du jour final au moins deux heures avant la réunion de jeudi ?',
      'Encore une fois tu fais à ta sauce.',
    ],
    correctRequest:
        'Peux-tu partager ton ordre du jour final au moins deux heures avant la réunion de jeudi ?',
    tip: 'Une échéance concrète clarifie la demande.',
  ),
  MagicWandScenario(
    complaint:
        'Les supports de formation restent en brouillon sur Notion et personne n\'y a accès.',
    requestOptions: [
      'Peux-tu penser à tes collègues parfois ?',
      'Peux-tu publier la version finale des supports sur Notion avant vendredi midi ?',
      'Tu pourrais te bouger un peu ?',
    ],
    correctRequest:
        'Peux-tu publier la version finale des supports sur Notion avant vendredi midi ?',
    tip: 'Inclure une deadline aide à prioriser.',
  ),
  MagicWandScenario(
    complaint: 'Tu balances des notifications sur le canal général à minuit.',
    requestOptions: [
      'T\'as un problème avec le sommeil ?',
      'Serais-tu ok pour programmer tes messages pour le lendemain matin avant 8h ?',
      'Arrête de réveiller tout le monde.',
    ],
    correctRequest:
        'Serais-tu ok pour programmer tes messages pour le lendemain matin avant 8h ?',
    tip: 'Proposer une alternative concrète reste plus recevable.',
  ),
  MagicWandScenario(
    complaint:
        'Tu prends souvent la parole à la place des juniors pendant les démos.',
    requestOptions: [
      'Tu pourrais arrêter de jouer au chef ?',
      'Est-ce que tu accepterais de leur laisser présenter la prochaine fonctionnalité en te limitant aux questions ?',
      'Tu es vraiment envahissant.',
    ],
    correctRequest:
        'Est-ce que tu accepterais de leur laisser présenter la prochaine fonctionnalité en te limitant aux questions ?',
    tip: 'Formuler l\'attente en termes de comportement observable.',
  ),
  MagicWandScenario(
    complaint:
        'Tes retours arrivent après la date limite de relecture chaque sprint.',
    requestOptions: [
      'Sois sérieux un peu !',
      'Peux-tu poster tes relectures avant 18h le mardi pour ce sprint ?',
      'Je ne comprends pas pourquoi tu traînes.',
    ],
    correctRequest:
        'Peux-tu poster tes relectures avant 18h le mardi pour ce sprint ?',
    tip: 'Mentionner le jour et l\'heure rend la demande vérifiable.',
  ),
  MagicWandScenario(
    complaint:
        'Tu laisses ton micro ouvert pendant les visios et on entend tout l\'open space.',
    requestOptions: [
      'Tu pourrais arrêter de déranger ?',
      'Peux-tu activer la fonction mute automatique quand tu n\'interviens pas en visio ?',
      'Tu crois que c\'est agréable ?',
    ],
    correctRequest:
        'Peux-tu activer la fonction mute automatique quand tu n\'interviens pas en visio ?',
    tip: 'Suggérer un paramétrage concret facilite l\'adhésion.',
  ),
  MagicWandScenario(
    complaint:
        'Tu ranges les prototypes sans étiquettes, on ne sait plus lequel est lequel.',
    requestOptions: [
      'Tu fais n\'importe quoi !',
      'Serais-tu d\'accord pour coller une étiquette datée sur chaque prototype avant de le ranger ?',
      'Tu pourrais faire un effort.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour coller une étiquette datée sur chaque prototype avant de le ranger ?',
    tip: 'Décrire le geste concret évite les interprétations.',
  ),
  MagicWandScenario(
    complaint: 'Tu livres tes tickets sans mettre à jour le changelog.',
    requestOptions: [
      'Ce serait bien que tu arrêtes d\'oublier.',
      'Peux-tu compléter le changelog dans Confluence juste après chaque livraison ?',
      'Tu nous mets dans la galère, tu sais ?',
    ],
    correctRequest:
        'Peux-tu compléter le changelog dans Confluence juste après chaque livraison ?',
    tip: 'Associer l\'action à un moment précis augmente la mémorisation.',
  ),
  MagicWandScenario(
    complaint: 'Tu arrives avec dix minutes de retard à chaque coaching.',
    requestOptions: [
      'Tu es toujours en retard, c\'est pénible.',
      'Serais-tu ok pour te connecter cinq minutes avant le coaching de jeudi pour que l\'on démarre à l\'heure ?',
      'Fais un effort pour une fois.',
    ],
    correctRequest:
        'Serais-tu ok pour te connecter cinq minutes avant le coaching de jeudi pour que l\'on démarre à l\'heure ?',
    tip: 'Proposer un micro-changement donne plus de chances de réussite.',
  ),
  MagicWandScenario(
    complaint: 'Tu modifies les slides juste avant de monter sur scène.',
    requestOptions: [
      'Tu stresses tout le monde quand tu fais ça !',
      'Peux-tu finaliser les slides la veille à 18h et les partager dans le dossier commun ?',
      'Arrête d\'être impulsif.',
    ],
    correctRequest:
        'Peux-tu finaliser les slides la veille à 18h et les partager dans le dossier commun ?',
    tip: 'Préciser le canal de partage évite les oublis.',
  ),
  MagicWandScenario(
    complaint:
        'Tu gardes les feedbacks pour toi au lieu de les mettre dans le board qualité.',
    requestOptions: [
      'Tu pourrais penser équipe un peu ?',
      'Est-ce que tu peux consigner tes feedbacks dans le board qualité avant la réunion du lundi matin ?',
      'Tu oublies toujours.',
    ],
    correctRequest:
        'Est-ce que tu peux consigner tes feedbacks dans le board qualité avant la réunion du lundi matin ?',
    tip: 'Lier la demande à un rituel existant favorise l\'habitude.',
  ),
  MagicWandScenario(
    complaint: 'Tu laisses la cuisine pleine de miettes après tes pauses.',
    requestOptions: [
      'Tu exagères vraiment.',
      'Serais-tu partant pour essuyer le plan de travail avec l\'éponge bleue après chaque pause ?',
      'Tu pourrais être plus propre.',
    ],
    correctRequest:
        'Serais-tu partant pour essuyer le plan de travail avec l\'éponge bleue après chaque pause ?',
    tip: 'Nommer l\'objet exact évite les discussions.',
  ),
  MagicWandScenario(
    complaint: 'Tu interromps les clients pour finir leurs phrases.',
    requestOptions: [
      'Tu es tellement impoli.',
      'Peux-tu laisser trois secondes de silence avant de répondre pendant l\'appel de demain ?',
      'Tu dois travailler ton ego.',
    ],
    correctRequest:
        'Peux-tu laisser trois secondes de silence avant de répondre pendant l\'appel de demain ?',
    tip: 'Mesurer la pause en secondes rend la demande tangible.',
  ),
  MagicWandScenario(
    complaint:
        'Tu ne renseignes pas les heures passées sur le projet dans Harvest.',
    requestOptions: [
      'Tu attends quoi pour faire ton travail ?',
      'Peux-tu compléter Harvest chaque soir à 18h au plus tard cette semaine ?',
      'Ça devient du n\'importe quoi.',
    ],
    correctRequest:
        'Peux-tu compléter Harvest chaque soir à 18h au plus tard cette semaine ?',
    tip: 'Associer la demande à une période précise facilite l\'engagement.',
  ),
  MagicWandScenario(
    complaint: 'Tu changes les specs sans avertir l\'équipe QA.',
    requestOptions: [
      'Tu abuses avec tes changements.',
      'Serais-tu d\'accord pour poster chaque modification de spec sur le canal #qa au moment où tu la valides ?',
      'Fais ce que tu veux, hein.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour poster chaque modification de spec sur le canal #qa au moment où tu la valides ?',
    tip: 'Indiquer le canal de communication évite les angles morts.',
  ),
  MagicWandScenario(
    complaint:
        'Tu m\'envoies les documents en format Pages alors qu\'on utilise tous Word.',
    requestOptions: [
      'Tu fais exprès ou quoi ?',
      'Peux-tu exporter le prochain document en .docx avant de me l\'envoyer ?',
      'Tu pourrais évoluer un peu.',
    ],
    correctRequest:
        'Peux-tu exporter le prochain document en .docx avant de me l\'envoyer ?',
    tip: 'Une demande efficace précise le format attendu.',
  ),
  MagicWandScenario(
    complaint:
        'Tu ajoutes des personnes en copie dans les mails sans prévenir.',
    requestOptions: [
      'Tu mets tout le monde mal à l\'aise.',
      'Serais-tu ok pour prévenir dans le corps du mail quand tu ajoutes quelqu\'un en copie ?',
      'Tu pourrais arrêter tes magouilles.',
    ],
    correctRequest:
        'Serais-tu ok pour prévenir dans le corps du mail quand tu ajoutes quelqu\'un en copie ?',
    tip: 'Demander une micro phrase explicite peut suffire.',
  ),
  MagicWandScenario(
    complaint:
        'Tu laisses les tests unitaires rouges en te disant que quelqu\'un passera derrière.',
    requestOptions: [
      'Ce n\'est pas sérieux.',
      'Peux-tu réparer les tests unitaires avant de pousser sur main aujourd\'hui ?',
      'Tu abuses de la patience de l\'équipe.',
    ],
    correctRequest:
        'Peux-tu réparer les tests unitaires avant de pousser sur main aujourd\'hui ?',
    tip: 'Rendre la demande immédiate évite la procrastination.',
  ),
  MagicWandScenario(
    complaint: 'Tu réponds aux clients avec des messages vocaux illisibles.',
    requestOptions: [
      'Tu pourrais faire un effort d\'articulation.',
      'Peux-tu leur envoyer des réponses écrites pour les demandes critiques cette semaine ?',
      'Ça ne va pas du tout.',
    ],
    correctRequest:
        'Peux-tu leur envoyer des réponses écrites pour les demandes critiques cette semaine ?',
    tip: 'Adapter le support précis répond mieux au besoin.',
  ),
  MagicWandScenario(
    complaint:
        'Tu gardes les maquettes juste pour toi et on découvre les changements en réunion.',
    requestOptions: [
      'Tu manques de transparence.',
      'Pourrais-tu poster les maquettes mises à jour dans Figma en commentaires avant la review de mercredi ?',
      'Tu nous prends de court exprès.',
    ],
    correctRequest:
        'Pourrais-tu poster les maquettes mises à jour dans Figma en commentaires avant la review de mercredi ?',
    tip: 'Partager l\'outil précis réduit les frictions.',
  ),
  MagicWandScenario(
    complaint: 'Tu réserves la salle projet même quand tu n\'en as pas besoin.',
    requestOptions: [
      'Tu pourrais arrêter d\'être égoïste.',
      'Peux-tu libérer la salle dans le calendrier dès que ton atelier est annulé ?',
      'Tu fais n\'importe quoi.',
    ],
    correctRequest:
        'Peux-tu libérer la salle dans le calendrier dès que ton atelier est annulé ?',
    tip:
        'Demander l\'action au moment du changement maintient l\'agenda fiable.',
  ),
  MagicWandScenario(
    complaint:
        'Tu gardes ta caméra éteinte pendant les ateliers collaboratifs.',
    requestOptions: [
      'Ce serait bien que tu sois plus présent.',
      'Serais-tu d\'accord pour activer ta caméra au début de l\'atelier de demain ?',
      'Tu fais le fantôme.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour activer ta caméra au début de l\'atelier de demain ?',
    tip: 'Demander un moment ponctuel peut lever la résistance.',
  ),
  MagicWandScenario(
    complaint: 'Tu fais des blagues douteuses pendant les briefs.',
    requestOptions: [
      'Tu es lourd à force.',
      'Peux-tu t\'abstenir de blagues pendant le brief sécurité de lundi et garder tes remarques pour la pause ?',
      'Tu devrais grandir un peu.',
    ],
    correctRequest:
        'Peux-tu t\'abstenir de blagues pendant le brief sécurité de lundi et garder tes remarques pour la pause ?',
    tip: 'Proposer une alternative cadrée oriente l\'énergie.',
  ),
  MagicWandScenario(
    complaint:
        'Tu utilises des abréviations incompréhensibles dans les tickets.',
    requestOptions: [
      'Tu veux bien écrire français ?',
      'Peux-tu ajouter une légende aux abréviations dans les tickets d\'ici vendredi ?',
      'Tu te moques de qui ?',
    ],
    correctRequest:
        'Peux-tu ajouter une légende aux abréviations dans les tickets d\'ici vendredi ?',
    tip: 'Expliciter l\'attendu rend la demande vérifiable.',
  ),
  MagicWandScenario(
    complaint: 'Tu partages les dashboards sans mettre à jour la légende.',
    requestOptions: [
      'Tu bâcles le travail.',
      'Peux-tu compléter la légende du dashboard marketing avant l\'envoi de demain ?',
      'Tu ne fais jamais les choses à fond.',
    ],
    correctRequest:
        'Peux-tu compléter la légende du dashboard marketing avant l\'envoi de demain ?',
    tip: 'Lier la demande à une échéance encourage le suivi.',
  ),
  MagicWandScenario(
    complaint: 'Tu lances les builds en pleine démo client.',
    requestOptions: [
      'Tu sabotes le travail.',
      'Peux-tu attendre la fin de la démo client de demain avant de lancer le build ?',
      'Tu pourrais réfléchir un peu.',
    ],
    correctRequest:
        'Peux-tu attendre la fin de la démo client de demain avant de lancer le build ?',
    tip: 'Demander une séquence précise évite les collisions.',
  ),
  MagicWandScenario(
    complaint: 'Tu gardes ton casque à fond pendant qu\'on bosse en pair.',
    requestOptions: [
      'Tu es insupportable.',
      'Serais-tu ok pour baisser le casque à un volume 2 quand on code ensemble ?',
      'Tu détruis ma concentration.',
    ],
    correctRequest:
        'Serais-tu ok pour baisser le casque à un volume 2 quand on code ensemble ?',
    tip: 'Quantifier le changement aide à le concrétiser.',
  ),
  MagicWandScenario(
    complaint: 'Tu envoies des invitations de réunion sans agenda.',
    requestOptions: [
      'Tu veux qu\'on devine ?',
      'Peux-tu ajouter trois bullet points d\'objectif dans les invitations à partir de cette semaine ?',
      'Tu fais perdre du temps à tout le monde.',
    ],
    correctRequest:
        'Peux-tu ajouter trois bullet points d\'objectif dans les invitations à partir de cette semaine ?',
    tip: 'Préciser le format attendu clarifie la demande.',
  ),
  MagicWandScenario(
    complaint:
        'Tu commences la réunion sans vérifier que tout le monde entend.',
    requestOptions: [
      'Tu fonces sans réfléchir.',
      'Peux-tu prendre 30 secondes en début de réunion pour vérifier l\'audio de chacun demain ?',
      'Tu pourrais être moins pressé.',
    ],
    correctRequest:
        'Peux-tu prendre 30 secondes en début de réunion pour vérifier l\'audio de chacun demain ?',
    tip: 'Mentionner la durée montre que la demande reste raisonnable.',
  ),
  MagicWandScenario(
    complaint: 'Tu ranges les fichiers là où personne ne peut les retrouver.',
    requestOptions: [
      'Tu fais exprès pour qu\'on te demande de l\'aide.',
      'Serais-tu prêt à sauvegarder tous les docs projet dans le dossier partagé "Sprint 12" à partir d\'aujourd\'hui ?',
      'Tu es vraiment désorganisé.',
    ],
    correctRequest:
        'Serais-tu prêt à sauvegarder tous les docs projet dans le dossier partagé "Sprint 12" à partir d\'aujourd\'hui ?',
    tip: 'Nommer le dossier exact supprime toute ambiguïté.',
  ),
  MagicWandScenario(
    complaint:
        'Tu corriges les documents sans utiliser le suivi des modifications.',
    requestOptions: [
      'Tu joues solo.',
      'Peux-tu activer le suivi des modifications sur Word pour les trois prochaines relectures ?',
      'Tu pourrais nous respecter.',
    ],
    correctRequest:
        'Peux-tu activer le suivi des modifications sur Word pour les trois prochaines relectures ?',
    tip: 'Limiter la demande dans le temps rassure.',
  ),
  MagicWandScenario(
    complaint: 'Tu ajoutes des emojis dans les appels d\'offre officiels.',
    requestOptions: [
      'Tu n\'es pas sérieux.',
      'Peux-tu garder le document de réponse sans emojis pour l\'appel d\'offres de lundi ?',
      'Tu fais honte à l\'équipe.',
    ],
    correctRequest:
        'Peux-tu garder le document de réponse sans emojis pour l\'appel d\'offres de lundi ?',
    tip: 'Ancrer la demande sur un livrable spécifique.',
  ),
  MagicWandScenario(
    complaint:
        'Tu refuses systématiquement de partager les chiffres de budget.',
    requestOptions: [
      'Tu caches quoi encore ?',
      'Serais-tu ok pour envoyer le fichier budget au format PDF avant le comité de jeudi ?',
      'Tu pourrais arrêter ton secret.',
    ],
    correctRequest:
        'Serais-tu ok pour envoyer le fichier budget au format PDF avant le comité de jeudi ?',
    tip: 'Associer la demande à un format rassure sur le contrôle.',
  ),
  MagicWandScenario(
    complaint: 'Tu replies la table de ping-pong sans la sécuriser.',
    requestOptions: [
      'Tu vas finir par blesser quelqu\'un.',
      'Peux-tu enclencher le verrou de sécurité quand tu replis la table après la pause de midi ?',
      'Ce n\'est pas compliqué pourtant.',
    ],
    correctRequest:
        'Peux-tu enclencher le verrou de sécurité quand tu replis la table après la pause de midi ?',
    tip: 'Décrire le geste précis réduit le risque.',
  ),
  MagicWandScenario(
    complaint:
        'Tu retouches les textes sans les relire à voix haute malgré nos accords.',
    requestOptions: [
      'Tu fais comme tu veux.',
      'Peux-tu lire à voix haute le texte avant de l\'envoyer au client demain matin ?',
      'Tu ignores les consignes.',
    ],
    correctRequest:
        'Peux-tu lire à voix haute le texte avant de l\'envoyer au client demain matin ?',
    tip: 'Rappeler le rituel convenu maintient le cadre.',
  ),
  MagicWandScenario(
    complaint: 'Tu t\'engages sur des délais irréalistes devant le client.',
    requestOptions: [
      'Tu mens à tout le monde.',
      'Serais-tu d\'accord pour valider les estimations avec nous avant la prochaine réunion client jeudi ?',
      'Tu pourrais arrêter de promettre la lune.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour valider les estimations avec nous avant la prochaine réunion client jeudi ?',
    tip: 'Inclure un point de validation partagé pacifie la relation.',
  ),
  MagicWandScenario(
    complaint:
        'Tu lances des brainstorms sans inviter les personnes concernées.',
    requestOptions: [
      'Tu es toujours dans ton monde.',
      'Peux-tu vérifier la liste des invités avec moi demain avant d\'envoyer l\'invitation ?',
      'Tu te crois tout permis.',
    ],
    correctRequest:
        'Peux-tu vérifier la liste des invités avec moi demain avant d\'envoyer l\'invitation ?',
    tip: 'Co-vérifier la liste d\'invités garantit l\'inclusion.',
  ),
  MagicWandScenario(
    complaint: 'Tu écrases les remarques des stagiaires en réunion.',
    requestOptions: [
      'Tu manques de respect.',
      'Peux-tu poser au moins une question ouverte à chaque stagiaire pendant la réunion d\'équipe de lundi ?',
      'Tu pourrais être moins brutal.',
    ],
    correctRequest:
        'Peux-tu poser au moins une question ouverte à chaque stagiaire pendant la réunion d\'équipe de lundi ?',
    tip: 'Indiquer le comportement alternatif renforce l\'apprentissage.',
  ),
  MagicWandScenario(
    complaint: 'Tu oublies de mettre les pièces jointes annoncées.',
    requestOptions: [
      'Tu es étourdi ou quoi ?',
      'Peux-tu vérifier les pièces jointes avant d\'envoyer le mail aux partenaires ce soir ?',
      'Tu nous décrédibilises.',
    ],
    correctRequest:
        'Peux-tu vérifier les pièces jointes avant d\'envoyer le mail aux partenaires ce soir ?',
    tip: 'Demander une vérification explicite limite la répétition.',
  ),
  MagicWandScenario(
    complaint: 'Tu viens sans masque en salle blanche.',
    requestOptions: [
      'Tu joues avec la sécurité.',
      'Peux-tu enfiler le masque fourni avant d\'entrer en salle blanche demain ?',
      'Tu ne comprends rien aux règles.',
    ],
    correctRequest:
        'Peux-tu enfiler le masque fourni avant d\'entrer en salle blanche demain ?',
    tip: 'Relier la demande au moment d\'entrée renforce l\'habitude.',
  ),
  MagicWandScenario(
    complaint: 'Tu ranges les échantillons sans noter leur référence.',
    requestOptions: [
      'Tu mets le bazar.',
      'Serais-tu ok pour noter la référence sur l\'étiquette avant de déposer l\'échantillon ?',
      'Tu es vraiment tête en l\'air.',
    ],
    correctRequest:
        'Serais-tu ok pour noter la référence sur l\'étiquette avant de déposer l\'échantillon ?',
    tip: 'Associer l\'action à l\'étape clé rend le processus robuste.',
  ),
  MagicWandScenario(
    complaint:
        'Tu cliques sur « répondre à tous » pour des sujets qui ne concernent pas tout le monde.',
    requestOptions: [
      'Tu spams tout le monde.',
      'Peux-tu choisir « répondre » uniquement pour les questions individuelles à partir d\'aujourd\'hui ?',
      'Tu pourrais te calmer sur les mails.',
    ],
    correctRequest:
        'Peux-tu choisir « répondre » uniquement pour les questions individuelles à partir d\'aujourd\'hui ?',
    tip: 'Nommer la fonctionnalité à utiliser clarifie le geste.',
  ),
  MagicWandScenario(
    complaint:
        'Tu ignores les propositions dans les docs partagés sans laisser de commentaire.',
    requestOptions: [
      'Tu snobes ton équipe.',
      'Peux-tu laisser un commentaire ou une réaction quand tu refuses une proposition dans le doc de demain ?',
      'Tu te prends pour qui ?',
    ],
    correctRequest:
        'Peux-tu laisser un commentaire ou une réaction quand tu refuses une proposition dans le doc de demain ?',
    tip: 'Décrire deux choix acceptables laisse de la liberté.',
  ),
  MagicWandScenario(
    complaint: 'Tu prends des pauses quand la hotline explose.',
    requestOptions: [
      'Tu fuis le travail.',
      'Peux-tu prévenir dix minutes avant de partir en pause pour que l\'on s\'organise ?',
      'Tu devrais avoir honte.',
    ],
    correctRequest:
        'Peux-tu prévenir dix minutes avant de partir en pause pour que l\'on s\'organise ?',
    tip: 'Anticiper la pause permet de répartir la charge.',
  ),
  MagicWandScenario(
    complaint:
        'Tu stockes tes chaussures de sport au milieu de la salle de créativité.',
    requestOptions: [
      'Tu es envahissant.',
      'Serais-tu d\'accord pour les laisser dans le casier gris en entrant ?',
      'Tu ne respectes rien.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour les laisser dans le casier gris en entrant ?',
    tip: 'Indiquer le lieu de rangement concret.',
  ),
  MagicWandScenario(
    complaint: 'Tu ajoutes des tâches dans le backlog sans estimation.',
    requestOptions: [
      'Tu ne joues pas le jeu.',
      'Peux-tu ajouter une estimation rapide avant d\'ajouter une tâche dans le backlog cette semaine ?',
      'Tu fais perdre du temps.',
    ],
    correctRequest:
        'Peux-tu ajouter une estimation rapide avant d\'ajouter une tâche dans le backlog cette semaine ?',
    tip: 'Demander une micro-étape avant d\'ajouter standardise la méthode.',
  ),
  MagicWandScenario(
    complaint: 'Tu publies des stories clients sans les faire valider.',
    requestOptions: [
      'Tu es inconscient.',
      'Peux-tu demander une validation écrite du client avant la publication de demain ?',
      'Tu joues avec le feu.',
    ],
    correctRequest:
        'Peux-tu demander une validation écrite du client avant la publication de demain ?',
    tip: 'Mentionner la validation explicite sécurise la relation.',
  ),
  MagicWandScenario(
    complaint: 'Tu donnes les accès admin aux nouveaux sans les briefer.',
    requestOptions: [
      'Tu es imprudent.',
      'Serais-tu ok pour leur faire un tour de 15 minutes avant de leur donner les accès demain ?',
      'Tu n\'as aucun sens des responsabilités.',
    ],
    correctRequest:
        'Serais-tu ok pour leur faire un tour de 15 minutes avant de leur donner les accès demain ?',
    tip: 'Préciser la durée du briefing cadre l\'effort attendu.',
  ),
  MagicWandScenario(
    complaint: 'Tu oublies de fermer la porte du local serveurs.',
    requestOptions: [
      'Tu es négligent.',
      'Peux-tu contrôler la porte et la fermer à clé en sortant du local ?',
      'Tu te fiches de la sécurité.',
    ],
    correctRequest:
        'Peux-tu contrôler la porte et la fermer à clé en sortant du local ?',
    tip: 'Décrire deux actions simples renforce l\'observabilité.',
  ),
  MagicWandScenario(
    complaint: 'Tu déclenches des réunions d\'urgence pour des sujets mineurs.',
    requestOptions: [
      'Tu dramatises tout.',
      'Peux-tu poster d\'abord un message sur Teams pour qualifier le sujet avant de créer une réunion ?',
      'Arrête tes caprices.',
    ],
    correctRequest:
        'Peux-tu poster d\'abord un message sur Teams pour qualifier le sujet avant de créer une réunion ?',
    tip: 'Proposer un canal intermédiaire réduit la tension.',
  ),
  MagicWandScenario(
    complaint: 'Tu gardes le même mot de passe pour tout.',
    requestOptions: [
      'Tu joues avec le feu.',
      'Peux-tu activer le gestionnaire de mots de passe de l\'entreprise aujourd\'hui ?',
      'Tu es inconscient.',
    ],
    correctRequest:
        'Peux-tu activer le gestionnaire de mots de passe de l\'entreprise aujourd\'hui ?',
    tip: 'Demander une action unique pour amorcer le changement.',
  ),
  MagicWandScenario(
    complaint: 'Tu réponds aux clients le week-end avec mon adresse mail.',
    requestOptions: [
      'Tu abuses totalement.',
      'Serais-tu d\'accord pour utiliser ton adresse dédiée ou programmer l\'envoi lundi ?',
      'Tu cherches les ennuis.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour utiliser ton adresse dédiée ou programmer l\'envoi lundi ?',
    tip: 'Clarifier l\'outil ou le timing évite les malentendus.',
  ),
  MagicWandScenario(
    complaint: 'Tu refuses de documenter les décisions prises en workshop.',
    requestOptions: [
      'Tu te crois au-dessus des règles.',
      'Peux-tu noter trois décisions clés du workshop dans le compte rendu avant ce soir ?',
      'Tu te moques de nous.',
    ],
    correctRequest:
        'Peux-tu noter trois décisions clés du workshop dans le compte rendu avant ce soir ?',
    tip: 'Limiter le nombre demandé rend la tâche digeste.',
  ),
  MagicWandScenario(
    complaint: 'Tu fais des blagues privées dans le canal support.',
    requestOptions: [
      'Ce n\'est pas un comedy club.',
      'Peux-tu réserver tes blagues pour #pause-café et garder le canal support pour les clients ?',
      'Tu te crois drôle.',
    ],
    correctRequest:
        'Peux-tu réserver tes blagues pour #pause-café et garder le canal support pour les clients ?',
    tip: 'Rediriger vers un espace approprié canalise l\'énergie.',
  ),
  MagicWandScenario(
    complaint: 'Tu enregistres les ateliers sans demander l\'accord.',
    requestOptions: [
      'Tu manques de respect.',
      'Serais-tu ok pour demander l\'accord en début d\'atelier avant d\'appuyer sur « enregistrer » ?',
      'Tu n\'as aucun tact.',
    ],
    correctRequest:
        'Serais-tu ok pour demander l\'accord en début d\'atelier avant d\'appuyer sur « enregistrer » ?',
    tip: 'Placer la demande au moment clé facilite l\'acceptation.',
  ),
  MagicWandScenario(
    complaint: 'Tu relances les partenaires avec des majuscules partout.',
    requestOptions: [
      'Tu es agressif.',
      'Peux-tu reformuler la relance avec un ton neutre et sans majuscules demain ?',
      'Tu fais peur aux gens.',
    ],
    correctRequest:
        'Peux-tu reformuler la relance avec un ton neutre et sans majuscules demain ?',
    tip: 'Nommer le ton souhaité rend la demande mesurable.',
  ),
  MagicWandScenario(
    complaint: 'Tu partages les slides internes avec des prospects.',
    requestOptions: [
      'Tu franchis la ligne.',
      'Peux-tu vérifier avec moi avant d\'envoyer une slide interne à un prospect ?',
      'Tu fais n\'importe quoi.',
    ],
    correctRequest:
        'Peux-tu vérifier avec moi avant d\'envoyer une slide interne à un prospect ?',
    tip: 'Mettre en place une validation rapide protège la confidentialité.',
  ),
  MagicWandScenario(
    complaint:
        'Tu refuses les feedbacks clients dans Zendesk sans commentaire.',
    requestOptions: [
      'Tu les ignores.',
      'Peux-tu ajouter une note expliquant la fermeture du ticket avant de le marquer résolu ?',
      'Tu joues au cow-boy.',
    ],
    correctRequest:
        'Peux-tu ajouter une note expliquant la fermeture du ticket avant de le marquer résolu ?',
    tip: 'Demander une trace écrite garde la transparence.',
  ),
  MagicWandScenario(
    complaint: 'Tu mets tout en « urgent » dans Jira.',
    requestOptions: [
      'Tu cries au loup.',
      'Serais-tu d\'accord pour n\'utiliser la priorité urgente que pour les incidents bloquants validés en stand-up ?',
      'Tu exagères tout le temps.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour n\'utiliser la priorité urgente que pour les incidents bloquants validés en stand-up ?',
    tip: 'Définir un critère partagé réduit les abus.',
  ),
  MagicWandScenario(
    complaint: 'Tu déconnectes la borne wifi pour brancher ton chargeur.',
    requestOptions: [
      'Tu penses aux autres parfois ?',
      'Peux-tu utiliser la multiprise sous ton bureau plutôt que la borne wifi ?',
      'Tu es invivable.',
    ],
    correctRequest:
        'Peux-tu utiliser la multiprise sous ton bureau plutôt que la borne wifi ?',
    tip: 'Proposer une alternative concrète facilite le changement.',
  ),
  MagicWandScenario(
    complaint: 'Tu réserves le vidéoprojecteur sans le remettre au service IT.',
    requestOptions: [
      'Tu es tête en l\'air.',
      'Peux-tu le rapporter au service IT juste après la réunion de demain ?',
      'Tu ne respectes pas le matériel.',
    ],
    correctRequest:
        'Peux-tu le rapporter au service IT juste après la réunion de demain ?',
    tip: 'Associer l\'action au moment où elle doit se produire.',
  ),
  MagicWandScenario(
    complaint: 'Tu modifies les contrats sans le suivi de versions.',
    requestOptions: [
      'Tu joues avec le légal.',
      'Serais-tu ok pour activer le suivi de versions sur Word avant chaque modification de contrat ?',
      'Tu fais n\'importe quoi.',
    ],
    correctRequest:
        'Serais-tu ok pour activer le suivi de versions sur Word avant chaque modification de contrat ?',
    tip: 'Revenir sur la fonction exacte réduit le risque.',
  ),
  MagicWandScenario(
    complaint: 'Tu poses les colis livrés devant la sortie de secours.',
    requestOptions: [
      'Tu nous mets en danger.',
      'Peux-tu déposer les colis sur l\'étagère de droite en arrivant ?',
      'Tu te fiches de la sécurité.',
    ],
    correctRequest:
        'Peux-tu déposer les colis sur l\'étagère de droite en arrivant ?',
    tip: 'Spécifier le lieu de dépose garantit la conformité.',
  ),
  MagicWandScenario(
    complaint:
        'Tu oublies de quitter la salle de réunion quand ton créneau est fini.',
    requestOptions: [
      'Tu monopolises tout.',
      'Peux-tu quitter la salle cinq minutes avant la fin pour laisser s\'installer l\'équipe suivante ?',
      'Tu es vraiment sans gêne.',
    ],
    correctRequest:
        'Peux-tu quitter la salle cinq minutes avant la fin pour laisser s\'installer l\'équipe suivante ?',
    tip: 'Proposer un tampon temporel fluidifie le planning.',
  ),
  MagicWandScenario(
    complaint:
        'Tu partages les documents sans enlever les commentaires internes.',
    requestOptions: [
      'Tu es négligent.',
      'Peux-tu nettoyer les commentaires avant d\'envoyer le document au client demain ?',
      'Tu n\'as aucun filtre.',
    ],
    correctRequest:
        'Peux-tu nettoyer les commentaires avant d\'envoyer le document au client demain ?',
    tip: 'Rappeler une étape de contrôle protège la relation.',
  ),
  MagicWandScenario(
    complaint:
        'Tu bloques les merges en laissant des reviews en attente pendant des jours.',
    requestOptions: [
      'Tu ralentis tout.',
      'Serais-tu d\'accord pour donner ton go ou une question sous 24h sur les PR assignées ?',
      'Tu fais du zèle.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour donner ton go ou une question sous 24h sur les PR assignées ?',
    tip: 'Fixer un délai clair fluidifie le flux.',
  ),
  MagicWandScenario(
    complaint: 'Tu arrives en réunion sans avoir lu le support.',
    requestOptions: [
      'Tu ne respectes pas les autres.',
      'Peux-tu lire le support et noter deux questions avant notre réunion de mardi ?',
      'Tu fais semblant.',
    ],
    correctRequest:
        'Peux-tu lire le support et noter deux questions avant notre réunion de mardi ?',
    tip: 'Ajout d\'un livrable simple garantit la préparation.',
  ),
  MagicWandScenario(
    complaint: 'Tu envoies les bulletins de salaire par mail non sécurisé.',
    requestOptions: [
      'Tu fais n\'importe quoi !',
      'Peux-tu passer par le coffre-fort numérique pour les bulletins de ce mois-ci ?',
      'Tu es inconscient.',
    ],
    correctRequest:
        'Peux-tu passer par le coffre-fort numérique pour les bulletins de ce mois-ci ?',
    tip: 'Proposer l\'outil adéquat renforce la sécurité.',
  ),
  MagicWandScenario(
    complaint:
        'Tu supprimes les messages du canal incident une fois le problème résolu.',
    requestOptions: [
      'Tu caches les preuves.',
      'Serais-tu ok pour archiver le canal au lieu de supprimer les messages ?',
      'Tu ne respectes rien.',
    ],
    correctRequest:
        'Serais-tu ok pour archiver le canal au lieu de supprimer les messages ?',
    tip: 'Proposer une option qui conserve l\'historique.',
  ),
  MagicWandScenario(
    complaint: 'Tu déconnectes la caméra commune pour tes besoins personnels.',
    requestOptions: [
      'Tu es égoïste.',
      'Peux-tu prévenir sur le canal #studio avant de débrancher la caméra et indiquer quand elle sera remise ?',
      'Tu fais ce que tu veux.',
    ],
    correctRequest:
        'Peux-tu prévenir sur le canal #studio avant de débrancher la caméra et indiquer quand elle sera remise ?',
    tip: 'Informer du timing évite les surprises.',
  ),
  MagicWandScenario(
    complaint:
        'Tu refuses d\'écrire les comptes-rendus parce que « ce n\'est pas ton rôle ».',
    requestOptions: [
      'Tu te crois spécial.',
      'Peux-tu prendre en charge le compte-rendu de demain et je ferai celui de vendredi ?',
      'Tu me fatigues.',
    ],
    correctRequest:
        'Peux-tu prendre en charge le compte-rendu de demain et je ferai celui de vendredi ?',
    tip: 'Proposer un partage équilibré rend la demande plus acceptable.',
  ),
  MagicWandScenario(
    complaint: 'Tu annonces les changements de planning le matin même.',
    requestOptions: [
      'Tu gères ça n\'importe comment.',
      'Serais-tu d\'accord pour prévenir la veille avant 17h quand tu ajustes le planning ?',
      'Tu cherches à nous piéger.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour prévenir la veille avant 17h quand tu ajustes le planning ?',
    tip: 'Préciser un délai minimal réduit le stress.',
  ),
  MagicWandScenario(
    complaint: 'Tu publies les offres d\'emploi avec des fautes.',
    requestOptions: [
      'Tu es négligeant.',
      'Peux-tu faire relire l\'offre par une personne de l\'équipe avant publication ?',
      'Tu fais honte à la marque.',
    ],
    correctRequest:
        'Peux-tu faire relire l\'offre par une personne de l\'équipe avant publication ?',
    tip: 'Intégrer un relecteur assure la qualité.',
  ),
  MagicWandScenario(
    complaint:
        'Tu débranches la station d\'accueil commune pour charger ton téléphone.',
    requestOptions: [
      'Tu abuses.',
      'Peux-tu utiliser la prise murale derrière ton bureau au lieu de la station commune ?',
      'Tu es irrespectueux.',
    ],
    correctRequest:
        'Peux-tu utiliser la prise murale derrière ton bureau au lieu de la station commune ?',
    tip: 'Proposer une alternative pratique favorise le changement.',
  ),
  MagicWandScenario(
    complaint: 'Tu quittes la réunion dès que ton sujet est passé.',
    requestOptions: [
      'Tu es impoli.',
      'Serais-tu ok pour rester jusqu\'à la fin de la réunion hebdo mercredi prochain ?',
      'Tu t\'en fiches des autres.',
    ],
    correctRequest:
        'Serais-tu ok pour rester jusqu\'à la fin de la réunion hebdo mercredi prochain ?',
    tip: 'Clarifier l\'attente de présence complète.',
  ),
  MagicWandScenario(
    complaint: 'Tu refuses de partager tes scripts d\'automatisation.',
    requestOptions: [
      'Tu joues perso.',
      'Peux-tu déposer tes scripts dans le repo outils d\'ici vendredi midi ?',
      'Tu veux garder ton pouvoir.',
    ],
    correctRequest:
        'Peux-tu déposer tes scripts dans le repo outils d\'ici vendredi midi ?',
    tip: 'Nommer l\'emplacement facilite le partage.',
  ),
  MagicWandScenario(
    complaint: 'Tu utilises des gifs bruyants pendant les stand-up.',
    requestOptions: [
      'Tu fais l\'enfant.',
      'Peux-tu éviter les gifs sonores pendant le stand-up de demain matin ?',
      'Tu nous fatigues.',
    ],
    correctRequest:
        'Peux-tu éviter les gifs sonores pendant le stand-up de demain matin ?',
    tip: 'Limiter la demande à un moment réduit.',
  ),
  MagicWandScenario(
    complaint: 'Tu oublies de signaler tes jours de télétravail.',
    requestOptions: [
      'Tu es pénible.',
      'Peux-tu mettre à jour le tableau télétravail le vendredi avant 17h ?',
      'Tu te moques des règles.',
    ],
    correctRequest:
        'Peux-tu mettre à jour le tableau télétravail le vendredi avant 17h ?',
    tip: 'Fixer un créneau hebdo facilite la routine.',
  ),
  MagicWandScenario(
    complaint: 'Tu refuses d\'utiliser le template pour les comptes-rendus.',
    requestOptions: [
      'Tu n\'en fais qu\'à ta tête.',
      'Serais-tu d\'accord pour utiliser le template partagé pour le prochain compte-rendu ?',
      'Tu compliques la vie.',
    ],
    correctRequest:
        'Serais-tu d\'accord pour utiliser le template partagé pour le prochain compte-rendu ?',
    tip: 'Pointer un essai unique peut débloquer la coopération.',
  ),
  MagicWandScenario(
    complaint: 'Tu replies les câbles sans scratch, ils s\'emmêlent tous.',
    requestOptions: [
      'Tu es brouillon.',
      'Peux-tu mettre un scratch sur chaque câble avant de le ranger dans la caisse ?',
      'Tu es désordonné.',
    ],
    correctRequest:
        'Peux-tu mettre un scratch sur chaque câble avant de le ranger dans la caisse ?',
    tip: 'Décrire l\'outil rend le geste précis.',
  ),
  MagicWandScenario(
    complaint: 'Tu lances les emails marketing sans test d\'envoi.',
    requestOptions: [
      'Tu prends des risques.',
      'Peux-tu envoyer un test interne avant la campagne de jeudi ?',
      'Tu es imprudent.',
    ],
    correctRequest:
        'Peux-tu envoyer un test interne avant la campagne de jeudi ?',
    tip: 'Demander une étape de test renforce la qualité.',
  ),
  MagicWandScenario(
    complaint:
        'Tu refuses de mettre les tickets en « terminé » quand c\'est fini.',
    requestOptions: [
      'Tu t\'en fiches du suivi.',
      'Peux-tu déplacer les tickets en « terminé » à la fin de ta journée ?',
      'Tu te prends pour le chef.',
    ],
    correctRequest:
        'Peux-tu déplacer les tickets en « terminé » à la fin de ta journée ?',
    tip: 'Placer la demande à une heure fixe encourage la constance.',
  ),
  MagicWandScenario(
    complaint: 'Tu utilises ton ordinateur perso pour accéder au SI.',
    requestOptions: [
      'Tu vas tout casser.',
      'Serais-tu ok pour utiliser le poste sécurisé de l\'entreprise lorsque tu accèdes au SI ?',
      'Tu es inconscient.',
    ],
    correctRequest:
        'Serais-tu ok pour utiliser le poste sécurisé de l\'entreprise lorsque tu accèdes au SI ?',
    tip: 'Rappeler le matériel dédié protège les données.',
  ),
  MagicWandScenario(
    complaint: 'Tu chuchotes quand tu facilites un atelier.',
    requestOptions: [
      'On n\'entend rien !',
      'Peux-tu utiliser le micro ou parler plus fort lors de l\'atelier de jeudi ?',
      'Tu es ennuyeux.',
    ],
    correctRequest:
        'Peux-tu utiliser le micro ou parler plus fort lors de l\'atelier de jeudi ?',
    tip: 'Proposer deux options laisse du choix.',
  ),
  MagicWandScenario(
    complaint: 'Tu oublies de confirmer les rendez-vous avec les candidats.',
    requestOptions: [
      'Tu es désorganisé.',
      'Peux-tu envoyer une confirmation 24h avant chaque entretien cette semaine ?',
      'Tu ne respectes personne.',
    ],
    correctRequest:
        'Peux-tu envoyer une confirmation 24h avant chaque entretien cette semaine ?',
    tip: 'Fixer un délai précis rassure les candidats.',
  ),
  MagicWandScenario(
    complaint: 'Tu gardes les clés du bureau sur toi tout le week-end.',
    requestOptions: [
      'Tu es irresponsable.',
      'Peux-tu déposer les clés dans le coffre avant de partir le vendredi ?',
      'Tu n\'es pas fiable.',
    ],
    correctRequest:
        'Peux-tu déposer les clés dans le coffre avant de partir le vendredi ?',
    tip: 'Associer l\'action à la sortie du bureau.',
  ),
  MagicWandScenario(
    complaint: 'Tu refuses les réunions de suivi post-livraison.',
    requestOptions: [
      'Tu es fuyant.',
      'Peux-tu prévoir un point de suivi 15 minutes avec le client une semaine après la livraison ?',
      'Tu disparais dès que c\'est fini.',
    ],
    correctRequest:
        'Peux-tu prévoir un point de suivi 15 minutes avec le client une semaine après la livraison ?',
    tip: 'Planifier un format court incite à l\'essayer.',
  ),
  MagicWandScenario(
    complaint:
        'Tu laisses les pulls promo sur les chaises des salles de réunion.',
    requestOptions: [
      'Tu mets le bazar.',
      'Serais-tu d\'accord pour les ranger dans l\'armoire stock en sortant ?',
      'Tu veux décorer ?',
    ],
    correctRequest:
        'Serais-tu d\'accord pour les ranger dans l\'armoire stock en sortant ?',
    tip: 'Identifier le lieu de rangement évite les oublis.',
  ),
  MagicWandScenario(
    complaint: 'Tu refuses d\'indiquer les hypothèses dans ton estimation.',
    requestOptions: [
      'Tu es opaque.',
      'Peux-tu noter les principales hypothèses sous ton estimation dans Jira avant lundi ?',
      'Tu fais le mystérieux.',
    ],
    correctRequest:
        'Peux-tu noter les principales hypothèses sous ton estimation dans Jira avant lundi ?',
    tip: 'Demander la trace écrite augmente la clarté.',
  ),
  MagicWandScenario(
    complaint: 'Tu coupes la parole aux interprètes en atelier international.',
    requestOptions: [
      'Tu manques de respect.',
      'Peux-tu laisser l\'interprète terminer sa phrase avant de reprendre demain ?',
      'Tu es intenable.',
    ],
    correctRequest:
        'Peux-tu laisser l\'interprète terminer sa phrase avant de reprendre demain ?',
    tip: 'Décrire le comportement attendu exactement.',
  ),
  MagicWandScenario(
    complaint: 'Tu refuses de confronter tes idées avec les données.',
    requestOptions: [
      'Tu es dogmatique.',
      'Serais-tu ok pour partager la source de données utilisée avant la réunion stratégie ?',
      'Tu racontes n\'importe quoi.',
    ],
    correctRequest:
        'Serais-tu ok pour partager la source de données utilisée avant la réunion stratégie ?',
    tip: 'Demander une source factuelle nourrit le dialogue.',
  ),
  MagicWandScenario(
    complaint: 'Tu n\'actives pas l\'authentification à deux facteurs.',
    requestOptions: [
      'Tu cherches les ennuis.',
      'Peux-tu activer la double authentification avant vendredi soir ?',
      'Tu t\'en fiches.',
    ],
    correctRequest:
        'Peux-tu activer la double authentification avant vendredi soir ?',
    tip: 'Fixer une deadline renforcée sur la sécurité.',
  ),
  MagicWandScenario(
    complaint: 'Tu prends les décisions sur le pricing sans consulter finance.',
    requestOptions: [
      'Tu fais cavalier seul.',
      'Peux-tu inviter Lucie de la finance au prochain comité pricing jeudi ?',
      'Tu n\'es pas légitime.',
    ],
    correctRequest:
        'Peux-tu inviter Lucie de la finance au prochain comité pricing jeudi ?',
    tip: 'Inclure la personne concernée dans la décision.',
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
    statement:
        'J\'ai travaillé tout le week-end et on ne m\'a même pas remercié.',
    feelingOptions: ['Amer/amère', 'Détendu(e)', 'Enjoué(e)'],
    correctFeeling: 'Amer/amère',
    needOptions: ['Reconnaissance', 'Aventure', 'Autonomie'],
    correctNeed: 'Reconnaissance',
    explanation:
        'Le manque de remerciement fait ressortir un besoin de reconnaissance pour l\'effort fourni.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je ne sais plus sur quoi me concentrer, tout change toutes les heures.',
    feelingOptions: ['Débordé(e)', 'Calme', 'Amusé(e)'],
    correctFeeling: 'Débordé(e)',
    needOptions: ['Clarté', 'Aventure', 'Reconnaissance'],
    correctNeed: 'Clarté',
    explanation:
        'Le flot de changements crée un besoin de clarté et de priorisation.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Depuis que j\'ai présenté cette idée, personne ne m\'a posé de questions.',
    feelingOptions: ['Frustré(e)', 'Soulagé(e)', 'Serein(e)'],
    correctFeeling: 'Frustré(e)',
    needOptions: ['Appartenance', 'Repos', 'Autonomie'],
    correctNeed: 'Appartenance',
    explanation:
        'L\'absence de réactions peut générer de la frustration liée au besoin d\'appartenance ou de feedback.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je n\'arrive pas à me détendre, même quand je rentre chez moi.',
    feelingOptions: ['Tendu(e)', 'Excité(e)', 'Ravi(e)'],
    correctFeeling: 'Tendu(e)',
    needOptions: ['Repos', 'Célébration', 'Sens'],
    correctNeed: 'Repos',
    explanation:
        'L\'incapacité à se détendre indique un besoin de repos et de relâchement.',
  ),
  EmpathyDetectorScenario(
    statement: 'Tout le monde décide pour moi et je dois juste exécuter.',
    feelingOptions: ['Résigné(e)', 'Enthousiaste', 'Serein(e)'],
    correctFeeling: 'Résigné(e)',
    needOptions: ['Autonomie', 'Célébration', 'Aventure'],
    correctNeed: 'Autonomie',
    explanation:
        'Ne pas participer aux décisions touche au besoin d\'autonomie.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis fier de la manière dont on a géré cette crise.',
    feelingOptions: ['Fier/fière', 'Honteux/honteuse', 'Déçu(e)'],
    correctFeeling: 'Fier/fière',
    needOptions: ['Contribution', 'Sécurité', 'Repos'],
    correctNeed: 'Contribution',
    explanation:
        'La fierté évoque le besoin de contribution et d\'utilité reconnue.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je crains que l\'équipe pense que je suis inutile.',
    feelingOptions: ['Inquiet/inquiète', 'Soulagé(e)', 'Amusé(e)'],
    correctFeeling: 'Inquiet/inquiète',
    needOptions: ['Acceptation', 'Aventure', 'Indépendance'],
    correctNeed: 'Acceptation',
    explanation:
        'La peur du regard des autres souligne un besoin d\'acceptation.',
  ),
  EmpathyDetectorScenario(
    statement:
        'On change encore les objectifs, j\'ai l\'impression de repartir de zéro.',
    feelingOptions: ['Découragé(e)', 'Curieux/curieuse', 'Apaisé(e)'],
    correctFeeling: 'Découragé(e)',
    needOptions: ['Prévisibilité', 'Détente', 'Reconnaissance'],
    correctNeed: 'Prévisibilité',
    explanation: 'Les objectifs mouvants touchent le besoin de prévisibilité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me sens seul à porter ce sujet.',
    feelingOptions: ['Isolé(e)', 'Énergisé(e)', 'Apaisé(e)'],
    correctFeeling: 'Isolé(e)',
    needOptions: ['Soutien', 'Autonomie', 'Aventure'],
    correctNeed: 'Soutien',
    explanation:
        'Se sentir seul révèle un besoin de soutien ou de collaboration.',
  ),
  EmpathyDetectorScenario(
    statement: 'Ça fait trois fois qu\'on me coupe la parole en réunion.',
    feelingOptions: ['Agacé(e)', 'Enjoué(e)', 'Soulagé(e)'],
    correctFeeling: 'Agacé(e)',
    needOptions: ['Respect', 'Divertissement', 'Sécurité'],
    correctNeed: 'Respect',
    explanation: 'Les coupures répétées menacent le besoin de respect.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je me demande à quoi ça sert de proposer des idées si personne ne les lit.',
    feelingOptions: ['Découragé(e)', 'Amusé(e)', 'Reconnaissant(e)'],
    correctFeeling: 'Découragé(e)',
    needOptions: ['Impact', 'Repos', 'Sens'],
    correctNeed: 'Impact',
    explanation:
        'Ne pas voir ses idées considérées déclenche un besoin d\'impact et de contribution.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je ne sais pas comment annoncer ça à l\'équipe, j\'ai peur de leur réaction.',
    feelingOptions: ['Anxieux/anxieuse', 'Ravi(e)', 'En colère'],
    correctFeeling: 'Anxieux/anxieuse',
    needOptions: ['Sécurité', 'Amusement', 'Reconnaissance'],
    correctNeed: 'Sécurité',
    explanation:
        'La peur d\'une réaction adverse montre un besoin de sécurité relationnelle.',
  ),
  EmpathyDetectorScenario(
    statement: 'On m\'a donné ce projet sans me demander si j\'avais le temps.',
    feelingOptions: ['Frustré(e)', 'Ravi(e)', 'Serein(e)'],
    correctFeeling: 'Frustré(e)',
    needOptions: ['Autonomie', 'Célébration', 'Amusement'],
    correctNeed: 'Autonomie',
    explanation:
        'Être imposé sur un projet touche le besoin d\'autonomie et de choix.',
  ),
  EmpathyDetectorScenario(
    statement:
        'J\'aurais aimé qu\'on puisse fêter cette victoire tous ensemble.',
    feelingOptions: ['Nostalgique', 'Méfiant(e)', 'Résigné(e)'],
    correctFeeling: 'Nostalgique',
    needOptions: ['Célébration', 'Sécurité', 'Autonomie'],
    correctNeed: 'Célébration',
    explanation: 'Le souhait de fête révèle un besoin de célébration partagée.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je ne dors plus parce que je crains l\'échéance de vendredi.',
    feelingOptions: ['Stressé(e)', 'Amusé(e)', 'Apaisé(e)'],
    correctFeeling: 'Stressé(e)',
    needOptions: ['Clarté', 'Amusement', 'Coopération'],
    correctNeed: 'Clarté',
    explanation:
        'Le stress lié à l\'échéance renvoie à un besoin de clarté et de planification.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je ne peux plus avancer si personne ne me donne de feedback.',
    feelingOptions: ['Frustré(e)', 'Serein(e)', 'Amusé(e)'],
    correctFeeling: 'Frustré(e)',
    needOptions: ['Clarté', 'Soutien', 'Amusement'],
    correctNeed: 'Clarté',
    explanation:
        'Le manque de feedback touche au besoin de clarté pour progresser.',
  ),
  EmpathyDetectorScenario(
    statement: 'J\'ai l\'impression que tout repose sur moi.',
    feelingOptions: ['Débordé(e)', 'Enjoué(e)', 'Fier/fière'],
    correctFeeling: 'Débordé(e)',
    needOptions: ['Soutien', 'Aventure', 'Célébration'],
    correctNeed: 'Soutien',
    explanation:
        'Porter tout seul fait émerger un besoin de soutien et de coresponsabilité.',
  ),
  EmpathyDetectorScenario(
    statement:
        'On n\'a jamais le temps de prendre du recul sur ce que l\'on fait.',
    feelingOptions: ['Pressé(e)', 'Amusé(e)', 'Soulagé(e)'],
    correctFeeling: 'Pressé(e)',
    needOptions: ['Sens', 'Repos', 'Autonomie'],
    correctNeed: 'Sens',
    explanation:
        'Ne pas prendre de recul touche le besoin de sens et de réflexion.',
  ),
  EmpathyDetectorScenario(
    statement: 'J\'ai signé sans comprendre les implications.',
    feelingOptions: ['Inquiet/inquiète', 'Apaisé(e)', 'Énergisé(e)'],
    correctFeeling: 'Inquiet/inquiète',
    needOptions: ['Clarté', 'Amusement', 'Prestige'],
    correctNeed: 'Clarté',
    explanation: 'Ne pas comprendre déclenche un besoin de clarté.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je me réjouis de voir que notre travail sert enfin à quelque chose.',
    feelingOptions: ['Réjoui(e)', 'Coupable', 'Fatigué(e)'],
    correctFeeling: 'Réjoui(e)',
    needOptions: ['Sens', 'Repos', 'Sécurité'],
    correctNeed: 'Sens',
    explanation: 'La joie exprimée vient d\'un besoin de sens nourri.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je ne supporte plus les remarques ironiques sur mon équipe.',
    feelingOptions: ['Agacé(e)', 'Amusé(e)', 'Indifférent(e)'],
    correctFeeling: 'Agacé(e)',
    needOptions: ['Respect', 'Divertissement', 'Autonomie'],
    correctNeed: 'Respect',
    explanation: 'Les remarques ironiques menacent le besoin de respect.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis soulagé que le client ait enfin validé le devis.',
    feelingOptions: ['Soulagé(e)', 'Anxieux/anxieuse', 'Méfiant(e)'],
    correctFeeling: 'Soulagé(e)',
    needOptions: ['Sécurité', 'Aventure', 'Amusement'],
    correctNeed: 'Sécurité',
    explanation:
        'Le soulagement reflète un besoin de sécurité ou de certitude.',
  ),
  EmpathyDetectorScenario(
    statement:
        'J\'ai peur qu\'on nous retire ce budget si on ne montre pas des résultats tout de suite.',
    feelingOptions: ['Anxieux/anxieuse', 'Rassuré(e)', 'Enjoué(e)'],
    correctFeeling: 'Anxieux/anxieuse',
    needOptions: ['Sécurité', 'Célébration', 'Autonomie'],
    correctNeed: 'Sécurité',
    explanation:
        'La peur de perdre le budget pointe le besoin de sécurité financière.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis ravi que tu prennes enfin du recul sur le design.',
    feelingOptions: ['Ravi(e)', 'Énervé(e)', 'Amer/amère'],
    correctFeeling: 'Ravi(e)',
    needOptions: ['Coopération', 'Autonomie', 'Équité'],
    correctNeed: 'Coopération',
    explanation: 'La joie exprimée valorise le besoin de coopération.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me sens totalement perdu devant cette nouvelle interface.',
    feelingOptions: ['Désorienté(e)', 'Amusé(e)', 'Ravi(e)'],
    correctFeeling: 'Désorienté(e)',
    needOptions: ['Apprentissage', 'Repos', 'Célébration'],
    correctNeed: 'Apprentissage',
    explanation:
        'Se dire perdu indique un besoin d\'apprentissage ou d\'accompagnement.',
  ),
  EmpathyDetectorScenario(
    statement:
        'On m\'a critiqué devant tout le monde, j\'ai eu envie de disparaître.',
    feelingOptions: ['Honteux/honteuse', 'Amusé(e)', 'Serein(e)'],
    correctFeeling: 'Honteux/honteuse',
    needOptions: ['Acceptation', 'Aventure', 'Repos'],
    correctNeed: 'Acceptation',
    explanation:
        'La honte ressentie appelle un besoin d\'acceptation et de respect.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je m\'éclate à travailler avec cette équipe, ça me porte.',
    feelingOptions: ['Enthousiaste', 'Épuisé(e)', 'Irrité(e)'],
    correctFeeling: 'Enthousiaste',
    needOptions: ['Appartenance', 'Sécurité', 'Recul'],
    correctNeed: 'Appartenance',
    explanation: 'L\'enthousiasme vient du besoin d\'appartenance nourri.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je n\'en peux plus des urgences qui tombent le vendredi soir.',
    feelingOptions: ['Épuisé(e)', 'Amusé(e)', 'Soulagé(e)'],
    correctFeeling: 'Épuisé(e)',
    needOptions: ['Prévisibilité', 'Aventure', 'Reconnaissance'],
    correctNeed: 'Prévisibilité',
    explanation:
        'Les urgences tardives heurtent le besoin de prévisibilité et d\'équilibre.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me sens super aligné avec cette mission.',
    feelingOptions: ['Aligné(e)', 'Inquiet/inquiète', 'En colère'],
    correctFeeling: 'Aligné(e)',
    needOptions: ['Sens', 'Sécurité', 'Repos'],
    correctNeed: 'Sens',
    explanation: 'Se sentir aligné montre que le besoin de sens est nourri.',
  ),
  EmpathyDetectorScenario(
    statement: 'J\'ai l\'impression de tourner en rond, personne ne tranche.',
    feelingOptions: ['Frustré(e)', 'Rassuré(e)', 'Enjoué(e)'],
    correctFeeling: 'Frustré(e)',
    needOptions: ['Clarté', 'Repos', 'Coopération'],
    correctNeed: 'Clarté',
    explanation: 'L\'absence de décision touche le besoin de clarté.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis tellement content qu\'on m\'ait enfin confié un vrai budget.',
    feelingOptions: ['Reconnaissant(e)', 'Agacé(e)', 'Nerveux/nerveuse'],
    correctFeeling: 'Reconnaissant(e)',
    needOptions: ['Impact', 'Amusement', 'Repos'],
    correctNeed: 'Impact',
    explanation:
        'Recevoir un budget nourrit le besoin d\'impact et de confiance.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je n\'ose plus demander de l\'aide, j\'ai l\'impression de déranger.',
    feelingOptions: ['Anxieux/anxieuse', 'Soulagé(e)', 'Énergisé(e)'],
    correctFeeling: 'Anxieux/anxieuse',
    needOptions: ['Soutien', 'Autonomie', 'Jeu'],
    correctNeed: 'Soutien',
    explanation: 'La peur de déranger révèle un besoin de soutien accueillant.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je ne peux pas me résoudre à livrer un travail bâclé.',
    feelingOptions: ['Déterminé(e)', 'Blasé(e)', 'Distrait(e)'],
    correctFeeling: 'Déterminé(e)',
    needOptions: ['Intégrité', 'Amusement', 'Repos'],
    correctNeed: 'Intégrité',
    explanation:
        'Refuser le bâclé pointe un besoin d\'intégrité et de qualité.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je me sens exposé quand on me demande de parler de mes erreurs devant tout le monde.',
    feelingOptions: ['Vulnérable', 'Ravi(e)', 'Amusé(e)'],
    correctFeeling: 'Vulnérable',
    needOptions: ['Sécurité', 'Célébration', 'Autonomie'],
    correctNeed: 'Sécurité',
    explanation:
        'Se sentir exposé appelle un besoin de sécurité psychologique.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis impatient de tester ces nouvelles idées.',
    feelingOptions: ['Impatient(e)', 'Craintif/craintive', 'Éteint(e)'],
    correctFeeling: 'Impatient(e)',
    needOptions: ['Créativité', 'Repos', 'Reconnaissance'],
    correctNeed: 'Créativité',
    explanation:
        'L\'impatience enthousiaste vise à nourrir un besoin de créativité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je boue que personne ne m\'ait consulté avant de décider.',
    feelingOptions: ['En colère', 'Soulagé(e)', 'Amusé(e)'],
    correctFeeling: 'En colère',
    needOptions: ['Autonomie', 'Repos', 'Aventure'],
    correctNeed: 'Autonomie',
    explanation:
        'Être exclu des décisions touche au besoin d\'autonomie et de respect.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis rassuré de voir que tu as préparé un plan B.',
    feelingOptions: ['Rassuré(e)', 'Amer/amère', 'Irrité(e)'],
    correctFeeling: 'Rassuré(e)',
    needOptions: ['Sécurité', 'Amusement', 'Prestige'],
    correctNeed: 'Sécurité',
    explanation: 'Être rassuré montre que le besoin de sécurité est nourri.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je me sens mal à l\'aise avec la façon dont on répond aux clients.',
    feelingOptions: ['Mal à l\'aise', 'Ravi(e)', 'Enjoué(e)'],
    correctFeeling: 'Mal à l\'aise',
    needOptions: ['Intégrité', 'Repos', 'Amusement'],
    correctNeed: 'Intégrité',
    explanation: 'Le malaise indique un besoin d\'intégrité ou de cohérence.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je trouve ça génial qu\'on prenne enfin le temps d\'écouter les utilisateurs.',
    feelingOptions: ['Énergisé(e)', 'Agacé(e)', 'Abattu(e)'],
    correctFeeling: 'Énergisé(e)',
    needOptions: ['Sens', 'Repos', 'Autonomie'],
    correctNeed: 'Sens',
    explanation:
        'L\'énergie positive vient du besoin de sens nourri par l\'écoute utilisateurs.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis vidé après ces deux semaines de rush.',
    feelingOptions: ['Épuisé(e)', 'Régalé(e)', 'Amusé(e)'],
    correctFeeling: 'Épuisé(e)',
    needOptions: ['Repos', 'Célébration', 'Créativité'],
    correctNeed: 'Repos',
    explanation: 'La fatigue extrême indique un besoin de repos.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis heureux que notre directeur nous ait enfin fait confiance.',
    feelingOptions: ['Reconnaissant(e)', 'Méfiant(e)', 'Énervé(e)'],
    correctFeeling: 'Reconnaissant(e)',
    needOptions: ['Reconnaissance', 'Aventure', 'Clarté'],
    correctNeed: 'Reconnaissance',
    explanation: 'La gratitude vient du besoin de reconnaissance comblé.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je panique dès que je pense aux tests de demain.',
    feelingOptions: ['Anxieux/anxieuse', 'Rassuré(e)', 'Amusé(e)'],
    correctFeeling: 'Anxieux/anxieuse',
    needOptions: ['Clarté', 'Amusement', 'Célébration'],
    correctNeed: 'Clarté',
    explanation: 'La panique montre un besoin de clarté sur la préparation.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis contrarié que nos remarques n\'aient pas été prises en compte.',
    feelingOptions: ['Agacé(e)', 'Soulagé(e)', 'Ravi(e)'],
    correctFeeling: 'Agacé(e)',
    needOptions: ['Impact', 'Repos', 'Divertissement'],
    correctNeed: 'Impact',
    explanation: 'Ne pas être entendu touche au besoin d\'impact ou d\'écoute.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis touché par la manière dont tu as pris soin du client.',
    feelingOptions: ['Ému(e)', 'Amusé(e)', 'Agacé(e)'],
    correctFeeling: 'Ému(e)',
    needOptions: ['Appartenance', 'Prestige', 'Autonomie'],
    correctNeed: 'Appartenance',
    explanation:
        'L\'émotion positive pointe un besoin d\'appartenance et de lien nourri.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me sens trahi qu\'on ait changé le plan sans m\'en parler.',
    feelingOptions: ['Blessé(e)', 'Soulagé(e)', 'Curieux/curieuse'],
    correctFeeling: 'Blessé(e)',
    needOptions: ['Respect', 'Amusement', 'Repos'],
    correctNeed: 'Respect',
    explanation:
        'La trahison ressentie touche au besoin de respect et de confiance.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis impressionné par la qualité de votre rapport.',
    feelingOptions: ['Impressionné(e)', 'Lassé(e)', 'Agacé(e)'],
    correctFeeling: 'Impressionné(e)',
    needOptions: ['Apprentissage', 'Autonomie', 'Sécurité'],
    correctNeed: 'Apprentissage',
    explanation:
        'L\'impression positive nourrit un besoin d\'apprentissage et d\'inspiration.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis tendu dès que je reçois un mail du siège.',
    feelingOptions: ['Tendu(e)', 'Amusé(e)', 'Apaisé(e)'],
    correctFeeling: 'Tendu(e)',
    needOptions: ['Sécurité', 'Célébration', 'Amusement'],
    correctNeed: 'Sécurité',
    explanation:
        'La tension face aux mails reflète un besoin de sécurité ou de clarté.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je me sens complètement à l\'écart depuis que l\'équipe a été réorganisée.',
    feelingOptions: ['Isolé(e)', 'Rassuré(e)', 'Enthousiaste'],
    correctFeeling: 'Isolé(e)',
    needOptions: ['Appartenance', 'Aventure', 'Prestige'],
    correctNeed: 'Appartenance',
    explanation: 'Se sentir à l\'écart révèle un besoin d\'appartenance.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je savoure le fait qu\'on ait enfin du temps pour apprendre.',
    feelingOptions: ['Reconnaissant(e)', 'Agacé(e)', 'Inquiet/inquiète'],
    correctFeeling: 'Reconnaissant(e)',
    needOptions: ['Apprentissage', 'Sécurité', 'Autonomie'],
    correctNeed: 'Apprentissage',
    explanation: 'La gratitude vient du besoin d\'apprentissage nourri.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis frustré que le comité ait balayé le sujet en deux minutes.',
    feelingOptions: ['Frustré(e)', 'Ravi(e)', 'Serein(e)'],
    correctFeeling: 'Frustré(e)',
    needOptions: ['Impact', 'Repos', 'Divertissement'],
    correctNeed: 'Impact',
    explanation: 'Être expédié touche le besoin d\'impact et de considération.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me sens soulagé d\'avoir enfin tout envoyé.',
    feelingOptions: ['Soulagé(e)', 'Méfiant(e)', 'Agacé(e)'],
    correctFeeling: 'Soulagé(e)',
    needOptions: ['Repos', 'Aventure', 'Jeu'],
    correctNeed: 'Repos',
    explanation:
        'Le soulagement indique un besoin de repos comblé après l\'effort.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis dépassé par toutes ces demandes simultanées.',
    feelingOptions: ['Débordé(e)', 'Énergisé(e)', 'Tranquille'],
    correctFeeling: 'Débordé(e)',
    needOptions: ['Clarté', 'Célébration', 'Appartenance'],
    correctNeed: 'Clarté',
    explanation:
        'L\'accumulation de demandes pointe un besoin de clarté sur les priorités.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis heureux qu\'on puisse enfin parler franchement.',
    feelingOptions: ['Rassuré(e)', 'Apathique', 'Méfiant(e)'],
    correctFeeling: 'Rassuré(e)',
    needOptions: ['Authenticité', 'Amusement', 'Repos'],
    correctNeed: 'Authenticité',
    explanation: 'Parler franchement nourrit un besoin d\'authenticité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je ne comprends pas pourquoi on m\'évite sur ce sujet.',
    feelingOptions: ['Perplexe', 'Ravi(e)', 'Indifférent(e)'],
    correctFeeling: 'Perplexe',
    needOptions: ['Clarté', 'Repos', 'Prestige'],
    correctNeed: 'Clarté',
    explanation:
        'Ne pas comprendre la mise à distance touche au besoin de clarté.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me réjouis que tu aies pensé à m\'inclure.',
    feelingOptions: ['Reconnaissant(e)', 'Agacé(e)', 'Méfiant(e)'],
    correctFeeling: 'Reconnaissant(e)',
    needOptions: ['Appartenance', 'Sécurité', 'Autonomie'],
    correctNeed: 'Appartenance',
    explanation: 'Être inclus nourrit le besoin d\'appartenance.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis amer qu\'on attribue mes résultats à quelqu\'un d\'autre.',
    feelingOptions: ['Amer/amère', 'Ravi(e)', 'Apaisé(e)'],
    correctFeeling: 'Amer/amère',
    needOptions: ['Reconnaissance', 'Repos', 'Divertissement'],
    correctNeed: 'Reconnaissance',
    explanation:
        'Être dépossédé de ses résultats touche le besoin de reconnaissance.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis content qu\'on puisse tenter cette expérimentation un peu folle.',
    feelingOptions: ['Excité(e)', 'Lassé(e)', 'Abattu(e)'],
    correctFeeling: 'Excité(e)',
    needOptions: ['Aventure', 'Repos', 'Sécurité'],
    correctNeed: 'Aventure',
    explanation: 'L\'excitation vient du besoin d\'aventure et d\'exploration.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me sens jugé dès que je pose une question.',
    feelingOptions: ['Vulnérable', 'Amusé(e)', 'Soulagé(e)'],
    correctFeeling: 'Vulnérable',
    needOptions: ['Sécurité', 'Jeu', 'Autonomie'],
    correctNeed: 'Sécurité',
    explanation: 'Se sentir jugé active un besoin de sécurité et de respect.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis satisfait du niveau de transparence qu\'on a réussi à instaurer.',
    feelingOptions: ['Satisfait(e)', 'Anxieux/anxieuse', 'Irrité(e)'],
    correctFeeling: 'Satisfait(e)',
    needOptions: ['Authenticité', 'Amusement', 'Repos'],
    correctNeed: 'Authenticité',
    explanation: 'La satisfaction vient du besoin d\'authenticité comblé.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis fatigué de devoir contrôler chaque détail moi-même.',
    feelingOptions: ['Fatigué(e)', 'Amusé(e)', 'Ravi(e)'],
    correctFeeling: 'Fatigué(e)',
    needOptions: ['Soutien', 'Autonomie', 'Aventure'],
    correctNeed: 'Soutien',
    explanation:
        'La fatigue de tout contrôler révèle un besoin de soutien et de partage.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis soucieux qu\'on laisse le client sans nouvelles.',
    feelingOptions: ['Soucieux/soucieuse', 'Enthousiaste', 'Détendu(e)'],
    correctFeeling: 'Soucieux/soucieuse',
    needOptions: ['Fiabilité', 'Amusement', 'Célébration'],
    correctNeed: 'Fiabilité',
    explanation:
        'La préoccupation face au silence touche au besoin de fiabilité.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis fier que nous assumions enfin nos erreurs publiquement.',
    feelingOptions: ['Fier/fière', 'Agacé(e)', 'Fatigué(e)'],
    correctFeeling: 'Fier/fière',
    needOptions: ['Intégrité', 'Repos', 'Sécurité'],
    correctNeed: 'Intégrité',
    explanation: 'Assumer ses erreurs nourrit un besoin d\'intégrité.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis inquiet de ne pas avoir de plan si ce fournisseur lâche.',
    feelingOptions: ['Inquiet/inquiète', 'Curieux/curieuse', 'Enjoué(e)'],
    correctFeeling: 'Inquiet/inquiète',
    needOptions: ['Sécurité', 'Célébration', 'Autonomie'],
    correctNeed: 'Sécurité',
    explanation:
        'L\'inquiétude sur la dépendance révèle un besoin de sécurité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis reconnaissant que tu aies défendu notre équipe.',
    feelingOptions: ['Reconnaissant(e)', 'Agacé(e)', 'Méfiant(e)'],
    correctFeeling: 'Reconnaissant(e)',
    needOptions: ['Solidarité', 'Amusement', 'Aventure'],
    correctNeed: 'Solidarité',
    explanation:
        'La gratitude envers une défense répond au besoin de solidarité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me sens envahi par toutes ces notifications dans la nuit.',
    feelingOptions: ['Irrité(e)', 'Enthousiaste', 'Apaisé(e)'],
    correctFeeling: 'Irrité(e)',
    needOptions: ['Repos', 'Célébration', 'Aventure'],
    correctNeed: 'Repos',
    explanation: 'Les notifications nocturnes heurtent le besoin de repos.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis content que tu aies clarifié les attentes du client.',
    feelingOptions: ['Rassuré(e)', 'Méfiant(e)', 'Agacé(e)'],
    correctFeeling: 'Rassuré(e)',
    needOptions: ['Clarté', 'Aventure', 'Prestige'],
    correctNeed: 'Clarté',
    explanation: 'La clarification nourrit le besoin de clarté.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis inquiet de l\'image que cela donne de nous.',
    feelingOptions: ['Anxieux/anxieuse', 'Ravi(e)', 'Énergisé(e)'],
    correctFeeling: 'Anxieux/anxieuse',
    needOptions: ['Respect', 'Repos', 'Aventure'],
    correctNeed: 'Respect',
    explanation:
        'L\'inquiétude sur l\'image touche au besoin de respect et de crédibilité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis ému que tu aies pris le temps de m\'écouter.',
    feelingOptions: ['Ému(e)', 'Agacé(e)', 'Distrait(e)'],
    correctFeeling: 'Ému(e)',
    needOptions: ['Appartenance', 'Autonomie', 'Célébration'],
    correctNeed: 'Appartenance',
    explanation: 'L\'émotion positive vient du besoin d\'appartenance nourri.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis frustré d\'apprendre les décisions par la presse.',
    feelingOptions: ['Frustré(e)', 'Ravi(e)', 'Serein(e)'],
    correctFeeling: 'Frustré(e)',
    needOptions: ['Clarté', 'Aventure', 'Repos'],
    correctNeed: 'Clarté',
    explanation:
        'Apprendre tard révèle un besoin de clarté et de transparence.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis soulagé de savoir que le plan de secours existe.',
    feelingOptions: ['Soulagé(e)', 'Agacé(e)', 'En colère'],
    correctFeeling: 'Soulagé(e)',
    needOptions: ['Sécurité', 'Amusement', 'Autonomie'],
    correctNeed: 'Sécurité',
    explanation: 'Le plan B comble le besoin de sécurité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me sens démoralisé d\'avoir fait tout ça pour rien.',
    feelingOptions: ['Découragé(e)', 'Ravi(e)', 'Amusé(e)'],
    correctFeeling: 'Découragé(e)',
    needOptions: ['Impact', 'Repos', 'Autonomie'],
    correctNeed: 'Impact',
    explanation: 'Le sentiment de travail inutile touche le besoin d\'impact.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis heureux qu\'on ait tenu nos engagements.',
    feelingOptions: ['Fier/fière', 'Énervé(e)', 'Dépité(e)'],
    correctFeeling: 'Fier/fière',
    needOptions: ['Intégrité', 'Repos', 'Aventure'],
    correctNeed: 'Intégrité',
    explanation: 'Respecter les engagements nourrit l\'intégrité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis préoccupé par le silence du client depuis trois jours.',
    feelingOptions: ['Préoccupé(e)', 'Soulagé(e)', 'Amusé(e)'],
    correctFeeling: 'Préoccupé(e)',
    needOptions: ['Clarté', 'Célébration', 'Jeu'],
    correctNeed: 'Clarté',
    explanation: 'Le silence prolongé suscite un besoin d\'information.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis admiratif de la solidarité de l\'équipe cette semaine.',
    feelingOptions: ['Admiratif/admirative', 'Agacé(e)', 'Blasé(e)'],
    correctFeeling: 'Admiratif/admirative',
    needOptions: ['Appartenance', 'Repos', 'Autonomie'],
    correctNeed: 'Appartenance',
    explanation:
        'L\'admiration parle du besoin d\'appartenance et de solidarité nourri.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me sens dépassé par la complexité du nouveau process.',
    feelingOptions: ['Débordé(e)', 'Enthousiaste', 'Apaisé(e)'],
    correctFeeling: 'Débordé(e)',
    needOptions: ['Structure', 'Aventure', 'Repos'],
    correctNeed: 'Structure',
    explanation: 'La complexité appelle un besoin de structure.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis heureux qu\'on ait retrouvé une ambiance légère.',
    feelingOptions: ['Enjoué(e)', 'Tendu(e)', 'Anxieux/anxieuse'],
    correctFeeling: 'Enjoué(e)',
    needOptions: ['Amusement', 'Stabilité', 'Prestige'],
    correctNeed: 'Amusement',
    explanation: 'L\'ambiance légère nourrit le besoin d\'amusement.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis mal à l\'aise avec le manque de réponses honnêtes.',
    feelingOptions: ['Mal à l\'aise', 'Amusé(e)', 'Énergisé(e)'],
    correctFeeling: 'Mal à l\'aise',
    needOptions: ['Authenticité', 'Aventure', 'Repos'],
    correctNeed: 'Authenticité',
    explanation:
        'Le malaise face au manque de franchise touche l\'authenticité.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis découragé par les retours contradictoires que je reçois.',
    feelingOptions: ['Découragé(e)', 'Ravi(e)', 'Enjoué(e)'],
    correctFeeling: 'Découragé(e)',
    needOptions: ['Clarté', 'Célébration', 'Autonomie'],
    correctNeed: 'Clarté',
    explanation: 'Les retours contradictoires créent un besoin de clarté.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis soulagé que tu m\'aies rappelé avant l\'envoi.',
    feelingOptions: ['Soulagé(e)', 'Agacé(e)', 'Méfiant(e)'],
    correctFeeling: 'Soulagé(e)',
    needOptions: ['Soutien', 'Aventure', 'Prestige'],
    correctNeed: 'Soutien',
    explanation: 'Le rappel apporte un soutien apprécié.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis excité par le potentiel de cette collaboration.',
    feelingOptions: ['Excité(e)', 'Éteint(e)', 'Méfiant(e)'],
    correctFeeling: 'Excité(e)',
    needOptions: ['Aventure', 'Repos', 'Sécurité'],
    correctNeed: 'Aventure',
    explanation:
        'L\'excitation souligne un besoin d\'aventure et d\'exploration.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je me sens rassuré de voir des chiffres concrets.',
    feelingOptions: ['Rassuré(e)', 'Méfiant(e)', 'Énervé(e)'],
    correctFeeling: 'Rassuré(e)',
    needOptions: ['Fiabilité', 'Amusement', 'Autonomie'],
    correctNeed: 'Fiabilité',
    explanation: 'Les chiffres concrets nourrissent un besoin de fiabilité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis fatigué de refaire les mêmes explications.',
    feelingOptions: ['Fatigué(e)', 'Amusé(e)', 'Curieux/curieuse'],
    correctFeeling: 'Fatigué(e)',
    needOptions: ['Soutien', 'Prévisibilité', 'Amusement'],
    correctNeed: 'Soutien',
    explanation:
        'La lassitude des redites touche au besoin de soutien et de relais.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis confiant parce que tout le monde est aligné.',
    feelingOptions: ['Confiant(e)', 'Anxieux/anxieuse', 'Agacé(e)'],
    correctFeeling: 'Confiant(e)',
    needOptions: ['Harmonie', 'Aventure', 'Repos'],
    correctNeed: 'Harmonie',
    explanation: 'La confiance découle d\'un besoin d\'harmonie satisfait.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis triste que personne ne se soit manifesté pour aider.',
    feelingOptions: ['Triste', 'Enjoué(e)', 'Fier/fière'],
    correctFeeling: 'Triste',
    needOptions: ['Solidarité', 'Amusement', 'Autonomie'],
    correctNeed: 'Solidarité',
    explanation: 'L\'absence d\'aide touche le besoin de solidarité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis enthousiaste à l\'idée de co-construire avec eux.',
    feelingOptions: ['Enthousiaste', 'Lassé(e)', 'Méfiant(e)'],
    correctFeeling: 'Enthousiaste',
    needOptions: ['Coopération', 'Repos', 'Prestige'],
    correctNeed: 'Coopération',
    explanation: 'L\'enthousiasme vient du besoin de coopération.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis en colère qu\'on ait ignoré les alertes de l\'équipe terrain.',
    feelingOptions: ['En colère', 'Soulagé(e)', 'Enthousiaste'],
    correctFeeling: 'En colère',
    needOptions: ['Respect', 'Amusement', 'Repos'],
    correctNeed: 'Respect',
    explanation:
        'Ignorer les alertes heurte le besoin de respect pour le terrain.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis apaisé depuis qu\'on a clarifié qui décide.',
    feelingOptions: ['Apaisé(e)', 'Agacé(e)', 'Méfiant(e)'],
    correctFeeling: 'Apaisé(e)',
    needOptions: ['Clarté', 'Aventure', 'Prestige'],
    correctNeed: 'Clarté',
    explanation: 'La clarification du pouvoir nourrit le besoin de clarté.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis nerveux à l\'idée de présenter devant le comité.',
    feelingOptions: ['Nerveux/nerveuse', 'Ravi(e)', 'Apaisé(e)'],
    correctFeeling: 'Nerveux/nerveuse',
    needOptions: ['Soutien', 'Amusement', 'Repos'],
    correctNeed: 'Soutien',
    explanation:
        'La nervosité avant une présentation révèle un besoin de soutien et de préparation.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis satisfait de la manière dont on se répartit les tâches.',
    feelingOptions: ['Satisfait(e)', 'Agacé(e)', 'Abattu(e)'],
    correctFeeling: 'Satisfait(e)',
    needOptions: ['Équité', 'Aventure', 'Prestige'],
    correctNeed: 'Équité',
    explanation: 'La satisfaction exprime un besoin d\'équité comblé.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis inquiet que notre silence soit interprété comme un aveu.',
    feelingOptions: ['Inquiet/inquiète', 'Amusé(e)', 'Apaisé(e)'],
    correctFeeling: 'Inquiet/inquiète',
    needOptions: ['Clarté', 'Jeu', 'Repos'],
    correctNeed: 'Clarté',
    explanation: 'La crainte d\'un malentendu montre un besoin de clarté.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis reconnaissant que tu aies pris en main les relances.',
    feelingOptions: ['Reconnaissant(e)', 'Méfiant(e)', 'Agacé(e)'],
    correctFeeling: 'Reconnaissant(e)',
    needOptions: ['Soutien', 'Aventure', 'Prestige'],
    correctNeed: 'Soutien',
    explanation: 'La gratitude vient du besoin de soutien satisfait.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis vexé que tu aies présenté mon travail sans me citer.',
    feelingOptions: ['Vexé(e)', 'Ravi(e)', 'Apaisé(e)'],
    correctFeeling: 'Vexé(e)',
    needOptions: ['Reconnaissance', 'Repos', 'Jeu'],
    correctNeed: 'Reconnaissance',
    explanation: 'La vexation montre un besoin de reconnaissance.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis heureux qu\'on ait tenu nos budgets sans couper dans la qualité.',
    feelingOptions: ['Fier/fière', 'Agacé(e)', 'Abattu(e)'],
    correctFeeling: 'Fier/fière',
    needOptions: ['Intégrité', 'Amusement', 'Repos'],
    correctNeed: 'Intégrité',
    explanation: 'Respecter qualité et budget nourrit l\'intégrité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis épuisé d\'être sollicité à n\'importe quelle heure.',
    feelingOptions: ['Épuisé(e)', 'Enjoué(e)', 'Ravi(e)'],
    correctFeeling: 'Épuisé(e)',
    needOptions: ['Repos', 'Aventure', 'Prestige'],
    correctNeed: 'Repos',
    explanation:
        'Les sollicitations incessantes menacent le besoin de repos et de limites.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis soulagé de voir que tu prends la responsabilité de l\'erreur.',
    feelingOptions: ['Soulagé(e)', 'Agacé(e)', 'Anxieux/anxieuse'],
    correctFeeling: 'Soulagé(e)',
    needOptions: ['Sécurité', 'Amusement', 'Autonomie'],
    correctNeed: 'Sécurité',
    explanation:
        'La prise de responsabilité renforce le besoin de sécurité et de confiance.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis enthousiaste de voir qu\'on investit enfin dans la formation.',
    feelingOptions: ['Enthousiaste', 'Indifférent(e)', 'Méfiant(e)'],
    correctFeeling: 'Enthousiaste',
    needOptions: ['Apprentissage', 'Repos', 'Prestige'],
    correctNeed: 'Apprentissage',
    explanation:
        'L\'investissement en formation nourrit le besoin d\'apprentissage.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis frustré que tu aies validé sans me consulter.',
    feelingOptions: ['Frustré(e)', 'Ravi(e)', 'Apaisé(e)'],
    correctFeeling: 'Frustré(e)',
    needOptions: ['Autonomie', 'Amusement', 'Sécurité'],
    correctNeed: 'Autonomie',
    explanation: 'La validation sans consultation touche l\'autonomie.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je me sens encouragé parce que tu m\'as fait confiance sur ce dossier.',
    feelingOptions: ['Motivé(e)', 'Démoralisé(e)', 'Irrité(e)'],
    correctFeeling: 'Motivé(e)',
    needOptions: ['Soutien', 'Amusement', 'Prestige'],
    correctNeed: 'Soutien',
    explanation:
        'Se sentir encouragé répond à un besoin de soutien et de confiance.',
  ),
  EmpathyDetectorScenario(
    statement:
        'Je suis rassuré de voir que tu m\'as dit la vérité même si elle est dure.',
    feelingOptions: ['Rassuré(e)', 'Vexé(e)', 'Méfiant(e)'],
    correctFeeling: 'Rassuré(e)',
    needOptions: ['Authenticité', 'Amusement', 'Repos'],
    correctNeed: 'Authenticité',
    explanation: 'La vérité franche nourrit le besoin d\'authenticité.',
  ),
  EmpathyDetectorScenario(
    statement: 'Je suis en colère parce que nos efforts ont été minimisés.',
    feelingOptions: ['En colère', 'Soulagé(e)', 'Ravi(e)'],
    correctFeeling: 'En colère',
    needOptions: ['Reconnaissance', 'Repos', 'Jeu'],
    correctNeed: 'Reconnaissance',
    explanation:
        'La colère ici pointe un besoin de reconnaissance non satisfait.',
  ),
];
