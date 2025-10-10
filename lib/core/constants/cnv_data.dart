/// Listes de données statiques pour l'application CNV Coach.

// Une carte associant des sentiments généraux à des nuances plus spécifiques.
const Map<String, List<Map<String, String>>> feelingsData = {
  'Joyeux': [
    {'name': 'Accompli', 'definition': 'Qui a réussi, qui a atteint son objectif.'},
    {'name': 'Reconnaissant', 'definition': 'Qui exprime de la gratitude, qui est conscient d\'un bienfait reçu.'},
    {'name': 'Heureux', 'definition': 'Qui ressent de la joie, du bien-être.'},
    {'name': 'Optimiste', 'definition': 'Qui a tendance à voir le bon côté des choses, à espérer un dénouement favorable.'},
    {'name': 'Fier', 'definition': 'Qui ressent de la satisfaction ou de l\'orgueil pour soi-même ou pour quelque chose qui lui est lié.'},
    {'name': 'Confiant', 'definition': 'Qui a de l\'assurance, qui croit en ses capacités ou en celles d\'autrui.'},
    {'name': 'Inspiré', 'definition': 'Qui est stimulé par une idée créative, qui est sous l\'influence d\'une force créatrice.'},
  ],
  'Triste': [
    {'name': 'Déçu', 'definition': 'Qui ressent de la déception, de l\'insatisfaction parce que ses attentes ou ses espoirs n\'ont pas été réalisés.'},
    {'name': 'Vulnérable', 'definition': 'Qui peut être facilement blessé, attaqué, ou qui est dans une situation de faiblesse physique ou morale.'},
    {'name': 'Seul', 'definition': 'Qui est sans compagnie, isolé, ou qui est unique.'},
    {'name': 'Mélancolique', 'definition': 'Qui éprouve une tristesse vague, une rêverie teintée de tristesse, ou qui a une humeur sombre.'},
    {'name': 'Abattu', 'definition': 'Qui est très fatigué, épuisé, ou moralement découragé et triste.'},
    {'name': 'Fatigué', 'definition': 'Qui ressent un manque de force ou d\'énergie après un effort physique ou intellectuel, et qui a besoin de repos.'},
  ],
  'En colère': [
    {'name': 'Frustré', 'definition': 'Qui est insatisfait ou déçu parce qu\'un désir ou une attente n\'a pas été réalisé.'},
    {'name': 'Irrité', 'definition': 'Qui est en colère, énervé ou agacé par quelque chose.'},
    {'name': 'Agacé', 'definition': 'Qui est énervé, impatienté ou légèrement irrité par quelque chose ou quelqu\'un.'},
    {'name': 'Ressentiment', 'definition': 'Un sentiment de colère profonde, d\'amertume ou de rancune que l\'on garde après avoir subi un tort ou une injustice, souvent avec un désir de vengeance.'},
    {'name': 'Jaloux', 'definition': 'Qui envie les avantages, la supériorité ou les succès d\'autrui.'},
    {'name': 'Contrarié', 'definition': 'Qui est mécontent, fâché ou déçu à cause d\'obstacles, de difficultés ou de quelque chose qui va à l\'encontre de ses projets ou de ses désirs.'},
  ],
  'Peur': [
    {'name': 'Anxieux', 'definition': 'Qui éprouve de l\'anxiété, c\'est-à-dire une inquiétude intense et un sentiment d\'appréhension face à un événement futur, souvent indéterminé.'},
    {'name': 'Inquiet', 'definition': 'Qui est troublé ou agité dans son esprit par la crainte, l\'incertitude ou l\'appréhension d\'un malheur.'},
    {'name': 'Nerveux', 'definition': 'Qui a les nerfs sensibles, irritables, ou qui est sujet à des tensions psychologiques et est trop émotif.'},
    {'name': 'Stressé', 'definition': 'Qui est soumis à une tension physique ou psychologique due à des pressions ou contraintes de l\'environnement.'},
    {'name': 'Insécurisé', 'definition': 'Qui n\'est pas dans un état de sûreté ou de protection, ou qui éprouve un sentiment d\'insécurité.'},
    {'name': 'Paniqué', 'definition': 'Qui est frappé d\'une peur soudaine, intense et irraisonnée, perdant ses moyens et son sang-froid.'},
  ],
  'Surpris': [
    {'name': 'Étonné', 'definition': 'Surpris par quelque chose d\'inattendu.'},
    {'name': 'Choqué', 'definition': 'Profondément affecté ou bouleversé par un événement ou une nouvelle.'},
    {'name': 'Confus', 'definition': 'Qui ne comprend pas bien une situation, ou qui est embarrassé.'},
    {'name': 'Déconcerté', 'definition': 'Désorienté ou troublé, ne sachant plus comment réagir.'},
  ],
  'Dégoûté': [
    {'name': 'Répugné', 'definition': 'Inspirer du dégoût, de l\'aversion physique ou morale à quelqu\'un.'},
    {'name': 'Aversion', 'definition': 'Un sentiment d\'antipathie violente, un profond dégoût pour quelque chose ou quelqu\'un.'},
    {'name': 'Mépris', 'definition': 'Un sentiment par lequel on considère quelqu\'un ou quelque chose comme indigne d\'estime, de considération, ou moralement condamnable.'},
  ],
};

