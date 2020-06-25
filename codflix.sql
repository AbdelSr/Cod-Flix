-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3308
-- Généré le :  jeu. 25 juin 2020 à 16:59
-- Version du serveur :  8.0.18
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `codflix`
--

-- --------------------------------------------------------

--
-- Structure de la table `episode`
--

DROP TABLE IF EXISTS `episode`;
CREATE TABLE IF NOT EXISTS `episode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `season` int(11) NOT NULL,
  `num_episode` int(11) NOT NULL,
  `time_minute` int(20) NOT NULL,
  `summary` longtext NOT NULL,
  `trailer_url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `episode_genre_id_fk_media_id` (`media_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `episode`
--

INSERT INTO `episode` (`id`, `media_id`, `title`, `season`, `num_episode`, `time_minute`, `summary`, `trailer_url`) VALUES
(1, 6, 'Le voyageur', 1, 1, 51, 'Après trois années passées à parcourir les mers, les déserts et la route de la soie, le jeune Marco Polo se retrouve prisonnier du grand Kubilai Khan.', 'https://www.youtube.com/embed/3SKnYDvsQ-c'),
(3, 6, 'Le loup et le cerf', 1, 2, 59, 'L\'empereur est en guerre contre son frère pour régner sur la Mongolie quand Marco apprend que la justice dans la ville impériale des Khan est aussi prompte que tranchante.', 'https://www.youtube.com/embed/3SKnYDvsQ-c'),
(4, 6, 'La loi du grand ciel bleu', 2, 1, 56, 'Kubilai reçoit d\'inquiétantes nouvelles sur les projets de son cousin le jour des noces du prince Jingim. De son côté, Marco Polo doit mener à bien une mission délicate.', 'https://www.youtube.com/embed/3SKnYDvsQ-c'),
(5, 6, 'Dilemme', 2, 2, 54, 'Une bien désagréable surprise attend Marco Polo à son retour à la cour de Kubilai Khan. Le souverain est confronté à un impossible dilemme.', 'https://www.youtube.com/embed/3SKnYDvsQ-c'),
(6, 7, 'Episode 1', 1, 1, 57, 'L\'ambitieux chef de gang Thomas Shelby tombe sur une caisse d\'armes égarée et saute sur l\'occasion pour renforcer son emprise sur la pègre de Birmingham.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(7, 7, 'Episode 2', 1, 2, 57, 'Thomas provoque un gros bonnet local en truquant une course hippique et se met à dos une famille gitane. L\'inspecteur Chester Campbell prend la tête d\'un raid brutal.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(8, 7, 'Episode 3', 1, 3, 55, 'Thomas complote pour se rapprocher de Billy Kimber aux courses de Cheltenham et réfléchit à l\'offre de sympathisants de l\'IRA qui proposent de racheter les armes volées.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(9, 7, 'Episode 4', 1, 4, 58, 'La guerre contre les Lee prend des proportions dramatiques, Thomas doute de la fiancée de son frère, et Campbell fait pression sur le gang pour qu\'ils rendent les armes.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(10, 7, 'Episode 1', 2, 1, 59, 'Quand son pub fétiche est détruit par une bombe, Tommy Shelby, chef de gang de Birmingham, se voit forcé d\'assassiner un dissident irlandais.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(11, 7, 'Episode 2', 2, 2, 57, 'Après avoir assassiné un dissident irlandais, Tommy devient bien malgré lui un pion dans le jeu politique retors de l\'inspecteur Campbell.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(12, 7, 'Episode 3', 2, 3, 58, 'Après être devenu le partenaire en affaires du chef de gang londonien Alfie Solomons, Tommy craint que l\'instabilité d\'Alfie ne pose problème.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(13, 7, 'Episode 4', 2, 4, 57, 'Les Peaky Blinders s\'emparent de l\'Eden Club de Londres. Sabini persuade son vieil adversaire Alfie Solomons de s\'allier à lui pour régler son compte au gang.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(14, 7, 'Episode 1', 3, 1, 55, 'Le jour du mariage de Tommy, un nouvel associé organise une transaction secrète. Arthur a trouvé une femme pieuse et Polly rencontre un homme attirant.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(15, 7, 'Episode 2', 3, 2, 57, 'Une menace imprudente déclenche une guerre. Tommy reçoit une forme de paiement rare, mais il comprend que ses employeurs ont le bras long. Polly commande un portrait.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(16, 7, 'Episode 3', 3, 3, 58, 'En allant au Pays de Galles pour y trouver l\'absolution, Tommy démasque un traître dans la Ligue Économique. Michael joue avec le feu. Arthur reçoit des nouvelles.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(17, 7, 'Episode 4', 3, 4, 54, 'En confiant ses doutes, Polly déclenche une réaction en chaîne qui révèle un piège destiné aux Shelby. Tommy se demande comment sortir de ce dangereux bourbier.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(18, 7, 'Episode 1', 4, 1, 58, 'Noël 1925. La famille Shelby, déchirée, apprend que la mafia new-yorkaise est déterminée à se venger de meurtres commis l\'année précédente.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(19, 7, 'Episode 2', 4, 2, 57, 'Toujours sous le choc, les Shelby se rassemblent à Small Heath, où Tommy appelle à la trêve familiale le temps d\'une offensive contre la mafia.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(20, 7, 'Episode 3', 4, 3, 59, 'Alors que Linda tente de distraire Arthur, ce dernier se retrouve pris au piège. Tommy est confronté à son passé. Polly retrouve une vieille connaissance.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(21, 7, 'Episode 4', 4, 4, 57, 'La mafia tente d\'attirer un membre de la famille Shelby dans son piège, Tommy reçoit la visite d\'une ancienne conquête, et Lizzie fait une découverte inattendue.', 'https://www.youtube.com/embed/OgtBFgqC1KQ'),
(22, 10, 'Flashing Before My Eyes', 1, 1, 22, 'La capacité de Satoru à remonter le temps pour éviter un accident le conduit à l\'hôpital, où il se souvient d\'une fille tuée 18 ans plus tôt.', 'https://www.youtube.com/embed/xpHACNRMiTY'),
(23, 10, 'Palm of the Hand', 1, 2, 22, 'Satoru rencontre de nouveau Kayo lorsqu\'il retourne en 1988. Il essaie d\'empêcher l\'enlèvement de se produire pour sauver sa mère.', 'https://www.youtube.com/embed/xpHACNRMiTY'),
(24, 10, 'Birthmark', 1, 3, 22, 'Satoru répète l\'erreur qu\'il a commise il y a 18 ans et perd la confiance de Kayo. Mais il est assuré de l\'innocence de Yuki lorsqu\'il le rencontre à nouveau.', 'https://www.youtube.com/embed/xpHACNRMiTY'),
(25, 11, 'Pilote', 1, 1, 22, 'Rick part avec Morty chercher des graines de \"méga-arbres\" dans une autre dimension alors que Jerry et Beth se disputent au sujet de l\'influence de Rick sur leur fils.', 'https://www.youtube.com/embed/47Mx_lzJKA8'),
(26, 11, 'I, Croquette', 1, 2, 22, 'Rick invente une machine à rendre Snuffles plus intelligent. Rick et Morty s\'immiscent dans les rêves du professeur de math de Morty.', 'https://www.youtube.com/embed/47Mx_lzJKA8'),
(27, 11, 'Anatomy Park', 1, 3, 22, 'Morty termine dans un étrange parc à thèmes de maladies graves à l\'intérieur du corps d\'un sans-abri. Jerry reçoit la visite de ses parents.', 'https://www.youtube.com/embed/47Mx_lzJKA8'),
(28, 12, 'Travaux pratiques', 1, 1, 22, 'Invité à un match de basket avec une journaliste sportive enceinte, Will se retrouve coincé dans un parking bondé alors qu\'elle commence à accoucher.', 'https://www.youtube.com/embed/FwXEaQXOE58'),
(29, 12, 'Guerre Froide', 1, 2, 23, 'Quand Vivian confine Will et Carlton dans l\'abri de piscine à cause d\'un rhume très contagieux, les garçons passent la nuit à se disputer au sujet d\'une fille.', 'https://www.youtube.com/embed/FwXEaQXOE58'),
(30, 12, 'Très chere maman', 1, 3, 23, 'Will essaie de dire à sa mère qu\'il ne veut pas retourner vivre avec elle à Philadelphie après le lycée.', 'https://www.youtube.com/embed/FwXEaQXOE58');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Horreur'),
(3, 'Science-Fiction'),
(4, 'Animation'),
(5, 'Fantastique'),
(6, 'Comédie');

-- --------------------------------------------------------

--
-- Structure de la table `history`
--

DROP TABLE IF EXISTS `history`;
CREATE TABLE IF NOT EXISTS `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `start_date` datetime NOT NULL,
  `finish_date` datetime DEFAULT NULL,
  `watch_duration` int(11) NOT NULL DEFAULT '0' COMMENT 'in seconds',
  PRIMARY KEY (`id`),
  KEY `history_user_id_fk_media_id` (`user_id`),
  KEY `history_media_id_fk_media_id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genre_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  `release_date` date NOT NULL,
  `summary` longtext NOT NULL,
  `trailer_url` varchar(100) NOT NULL,
  `time_minute` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_genre_id_fk_genre_id` (`genre_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `media`
--

INSERT INTO `media` (`id`, `genre_id`, `title`, `type`, `status`, `release_date`, `summary`, `trailer_url`, `time_minute`) VALUES
(1, 3, 'Star Wars, épisode IV : Un nouvel espoir', 'film', 'publié', '1977-10-19', '\r\nIl y a bien longtemps, dans une galaxie très lointaine. La guerre civile fait rage entre l\'Empire galactique et l\'Alliance rebelle. Capturée par les troupes de choc de l\'Empereur menées par le sombre et impitoyable Dark Vador, la princesse Leia Organa dissimule les plans de l\'Etoile Noire, une station spatiale invulnérable, à son droïde R2-D2 avec pour mission de les remettre au Jedi Obi-Wan Kenobi.', 'https://www.youtube.com/embed/HKQgMXvgxsM', 125),
(2, 1, 'Le Parrain', 'film', 'publié', '1972-10-18', 'En 1945, à New York, les Corleone sont une des 5 familles de la mafia. Don Vito Corleone, `parrain\' de cette famille, marie sa fille à un bookmaker. Sollozzo, `parrain\' de la famille Tattaglia, propose à Don Vito une association dans le trafic de drogue, mais celui-ci refuse. Sonny, un de ses fils, y est quant à lui favorable. Afin de traiter avec Sonny, Sollozzo tente de faire tuer Don Vito, mais celui-ci en réchappe.', 'https://www.youtube.com/embed/X6OJ7MD9YDU', 178),
(3, 1, 'Il était une fois en Amérique', 'film', 'publié', '1984-05-23', 'Anéanti par la perte, Noodles laisse les souvenirs remonter à la surface de sa mémoire dans une fumerie d\'opium du quartier chinois. Quarante ans plus tôt, avec ses amis d\'enfance, ils formaient une bande de gamins débrouillards déjà prêts à affronter tous les dangers pour sortir de la pauvreté. Puis, il y avait la première flamme d\'amour avec l\'inaccessible Deborah. Pour sauver ses amis, il les avait vendus. Cependant, l\'arrestation tourna à la boucherie et tous furent tués.', 'https://www.youtube.com/embed/nHncGNNSDRE', 229),
(4, 1, 'Les Évadés', 'film', 'publié', '1995-03-01', 'En 1947, Andy Dufresne, un jeune banquier, est condamné à la prison à vie pour le meurtre de sa femme et de son amant. Ayant beau clamer son innocence, il est emprisonné à `Shawshank\', le pénitencier le plus sévère de l\'Etat du Maine. Il y fait la rencontre de Red, un homme désabusé, détenu depuis 20 ans. Commence alors une grande histoire d\'amitié entre les deux hommes.', 'https://www.youtube.com/embed/dSL2Ec_0fUs', 142),
(5, 1, 'Will Hunting', 'film', 'publié', '1998-03-04', 'Will Hunting est un authentique génie mais également un rebelle aux élans imprévisibles. Il est né dans le quartier populaire de South Boston et a arrêté très tôt ses études, refusant le brillant avenir que pouvait lui procurer son intelligence. Il vit désormais entouré d\'une bande de copains et passe son temps dans les bars a chercher la bagarre. C\'est alors que ses dons prodigieux en mathématiques attirent l\'attention du professeur Lambeau, du Massachusetts Institute of Technology.', 'https://www.youtube.com/embed/f3v9pRa5dR8', 127),
(6, 5, 'Marco Polo', 'serie', 'publié', '2014-12-12', 'Cupidité, trahison, intrigues sexuelles et rivalités sont au coeur des aventures du héros de Marco Polo, le légendaire explorateur vénitien à la cour de Kubilai Khan.', 'https://www.youtube.com/embed/cDeTPgkOTaQ', NULL),
(7, 1, 'Peaky Blinders', 'serie', 'publié', '2013-09-12', 'Birmingham, en 1919. Un gang familial règne sur un quartier de la ville : les Peaky Blinders, ainsi nommés pour les lames de rasoir qu\'ils cachent dans la visière de leur casquette.', 'https://www.youtube.com/embed/oVzVdvGIC7U', NULL),
(10, 4, 'Erased', 'serie', 'publié', '2013-09-12', 'Erased est un seinen manga de Kei Sanbe, prépublié dans le magazine Young Ace de l\'éditeur Kadokawa Shoten entre juin 2012 et mars 2016 et compilé en huit volumes reliés entre janvier 2013 et mai 2016.', 'https://www.youtube.com/embed/jTOyQJuZuy4', NULL),
(11, 4, 'Rick & Morty', 'serie', 'publié', '2013-09-12', 'Rick est un vieil homme déséquilibré mais doué en sciences, qui a récemment renoué avec sa famille. Il passe le plus clair de son temps à entraîner son petit-fils Morty à réaliser des expériences extraordinaires mais dangereuses.', 'https://www.youtube.com/embed/JLuLEvQ-RW0', NULL),
(12, 6, 'Le prince de Bel-Air', 'serie', 'publié', '2004-09-12', 'Sur les conseils de sa mère, Will, un adolescent de 17 ans, quitte Philadelphie et son milieu modeste pour s\'installer chez sa tante et son oncle à Los Angeles, afin d\'avoir de meilleures chances de réussite dans la vie.', 'https://www.youtube.com/embed/WoxlBQrFDBQ', NULL),
(13, 4, 'Le voyage de chihiro', 'film', 'publié', '2004-09-12', 'La petite Chihiro accompagne ses parents dans une promenade sylvestre qui doit les conduire vers leur nouvelle maison en banlieue. Alors qu\'elle prend un raccourci à travers un tunnel peu emprunté, la petite famille se retrouve soudain en territoire inconnu. Le temps de retrouver leur chemin, ils font une halte dans un gigantesque restaurant en plein air, totalement déserté.', 'https://www.youtube.com/embed/5-cro68n7CE', 125),
(14, 2, 'Conjuring, les dossiers Warren', 'film', 'publié', '2004-09-12', 'La petite Chihiro accompagne ses parents dans une promenade sylvestre qui doit les conduire vers leur nouvelle maison en banlieue. Alors qu\'elle prend un raccourci à travers un tunnel peu emprunté, la petite famille se retrouve soudain en territoire inconnu. Le temps de retrouver leur chemin, ils font une halte dans un gigantesque restaurant en plein air, totalement déserté.', 'https://www.youtube.com/embed/Mkf9rGLXeuE', 112),
(15, 6, 'Very Bad Trip', 'film', 'publié', '2008-09-12', 'Trois jeunes hommes cherchent un ami qui a disparu au cours d\'une super fête à Las Vegas. Le trio doit tenter de se souvenir de toutes les mauvaises décisions prises la veille afin de retrouver leur ami et le ramener à temps pour son mariage prévu à Los Angeles.', 'https://www.youtube.com/embed/hHqR9Tq16_E', 108);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `password` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `password`) VALUES
(4, 'abdel12345@gmail.com', 'cf0461154c91c85275cbf98074832dcf2ad59f9a9f2ab11f8189e4cea6fdd323'),
(5, 'coding@gmail.com', '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
(6, 'yacinovic@gmail.com', '494414ded24da13c451b13b424928821351c78fce49f93d9e1b55f102790c206'),
(7, 'abdel2@gmail.com', 'eef0c396c1a2c19d3119217a759fad0d6ab57465cb9241e80277378bfd970236'),
(8, 'abcd@gmail.com', '9adfb0a6d03beb7141d8ec2708d6d9fef9259d12cd230d50f70fb221ae6cabd5'),
(9, 'abdelito@gmail.com', 'd4b3dfbf113cc8b2f6fd71bcb24b761d04b47c04a59b22a2a7db91b275542892');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `episode`
--
ALTER TABLE `episode`
  ADD CONSTRAINT `media_id_fk_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_media_id_fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_user_id_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `media_genre_id_b1257088_fk_genre_id` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
