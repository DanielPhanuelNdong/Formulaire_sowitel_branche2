vcodesvue[0] := cudcms.creationvue('identificationcompte', convert_from('La vue d''identification d''un compte utilisateur.', 'WIN1252'));
		vcodesvue[1] := cudcms.creationvue('choixprofilconnexion', convert_from('La vue du choix d''un profil de connexion à un espace de travail.', 'WIN1252'));
vcodesvue[2] := cudcms.creationvue('editionserveys', convert_from('Le formulaire d''édition des serveys.', 'WIN1252'));	
		vcodesvue[3] := cudcms.creationvue('editionservey', convert_from('Le formulaire d''édition d''un servey.', 'WIN1252'));	
		vcodesvue[4] := cudcms.creationvue('editionimages', convert_from('Le formulaire d''édition des images des serveys.', 'WIN1252'));	
		vcodesvue[5] := cudcms.creationvue('editionimage', convert_from('Le formulaire d''édition d''une image d''un servey.', 'WIN1252'));
		vcodesvue[6] := cudcms.creationvue('creationservey', convert_from('Le formulaire de création d''un nouveau servey.', 'WIN1252'));	
		vcodesvue[7] := cudcms.creationvue('modificationservey', convert_from('Le formulaire de modification d''un servey existant.', 'WIN1252'));
		vcodesvue[8] := cudcms.creationvue('creationimage', convert_from('Le formulaire de création d''une nouvelle image d''un servey.', 'WIN1252'));
		vcodesvue[9] := cudcms.creationvue('confirmationcreationservey', convert_from('Le formulaire de confirmation de la création d''un servey.', 'WIN1252'));
		vcodesvue[10] := cudcms.creationvue('confirmationmodificationservey', convert_from('Le formulaire de confirmation de la modification d''un servey.', 'WIN1252'));
		vcodesvue[11] := cudcms.creationvue('confirmationsuppressionservey', convert_from('Le formulaire de confirmation de la suppression d''un servey.', 'WIN1252'));
		vcodesvue[12] := cudcms.creationvue('confirmationsoumissionservey', convert_from('Le formulaire de confirmation de la soumission d''un servey.', 'WIN1252'));
		vcodesvue[13] := cudcms.creationvue('confirmationacceptationservey', convert_from('Le formulaire de confirmation de l''acceptation d''un servey.', 'WIN1252'));
		vcodesvue[14] := cudcms.creationvue('confirmationrejetservey', convert_from('Le formulaire de confirmation du rejet d''un servey.', 'WIN1252'));
		vcodesvue[15] := cudcms.creationvue('confirmationcreationimage', convert_from('Le formulaire de confirmation de la création d''une image d''un servey.', 'WIN1252'));
		vcodesvue[16] := cudcms.creationvue('confirmationsuppressionimage', convert_from('Le formulaire de confirmation de la suppression d''une image d''un servey.', 'WIN1252'));
        vcodesvue[17] := cudcms.creationvue('confirmrefuservey', convert_from('Le formulaire de confirmation du refus d''un servey.', 'WIN1252'));
        vcodesvue[18] := cudcms.creationvue('editionwifis', convert_from('Edition des wifi.', 'WIN1252'));
        vcodesvue[19] := cudcms.creationvue('editionwifi', convert_from('Edition de un wifi.', 'WIN1252'));
        vcodesvue[20] := cudcms.creationvue('creationwifi', convert_from('creation d''un wifi.', 'WIN1252'));
        vcodesvue[21] := cudcms.creationvue('modificationwifi', convert_from('modification d''un wifi.', 'WIN1252'));
        vcodesvue[22] := cudcms.creationvue('confirmationvalidationwifi', convert_from('confirmation de validation d''un wifi.', 'WIN1252'));
        vcodesvue[23] := cudcms.creationvue('confirmationmodificationwifi', convert_from('confirmation de modification d''un wifi.', 'WIN1252'));
        vcodesvue[24] := cudcms.creationvue('confirmationsuppressionwifi', convert_from('confirmation de suppression d''un wifi.', 'WIN1252'));
        