// Liste des besoins fondamentaux selon la CNV.
const List<Map<String, String>> needsData = [
  // Connexion
  {'name': 'Acceptation', 'definition': 'Reconnaître et accueillir une personne ou une situation telle qu\'elle est, sans jugement.'},
  {'name': 'Affection', 'definition': 'Un sentiment de tendresse et d\'attachement envers quelqu\'un.'},
  {'name': 'Appréciation', 'definition': 'Reconnaître la valeur, le mérite ou les qualités de quelqu\'un ou de quelque chose.'},
  {'name': 'Appartenance', 'definition': 'Le sentiment d\'être partie intégrante d\'un groupe, d\'un lieu ou d\'une communauté.'},
  {'name': 'Coopération', 'definition': 'Travailler ensemble avec d\'autres pour atteindre un objectif commun.'},
  {'name': 'Communication', 'definition': 'L\'échange d\'informations, d\'idées ou de sentiments entre personnes.'},
  {'name': 'Proximité', 'definition': 'La proximité physique ou émotionnelle entre des individus.'},
  {'name': 'Communauté', 'definition': 'Un groupe de personnes partageant des intérêts, des valeurs ou un lieu de vie.'},
  {'name': 'Compagnie', 'definition': 'La présence d\'une ou plusieurs personnes, souvent pour éviter la solitude.'},
  {'name': 'Empathie', 'definition': 'La capacité de comprendre et de partager les sentiments d\'une autre personne.'},
  {'name': 'Inclusion', 'definition': 'Le fait d\'intégrer et de faire participer tout le monde, sans exclusion.'},
  {'name': 'Intimité', 'definition': 'Une connexion profonde et personnelle, souvent caractérisée par la confiance et la vulnérisation.'},
  {'name': 'Amour', 'definition': 'Un sentiment profond d\'affection, de soin et d\'attachement intense envers quelqu\'un.'},
  {'name': 'Respect', 'definition': 'Considération et estime envers une personne, ses droits ou ses sentiments.'},
  {'name': 'Sécurité émotionnelle', 'definition': 'Le sentiment d\'être en sûreté, protégé et accepté dans ses émotions.'},
  {'name': 'Soutien', 'definition': 'L\'aide, l\'encouragement ou l\'assistance apportés à quelqu\'un.'},
  {'name': 'Confiance', 'definition': 'La ferme croyance en la fiabilité, la vérité ou la capacité de quelqu\'un ou de quelque chose.'},
  {'name': 'Compréhension', 'definition': 'La capacité de saisir le sens, la nature ou les raisons de quelque chose ou de quelqu\'un.'},

  // Bien-être physique
  {'name': 'Air frais', 'definition': 'L\'air extérieur, non confiné, souvent considéré comme plus pur et bénéfique pour la santé.'},
  {'name': 'Nourriture', 'definition': 'Tout ce qui est mangé pour maintenir la vie, fournir de l\'énergie et des nutriments.'},
  {'name': 'Mouvement/Exercice', 'definition': 'L\'activité physique qui sollicite le corps, améliore la condition physique et la santé.'},
  {'name': 'Repos/Sommeil', 'definition': 'Période d\'inactivité physique et mentale nécessaire à la récupération de l\'organisme.'},
  {'name': 'Sécurité physique', 'definition': 'L\'état de protection contre les dangers, les menaces ou les blessures corporelles.'},
  {'name': 'Abri', 'definition': 'Un lieu ou une structure qui offre une protection contre les éléments extérieurs ou les dangers.'},
  {'name': 'Contact physique', 'definition': 'L\'action de toucher ou d\'être touché par une autre personne ou un être vivant, souvent associé à l\'affection ou au soutien.'},
  {'name': 'Eau', 'definition': 'Liquide essentiel à la vie, indispensable à l\'hydratation et à de nombreuses fonctions biologiques.'},

  // Honnêteté
  {'name': 'Authenticité', 'definition': 'Être vrai, sincère et fidèle à soi-même, sans prétention ni artifice.'},
  {'name': 'Intégrité', 'definition': 'Agir avec honnêteté, moralité et cohérence, en respectant ses principes et ses valeurs.'},
  {'name': 'Présence', 'definition': 'Être pleinement conscient et attentif au moment présent, à son environnement et aux personnes qui nous entourent.'},

  // Jeu
  {'name': 'Joie', 'definition': 'Un sentiment de bonheur intense et agréable.'},
  {'name': 'Humour', 'definition': 'La capacité à percevoir, exprimer ou apprécier ce qui est drôle ou amusant.'},

  // Paix
  {'name': 'Beauté', 'definition': 'Qualité de ce qui est agréable à voir, à entendre ou à penser.'},
  {'name': 'Communion', 'definition': 'Partage intime de sentiments, d\'idées ou d\'expériences entre plusieurs personnes.'},
  {'name': 'Aisance', 'definition': 'Facilité, naturel dans les manières, le mouvement ou l\'expression.'},
  {'name': 'Égalité', 'definition': 'Caractère de ce qui est identique ou de même valeur, sans distinction ni privilège.'},
  {'name': 'Harmonie', 'definition': 'Accord agréable et équilibré entre différentes parties ou éléments.'},
  {'name': 'Inspiration', 'definition': 'Idée ou impulsion créatrice soudaine qui pousse à l\'action ou à la création.'},
  {'name': 'Ordre', 'definition': 'Disposition logique et méthodique des choses ou des événements.'},

  // Autonomie
  {'name': 'Choix', 'definition': 'La possibilité de sélectionner une option parmi plusieurs.'},
  {'name': 'Liberté', 'definition': 'La capacité d\'agir et de penser sans contrainte, selon sa propre volonté.'},
  {'name': 'Indépendance', 'definition': 'L\'état de ne pas dépendre d\'autrui, d\'être autonome.'},
  {'name': 'Espace', 'definition': 'Une étendue disponible ou une zone délimitée.'},
  {'name': 'Spontanéité', 'definition': 'Le fait d\'agir ou de réagir de manière naturelle et immédiate, sans préméditation.'},

  // Sens
  {'name': 'Conscience', 'definition': 'La capacité de percevoir, de sentir ou de savoir.'},
  {'name': 'Célébration', 'definition': 'L\'action de fêter un événement ou une occasion spéciale.'},
  {'name': 'Défi', 'definition': 'Une situation difficile qui demande des efforts pour être surmontée.'},
  {'name': 'Clarté', 'definition': 'La qualité d\'être clair, facile à comprendre ou transparent.'},
  {'name': 'Compétence', 'definition': 'La capacité à faire quelque chose avec succès ou efficacité.'},
  {'name': 'Contribution', 'definition': 'L\'action d\'apporter sa part à un effort commun ou à un résultat.'},
  {'name': 'Créativité', 'definition': 'La capacité d\'inventer, d\'imaginer ou de produire des idées ou des choses nouvelles.'},
  {'name': 'Découverte', 'definition': 'L\'action de trouver quelque chose d\'inconnu ou de nouveau.'},
  {'name': 'Efficacité', 'definition': 'La capacité d\'atteindre un objectif avec le minimum de ressources.'},
  {'name': 'Croissance', 'definition': 'Le processus d\'augmentation en taille, en développement ou en importance.'},
  {'name': 'Espoir', 'definition': 'Le sentiment d\'attendre avec confiance que quelque chose de positif se produise.'},
  {'name': 'Apprentissage', 'definition': 'L\'acquisition de connaissances ou de compétences par l\'étude ou l\'expérience.'},
  {'name': 'Deuil', 'definition': 'La douleur ou la tristesse ressentie après la perte de quelqu\'un ou de quelque chose d\'important.'},
  {'name': 'Participation', 'definition': 'L\'action de prendre part à quelque chose.'},
  {'name': 'But', 'definition': 'L\'objectif ou la finalité que l\'on cherche à atteindre.'},
  {'name': 'Auto-expression', 'definition': 'L\'action de communiquer ses pensées, ses sentiments ou sa personnalité.'},
  {'name': 'Stimulation', 'definition': 'L\'action d\'encourager ou d\'activer quelque chose ou quelqu\'un.'},
  {'name': 'Faire une différence', 'definition': 'L\'action d\'avoir un impact positif ou significatif sur une situation ou sur les autres.'},
];