vcodescompo[0] := cudcms.creationcomposant('enteteconnexionweb', convert_from('Entête du formulaire de connexion web.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('logo', convert_from('Logo de Sowitel.'), vcodescompo[0]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('images/logo.png'), vcodeconten);
vcodeconten := cudcms.creationcontenu('titre', convert_from('Titre du formulaire de connexion web.'), vcodescompo[0]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Bienvenue,'), vcodeconten);
	
vcodescompo[1] := cudcms.creationcomposant('formidentificationweb', convert_from('Formulaire d''identification du compte utilisateur.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('soustitre', convert_from('Sous-titre du formulaire d''identification web.'), vcodescompo[1]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Indiquez vos paramètres de connexion, afin d''être identifié.', 'WIN1252'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lblogin', convert_from('Label du champ de saisie du login.'), vcodescompo[1]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Login'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbmdp', convert_from('Label du champ de saisie du mot de passe.'), vcodescompo[1]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Mot de passe'), vcodeconten);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('S''identifier'), vcodeconten);
	
vcodescompo[2] := cudcms.creationcomposant('formchoixprofilconnexionweb', convert_from('Formulaire de choix d''un profil de connexion.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('soustitre', convert_from('Sous-titre du formulaire de choix d''un profil de connexion.'), vcodescompo[2]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Choisissez votre profil de connexion.', 'WIN1252'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbprofils', convert_from('Label du champ de sélection d''un profil.', 'WIN1252'), vcodescompo[2]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Profils'), vcodeconten);
vcodeconten := cudcms.creationcontenu('valbtnvalider', convert_from('Valeur du bouton Valider.'), vcodescompo[2]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('valbtnannuler', convert_from('Valeur du bouton Annuler.'), vcodescompo[2]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);


--composants de la vue Editionserveys.............................................................................

vcodescompo[3] := cudcms.creationcomposant('navbar', convert_from('La barre haute de l''application.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('imgprofil', convert_from('image de profile pour administrateur.'), vcodescompo[3]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('images/avatar.png'), vcodeconten);

vcodescompo[4] := cudcms.creationcomposant('sidebar', convert_from('La barre gauche de l''application.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbgestionserveys', convert_from('Le label gestions serveys.'), vcodescompo[4]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Gestion serveys'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbdeconnexion', convert_from('Bouton pour se decnnecter.'), vcodescompo[4]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Déconnexion'), vcodeconten);

vcodescompo[5] := cudcms.creationcomposant('gestionbar1', convert_from('La barre de gestion sur édition des serveys.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbgestdeserveys', convert_from('Le label gestions des serveys.'), vcodescompo[5]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Gestion des serveys'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbeditserveys', convert_from('Le label pour edition serveys.'), vcodescompo[5]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Edition des serveys'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btncreerservey', convert_from('Le bouton pour la création des serveys.'), vcodescompo[5]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Créer'), vcodeconten);

vcodescompo[6] := cudcms.creationcomposant('espacecontenair', convert_from('Espace contenant les serveys.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lblistserveys', convert_from('Le label pour la liste des serveys.'), vcodescompo[6]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Liste serveys'), vcodeconten);

vcodescompo[7] := cudcms.creationcomposant('tableserveys', convert_from('Le tableau des serveys.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('colnumeros', convert_from('colonne des numéros des serveys.'), vcodescompo[7]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('#'), vcodeconten);
vcodeconten := cudcms.creationcontenu('colnomsites', convert_from('colonne des noms des sites des serveys.'), vcodescompo[7]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Nom du Site'), vcodeconten);
vcodeconten := cudcms.creationcontenu('colvilles', convert_from('colonne des villes des serveys.'), vcodescompo[7]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Ville'), vcodeconten);
vcodeconten := cudcms.creationcontenu('coldates', convert_from('colonne des dates.'), vcodescompo[7]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Date'), vcodeconten);
vcodeconten := cudcms.creationcontenu('colpays', convert_from('colonne des pays.'), vcodescompo[7]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Pays'), vcodeconten);
vcodeconten := cudcms.creationcontenu('colnomreseaux', convert_from('colonne des réseaux.'), vcodescompo[7]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Nom du Réseau'), vcodeconten);

--composants de la vue Editionservey ..............................................................................
--la vue Editionservey contient egalement les composants Navbar et Sidebar

vcodescompo[8] := cudcms.creationcomposant('gestionbar2', convert_from('La barre de gestion sur édition d''un servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbgestunservey', convert_from('Le label pour gestion du servey.'), vcodescompo[8]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Gestion du servey'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbeditunservey', convert_from('le label pour edition du servey.'), vcodescompo[8]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Edition du servey'), vcodeconten);

vcodescompo[9] := cudcms.creationcomposant('enteteservey', convert_from('Partie entete du servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbnomsite', convert_from('Le label du nom du site.'), vcodescompo[9]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Nom du site'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbpays', convert_from('le label du pays.'), vcodescompo[9]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Pays'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbville', convert_from('le label de la ville.'), vcodescompo[9]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Ville'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbdate', convert_from('le label de la date.'), vcodescompo[9]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Date'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbnomreseau', convert_from('le label du nom du reseau.'), vcodescompo[9]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Nom du réseau'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbinfoservey', convert_from('le label informations sur le servey.'), vcodescompo[9]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Information sur le servey'), vcodeconten);

vcodescompo[10] := cudcms.creationcomposant('bodyservey1', convert_from('Partie body 1 du servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbcarateristiques', convert_from('Le label pour la partie caractéristiques.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Caractéristiques'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbimmeuble', convert_from('le label immeuble.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Immeuble ?'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbimbleoui', convert_from('le label immeuble oui'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Oui'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbimblenon', convert_from('le label immeuble non.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Non'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbhauteur', convert_from('le label de la hauteur.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Hauteur'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbdalle', convert_from('le label de dalle.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Dalle ?'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbdaloui', convert_from('le label dalle oui.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Oui'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbdalnon', convert_from('le label dalle non.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Non'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbetatdal', convert_from('le label etats des dalles.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Etats des Dalles'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbsourcelect', convert_from('le label source électrique.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Source électrique ?'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbsourcelectoui', convert_from('le label source électrique oui.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Oui'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbsourcelectnon', convert_from('le label source électrique non.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Non'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbpriseterre', convert_from('le label prise terre.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Prise terre ?'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbpriseterreoui', convert_from('le label prise terre oui.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Oui'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbpriseterrenon', convert_from('le label prise terre non.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Non'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbcoordgps', convert_from('le label coordonnées GPS.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Coordonnées GPS'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lboperateurexist', convert_from('le label opérateur existant.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Opérateur existant ?'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lboperateurexistoui', convert_from('le label opérateur existant oui.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Oui'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lboperateurexistnon', convert_from('le label opérateur existant non.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Non'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lboperateur', convert_from('le label pour l''opérateur existant.'), vcodescompo[10]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Opérateur existant'), vcodeconten);

vcodescompo[11] := cudcms.creationcomposant('bodyservey2', convert_from('Partie body 2 du servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbclientcible', convert_from('Le label pour la partie client cible.'), vcodescompo[11]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Client cible'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbmobile', convert_from('Le label pour mobile.'), vcodescompo[11]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Mobile'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbBtoB', convert_from('le label pour B to B.'), vcodescompo[11]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('B to B'), vcodeconten);

vcodescompo[12] := cudcms.creationcomposant('bodyservey3', convert_from('Partie body 3 du servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbscanperiphwifi', convert_from('Le label pour la partie scan périphériques wifi.'), vcodescompo[12]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Scan périfériques Wifi'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnwifi', convert_from('Le label pour bouton wifi.'), vcodescompo[12]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Wifi'), vcodeconten);

vcodescompo[13] := cudcms.creationcomposant('bodyservey4', convert_from('Partie body 4 du servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbphotos', convert_from('Le label pour photos.'), vcodescompo[13]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Photos'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnphotos', convert_from('bouton photos.'), vcodescompo[13]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Photos'), vcodeconten);

vcodescompo[14] := cudcms.creationcomposant('footerservey', convert_from('Partie footer du servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnmodifservey', convert_from('bouton pour modifier un servey.'), vcodescompo[14]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Modifier'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnsuppservey', convert_from('bouton pour supprimer un servey.'), vcodescompo[14]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Supprimer'), vcodeconten);

--composants de la vue Creationservey.............................................................................
--la vue Créationservey contient egalement les composants Navbar et Sidebar

vcodescompo[15] := cudcms.creationcomposant('Entetecreatservey', convert_from('Partie entete pour création du servey.', 'WIN1252'), null);
--ce composant contient tout le contenu de Enteteservey1 d'aboord, plus d'autres elements tels;
vcodeconten := cudcms.creationcontenu('placenomsite', convert_from('Placeholder du nom du site.'), vcodescompo[15]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Nom du site'), vcodeconten);
vcodeconten := cudcms.creationcontenu('placenomreseau', convert_from('Placeholder du nom du reseau.'), vcodescompo[15]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Nom du réseau'), vcodeconten);

vcodescompo[16] := cudcms.creationcomposant('bodycreatservey1', convert_from('Partie body 1 pour création du servey.', 'WIN1252'), null);
--ce composant contient tout le contenu de bodyservey1 d'aboord, plus d'autres elements tels;
vcodeconten := cudcms.creationcontenu('placehauteur', convert_from('Placeholder pour la hauteur.'), vcodescompo[16]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Hauteur'), vcodeconten);
vcodeconten := cudcms.creationcontenu('placelongitude', convert_from('Placeholder pour longitude.'), vcodescompo[16]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Longitude'), vcodeconten);
vcodeconten := cudcms.creationcontenu('placetatdal', convert_from('Placeholder pour etat des dalles.'), vcodescompo[16]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Etat des dalles'), vcodeconten);
vcodeconten := cudcms.creationcontenu('placelongitude', convert_from('Placeholder pour la longitude.'), vcodescompo[16]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Longitude'), vcodeconten);
vcodeconten := cudcms.creationcontenu('placelatitude', convert_from('Placeholder pour la latitude.'), vcodescompo[16]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Latitude'), vcodeconten);
vcodeconten := cudcms.creationcontenu('placeadresse', convert_from('Placeholder pour adresse.'), vcodescompo[16]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Adresse'), vcodeconten);

vcodescompo[17] := cudcms.creationcomposant('bodycreatservey2', convert_from('Partie body 2 pour création du servey.', 'WIN1252'), null);
--ce composant contient tout le contenu de bodyservey2 d'aboord, plus d'autres elements tels;
vcodeconten := cudcms.creationcontenu('placembile', convert_from('Placeholder pour mobile.'), vcodescompo[17]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Mobile'), vcodeconten);
vcodeconten := cudcms.creationcontenu('placeBtoB', convert_from('Placeholder pour B to B.'), vcodescompo[17]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('B to B'), vcodeconten);

vcodescompo[18] := cudcms.creationcomposant('bodycreatservey4', convert_from('Partie body 4 pour création du servey.', 'WIN1252'), null);
--ce composant contient tout le contenu de bodyservey1 d'aboord, plus d'autres elements tels;
vcodeconten := cudcms.creationcontenu('placedescriptenviron', convert_from('Placeholder pour la description de l''environnement.'), vcodescompo[18]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Description de l''environnement.'), vcodeconten);

vcodescompo[19] := cudcms.creationcomposant('footercreatservey', convert_from('Partie footer pour création du servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnsoumcreatservey', convert_from('bouton pour soumettre la creation de servey.'), vcodescompo[19]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Soumettre'), vcodeconten);

--composants de la vue Modificationservey ..............................................................................
--la vue Modificationservey contient tout les elements de la vue  creationservey plus les composants suivants;

vcodescompo[20] := cudcms.creationcomposant('footermodifservey', convert_from('Partie footer pour la modification du servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnvalidermodifservey', convert_from('bouton pour valider la modification de servey.'), vcodescompo[20]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulermodifservey', convert_from('bouton pour annuler la modification de servey.'), vcodescompo[19]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue Editionimages ..............................................................................
vcodescompo[21] := cudcms.creationcomposant('suppeditionimages', convert_from('suppression image.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnsuppimage', convert_from('bouton pour supprimer une image.'), vcodescompo[21]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);

--composants de la vue Editionimage ..............................................................................
vcodescompo[22] := cudcms.creationcomposant('modaleditionimage', convert_from('Modal pour editer une image.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnback', convert_from('bouton pour retour.'), vcodescompo[22]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('images/cancel.png'), vcodeconten);

--composants de la vue confirmationsuppressionimage ..............................................................................
vcodescompo[23] := cudcms.creationcomposant('confirmsuppimages', convert_from('confirmation de la suppression d''une image.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnvalidsuppimage', convert_from('bouton pour valider la suppression image.'), vcodescompo[23]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulsuppimage', convert_from('bouton pour annuler la suppression image.'), vcodescompo[23]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbconfirmsuppimage', convert_from('label de confirmation de la suppression image.'), vcodescompo[23]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Voulez-vous vraiment supprimer cette image ?'), vcodeconten);

--composants de la vue confirmationcreationservey ..............................................................................
vcodescompo[24] := cudcms.creationcomposant('modalconfirmcreatservey', convert_from('modal de confirmation de la creation servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnvalidconfirmcreatservey', convert_from('bouton pour valider la création servey.'), vcodescompo[24]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulconfirmcreatservey', convert_from('bouton pour annuler la création servey.'), vcodescompo[24]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbmodalconfcreatservey', convert_from('label de confirmation de la creation servey.'), vcodescompo[24]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Voulez-vous vraiment créer ce servey ?'), vcodeconten);

--composants de la vue confirmationmodificationservey ..............................................................................
vcodescompo[25] := cudcms.creationcomposant('confirmodifservey', convert_from('confirmation de la modification servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnvalidconfirmodifservey', convert_from('bouton pour valider la modification servey.'), vcodescompo[25]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulconfirmodifservey', convert_from('bouton pour annuler la modification servey.'), vcodescompo[25]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue confirmationsuppressionservey ..............................................................................
vcodescompo[26] := cudcms.creationcomposant('confirsuppservey', convert_from('confirmation de la suppréssion servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnvalidconfirmodifservey', convert_from('bouton pour valider la suppréssion servey.'), vcodescompo[26]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulconfirmodifservey', convert_from('bouton pour annuler la suppréssion servey.'), vcodescompo[26]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue confirmationsoumissionservey ..............................................................................
vcodescompo[27] := cudcms.creationcomposant('confirmsoumservey', convert_from('confirmation de la soumission servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnvalidconfirmsoumservey', convert_from('bouton pour valider la soumission servey.'), vcodescompo[27]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulconfirmsoumservey', convert_from('bouton pour annuler la soumission servey.'), vcodescompo[27]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue confirmationcreationimage ..............................................................................
vcodescompo[28] := cudcms.creationcomposant('confirmcreatimage', convert_from('confirmation de la creation image.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnvalidconfirmcreatimage', convert_from('bouton pour valider la cnfirmation de creation image.'), vcodescompo[28]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulconfirmcreatimage', convert_from('bouton pour annuler la confirmation de creation image.'), vcodescompo[28]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue confirmationacceptationservey ..............................................................................
vcodescompo[29] := cudcms.creationcomposant('confirmacceptservey', convert_from('confirmation acceptation servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnvalidconfirmacceptservey', convert_from('bouton pour valider acceptation servey.'), vcodescompo[29]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulconfirmacceptservey', convert_from('bouton pour annuler acceptation servey.'), vcodescompo[29]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue confirmationrefuservey ..............................................................................
vcodescompo[30] := cudcms.creationcomposant('confirmrefuservey', convert_from('confirmation refus servey.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnvalidconfirmrefuservey', convert_from('bouton pour valider refus servey.'), vcodescompo[30]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulconfirmrefuservey', convert_from('bouton pour annuler refus servey.'), vcodescompo[30]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue Editionwifis ..............................................................................
vcodescompo[31] := cudcms.creationcomposant('espaceditionwifis', convert_from('espace pour editer wifis.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('numeroeditionwifis', convert_from('numero pour editer wifis.'), vcodescompo[31]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('#'), vcodeconten);
vcodeconten := cudcms.creationcontenu('nomeditionwifis', convert_from('nom pour editer wifis.'), vcodescompo[31]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Nom du Wifi'), vcodeconten);
vcodeconten := cudcms.creationcontenu('frequenceditionwifi', convert_from('frequence pour editer wifis.'), vcodescompo[31]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Fréquence'), vcodeconten);
vcodeconten := cudcms.creationcontenu('canaleditionwifis', convert_from('canal pour editer wifis.'), vcodescompo[31]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Canal'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btncreereditionwifis', convert_from('bouton pour creer wifis.'), vcodescompo[31]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Créer'), vcodeconten);

--composants de la vue Editionwifi ..............................................................................
vcodescompo[32] := cudcms.creationcomposant('espaceditionwifi', convert_from('espace pour editer wifi.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbnomwifi', convert_from('label du nom wifi.'), vcodescompo[32]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Nom du wifi'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbfrequencewifi', convert_from('label de la frequence du wifi.'), vcodescompo[32]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Fréquence'), vcodeconten);
vcodeconten := cudcms.creationcontenu('lbcanalwifi', convert_from('label du canal wifi.'), vcodescompo[32]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Canal'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnmodifwifi', convert_from('bouton pour modifier wifi.'), vcodescompo[32]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Modifier'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnsuppwifi', convert_from('bouton pour supprimer wifi.'), vcodescompo[32]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Supprimer'), vcodeconten);

--composants de la vue Creationwifi ..............................................................................
--la vue Creationwifi contient tout les elements de la vue  Editionwifi plus les composants suivants;
vcodescompo[33] := cudcms.creationcomposant('creatwifi', convert_from('creation du wifi.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('placenomwifi', convert_from('placeholder du nom wifi.'), vcodescompo[33]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Nom du wifi'), vcodeconten);
vcodeconten := cudcms.creationcontenu('placefrequencewifi', convert_from('placeholder de la frequence wifi.'), vcodescompo[32]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Fréquence'), vcodeconten);
vcodeconten := cudcms.creationcontenu('placecanalwifi', convert_from('placeholder du canal wifi.'), vcodescompo[33]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Canal'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnvalidwifi', convert_from('bouton pour valider wifi.'), vcodescompo[33]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulwifi', convert_from('bouton pour annuler wifi.'), vcodescompo[33]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue Modificationwifi ..............................................................................
--la vue Modificationwifi contient tout les elements de la vue  creationwifi;


--composants de la vue confirmationcreationwifi ..............................................................................
vcodescompo[34] := cudcms.creationcomposant('confcreatwifi', convert_from('confirmation de la creation du wifi.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbconfvalidcreatwifi', convert_from('label de confirmation de validation creation wifi.'), vcodescompo[34]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Voulez-vous vraiment creer ce wifi ?'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnconfvalidcreatwifi', convert_from('bouton validation confirmation creation wifi.'), vcodescompo[34]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnconfannulcreatwifi', convert_from('bouton annulation confirmation creation wifi.'), vcodescompo[34]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue confirmationmodificationwifi ..............................................................................
vcodescompo[35] := cudcms.creationcomposant('confmodifwifi', convert_from('confirmation de la modofication du wifi.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbconfvalidmodifwifi', convert_from('label de confirmation de validation modification wifi.'), vcodescompo[35]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Voulez-vous vraiment modifier ce wifi ?'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnconfvalidmodifwifi', convert_from('bouton validation confirmation modification wifi.'), vcodescompo[35]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnconfannulmodifwifi', convert_from('bouton annulation confirmation modification wifi.'), vcodescompo[35]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue confirmationsuppressionwifi ..............................................................................
vcodescompo[36] := cudcms.creationcomposant('confsuppwifi', convert_from('confirmation de la suppression du wifi.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('lbconfvalidsuppwifi', convert_from('label de confirmation de validation suppression wifi.'), vcodescompo[36]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Voulez-vous vraiment supprimer ce wifi ?'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnconfvalidsuppwifi', convert_from('bouton validation confirmation suppression wifi.'), vcodescompo[36]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnconfannulsuppwifi', convert_from('bouton annulation confirmation suppression wifi.'), vcodescompo[36]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);

--composants de la vue creationimage ..............................................................................
vcodescompo[37] := cudcms.creationcomposant('creatimage', convert_from('creation image.', 'WIN1252'), null);
vcodeconten := cudcms.creationcontenu('btnvalidcreatimage', convert_from('bouton pour valider la creation image.'), vcodescompo[37]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Valider'), vcodeconten);
vcodeconten := cudcms.creationcontenu('btnannulcreatimage', convert_from('bouton pour annuler la creation image.'), vcodescompo[37]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Annuler'), vcodeconten);
vcodeconten := cudcms.creationcontenu('placedescriptimage', convert_from('placeholder pour la description image.'), vcodescompo[37]);
vcodevalconten := cudcms.creationvaleurcontenu('fra', convert_from('Description de l''image'), vcodeconten);

call cudcms.mettreajourcomposantsvue(vcodesvue[0], array[vcodescompo[0], vcodescompo[1]]);
		call cudcms.mettreajourcomposantsvue(vcodesvue[1], array[vcodescompo[0], vcodescompo[2]]);


