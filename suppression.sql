-- ======== Creation de la table rejetservey
-- ==========================================================================================================================================
drop procedure if exists srservey.creerejetservey(public.identifiant, timestamp);
drop table if exists srservey.rejetservey;


-- ======== Creation de la table acceptationservey
-- ==========================================================================================================================================
drop procedure if exists srservey.ajouteracceptationservey(public.identifiant, timestamp);
drop table if exists srservey.acceptationservey;

-- ======== Creation de la table soumissionservey
-- ==========================================================================================================================================
drop procedure if exists srservey.ajoutersoumissionservey(public.identifiant, timestamp);
drop table if exists srservey.soumissionservey;

-- ======== Creation de la table wifiservey
-- ==========================================================================================================================================
drop function if exists srservey.obtentionwifiservey(public.identifiant);
drop procedure if exists srservey.retirerwifiservey(public.identifiant, public.identifiant);
drop procedure if exists srservey.ajouterwifiservey(public.identifiant, public.identifiant);
drop table if exists srservey.wifiservey;


-- ======== Creation de la table servey
-- ==========================================================================================================================================
drop function if exists srservey.rechercheserveys(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srservey.obtentionserveyresposervey(public.identifiant);
drop function if exists srservey.obtentionservey(public.identifiant);
drop procedure if exists srservey.mettreajourejetservey(public.identifiant, public.etat, timestamp);
drop procedure if exists srservey.mettreajouracceptationservey(public.identifiant, public.etat, timestamp);
drop procedure if exists srservey.mettreajoursoumissionservey(public.identifiant, public.etat, timestamp);
drop procedure if exists srservey.mettreajourservey(public.identifiant, public.libelle, date, public.identifiant, public.identifiant, numeric, numeric, public.identifiant, timestamp);
drop procedure if exists srservey.ajouterservey(public.identifiant, public.etat, public.libelle, date, public.identifiant, public.identifiant, numeric, numeric, public.identifiant, public.etat, public.enaturelnn, timestamp);
drop table if exists srservey.servey;


-- ======== Creation de la table operateursite
-- ==========================================================================================================================================
drop function if exists srservey.obtentionoperateursite(public.identifiant);
drop procedure if exists srservey.retireroperateursite(public.identifiant, public.identifiant);
drop procedure if exists srservey.ajouteroperateursite(public.identifiant, public.identifiant);
drop table if exists srservey.operateursite;


-- ======== Creation de la table photosite
-- ==========================================================================================================================================
drop function if exists srservey.obtentionphotosite(public.identifiant);
drop procedure if exists srservey.retirerphotosite(public.identifiant, public.identifiant);
drop procedure if exists srservey.ajouterphotosite(public.identifiant, public.identifiant);
drop table if exists srservey.photosite;


-- ======== Creation de la table site
-- ==========================================================================================================================================
drop function if exists srservey.recherchesites(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srservey.obtentionsite(public.identifiant);
drop procedure if exists srservey.mettreajoursite(public.identifiant, public.libelle, boolean, numeric, boolean, public.libelle, boolean, boolean, boolean, numeric(25,20), numeric(25,20), public.libelle, public.libelle, timestamp);
drop procedure if exists srservey.ajoutersite(public.identifiant, public.libelle, boolean, numeric, boolean, public.libelle, boolean, boolean, boolean, numeric(25,20), numeric(25,20), public.libelle, public.libelle, public.etat, public.enaturelnn, timestamp);
drop table if exists srservey.site;


-- ======== Creation de la table photo
-- ==========================================================================================================================================
drop function if exists replace srservey.recherchephotos(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srservey.obtentionphoto(public.identifiant);
drop procedure if exists srservey.mettreajourphoto(public.identifiant, public.libelle, timestamp)
drop procedure if exists srservey.ajouterphoto(public.identifiant, public.libelle, public.identifiant, public.etat, public.enaturelnn, timestamp)
drop table if exists srservey.photo;


-- ======== Creation de la table wifi
-- ==========================================================================================================================================
drop function if exists srservey.recherchewifis(public.libelle, public.enaturel, public.enaturelnn)
drop function if exists srservey.obtentionwifi(public.identifiant)
drop procedure if exists srservey.mettreajourwifi(public.identifiant, public.libelle, public.nom, public.nom, timestamp)
drop procedure if exists srservey.ajouterwifi(public.identifiant, public.libelle, public.nom, public.nom, public.etat, public.enaturelnn, timestamp)
drop table if exists srservey.wifi;


-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du schema srsurvey
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists srservey;



-- ======== Creation de la table rejetservey
-- ==========================================================================================================================================
drop trigger if exists ajoutrejetservey on cudservey.rejetservey;
drop function if exists cudservey.aftercreerejetservey();
drop procedure if exists cudservey.creerejetservey(public.identifiant);
drop table if exists cudservey.rejetservey;


-- ======== Creation de la table acceptationservey
-- ==========================================================================================================================================
drop trigger if exists ajoutacceptationservey on cudservey.acceptationservey ;
drop function if exists cudservey.aftercreeracceptationservey();
drop procedure if exists cudservey.creeracceptationservey(public.identifiant);
drop table if exists cudservey.acceptationservey;


-- ======== Creation de la table soumissionservey
-- ==========================================================================================================================================
drop trigger if exists ajoutsoumissionservey on cudservey.soumissionservey; ;
drop function if exists cudservey.aftercreersoumissionservey();
drop table if exists cudservey.soumissionservey;


-- ======== Creation de la table wifiservey
-- ==========================================================================================================================================
drop trigger if exists ajoutwifiservey on cudservey.wifiservey;
drop function if exists cudservey.aftersupprimerwifiservey();
drop trigger if exists retraitwifiservey on cudservey.wifiservey;
drop function if exists cudservey.aftersupprimerwifiservey();
drop procedure if exists cudservey.mettreajourwifiservey(public.identifiant, public.identifiant[]);
drop table if exists cudservey.wifiservey;


-- ======== creation de la table servey
-- ==========================================================================================================================================
drop trigger if exists suppressionservey on cudservey.servey;
drop function if exists cudservey.aftersuppressionservey();
drop trigger if exists miseajourservey on cudservey.servey;
drop function if exists cudservey.aftermiseajourservey();
drop procedure if exists cudservey.supprimerservey(public.identifiant);
drop procedure if exists cudservey.rejeterservey(public.identifiant);
drop procedure if exists cudservey.accepterservey(public.identifiant);
drop procedure if exists cudservey.soumettreservey(public.identifiant);
drop procedure if exists cudservey.modifierservey(public.identifiant, public.libelle, date, public.identifiant, public.identifiant, numeric, numeric, public.identifiant[], public.libelle, boolean, numeric, boolean, public.libelle, boolean, boolean, boolean, public.identifiant[], numeric(25,20), numeric(25,20), public.libelle, public.libelle, public.identifiant[])
drop trigger if exists ajoutservey on cudservey.servey;
drop function if exists cudservey.aftercreationservey();
drop function if exists cudservey.creationservey(public.libelle, date, public.identifiant, public.identifiant, numeric, numeric, public.identifiant[], public.libelle, boolean, numeric, boolean, public.libelle, boolean, boolean, boolean, public.identifiant[], numeric(25,20), numeric(25,20), public.libelle, public.libelle, public.identifiant[], public.identifiant)
drop table if exists cudservey.servey;


-- ======== Creation de la table operateursite
-- ==========================================================================================================================================
drop trigger if exists ajoutoperateursite on cudservey.operateursite;
drop function if exists cudservey.aftersupprimeroperateursite();
drop procedure if exists cudservey.mettreajouroperateursite(public.identifiant, public.identifiant[]);
drop table if exists cudservey.operateursite;


-- ======== Creation de la table photosite
-- ==========================================================================================================================================
drop trigger if exists ajoutphotosite on cudservey.photosite;
drop trigger if exists retraitphotosite on cudservey.photosite;
drop function if exists cudservey.aftersupprimerphotosite();
drop procedure if exists cudservey.mettreajourphotosite(public.identifiant, public.identifiant[])
drop table if exists cudservey.photosite;


-- ======== creation de la table site
-- ==========================================================================================================================================
drop trigger if exists suppressionsite on cudservey.site;
drop trigger if exists miseajoursite on cudservey.site;
drop function if exists cudservey.aftermiseajoursite();
drop procedure if exists cudservey.supprimersite(public.identifiant);
drop procedure if exists cudservey.modifiersite(public.identifiant, public.libelle, boolean, phauteur numeric, boolean, public.libelle, boolean, boolean, boolean, public.identifiant[], numeric(25,20), numeric(25,20), public.libelle, public.libelle, public.identifiant[])
drop trigger if exists ajoutsite on cudservey.site;
drop function if exists cudservey.aftercreationsite();
drop function if exists cudservey.creationsite(public.libelle, boolean, numeric, boolean, public.libelle, boolean, boolean, boolean, public.identifiant[], numeric(25,20), numeric(25,20), public.libelle, public.libelle, public.identifiant[])
drop table if exists cudservey.site;



-- ======== creation de la table photo
-- ==========================================================================================================================================
drop trigger if exists suppressionphoto on cudservey.photo;
drop trigger if exists miseajourphoto on cudservey.photo;
drop function if exists cudservey.aftermiseajourphoto();
drop procedure if exists cudservey.supprimerphoto(public.identifiant);
drop procedure if exists cudservey.modifierfichierphoto(public.identifiant, public.nom, public.nom, numeric, bytea);
drop procedure if exists cudservey.modifierphoto(public.identifiant, public.libelle);
drop trigger if exists ajoutphoto on cudservey.photo;
drop function if exists cudservey.aftercreationphoto();
drop function if exists cudservey.creationphoto(public.libelle, public.nom, public.nom, numeric, bytea);
drop table if exists cudservey.photo;


-- ======== creation de la table wifi
-- ==========================================================================================================================================
drop trigger if exists suppressionwifi on cudservey.wifi;
drop trigger if exists miseajourwifi on cudservey.wifi;
drop function if exists cudservey.aftermiseajourwifi();
drop procedure if exists cudservey.supprimerwifi(public.identifiant);
drop procedure if exists cudservey.modifierwifi(public.identifiant, public.libelle, public.nom, public.nom);
drop trigger if exists ajoutwifi on cudservey.wifi;
drop function if exists cudservey.aftercreationwifi();
drop function if exists cudservey.creationwifi(public.libelle, public.nom, public.nom);
drop table if exists cudservey.wifi;


-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du schema cudservey
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists cudservey;



-- ======== Creation de la table responsable
-- ==========================================================================================================================================
drop function if exists srutilisateur.rechercheresponsable(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srutilisateur.obtentionresponsableenregistrement(public.identifiant);
drop function if exists srutilisateur.obtentionresponsablecompte(public.identifiant);
drop function if exists srutilisateur.obtentionresponsableutilisateur(public.identifiant);
drop function if exists srutilisateur.obtentionresponsable(public.identifiant);
drop procedure if exists srutilisateur.ajouterresponsable(public.identifiant, public.codepin, public.identifiant, public.etat, public.enaturelnn, timestamp);
drop table if exists srutilisateur.responsable;


-- ======== Creation de la table resposervey
-- ==========================================================================================================================================
drop function if exists srutilisateur.rechercheresposervey(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srutilisateur.obtentionresposerveyenregistrement(public.identifiant);
drop function if exists srutilisateur.obtentionresposerveycompte(public.identifiant);
drop function if exists srutilisateur.obtentionresposerveyutilisateur(public.identifiant);
drop function if exists srutilisateur.obtentionresposervey(public.identifiant);
drop procedure if exists srutilisateur.ajouteresposervey(public.identifiant, public.codepin, public.identifiant, public.etat, public.enaturelnn, timestamp);
drop table if exists srutilisateur.resposervey;


-- ======== creation de la table administrateur
-- ==========================================================================================================================================
drop function if exists srutilisateur.rechercheadministrateur(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srutilisateur.obtentionadministrateurenregistrement(public.identifiant);
drop function if exists srutilisateur.obtentionadministrateurcompte(public.identifiant);
drop function if exists srutilisateur.obtentionadministrateurutilisateur(public.identifiant);
drop function if exists srutilisateur.obtentionadministrateur(public.identifiant);
drop procedure if exists srutilisateur.ajouteradministrateur(public.identifiant, public.identifiant, public.etat, public.enaturelnn, timestamp)
drop table if exists srutilisateur.administrateur ;


-- ======== creation de la table exploitant
-- ==========================================================================================================================================
drop function if exists srutilisateur.recherchexploitant(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srutilisateur.obtentionexploitantenregistrement(public.identifiant);
drop function if exists srutilisateur.obtentionexploitantcompte(public.identifiant);
drop function if exists srutilisateur.obtentionexploitantutilisateur(public.identifiant);
drop function if exists srutilisateur.obtentionexploitant(public.identifiant);
drop procedure if exists srutilisateur.ajouterexploitant(public.identifiant, public.identifiant, public.etat, public.enaturelnn, timestamp)
drop table if exists srutilisateur.exploitant;


-- ======== Creation de la table utilisateur
-- ==========================================================================================================================================
drop function if exists srutilisateur.obtentionutilisateurenregistrement(public.identifiant);
drop function if exists srutilisateur.obtentionutilisateur(public.identifiant);
drop function if exists srutilisateur.verifierunicitenumtel(public.numtel);
drop function if exists srutilisateur.verifierunicitemail(public.email);
drop function if exists srutilisateur.aftermiseajourutilisateur();
drop procedure if exists srutilisateur.ajouterutilisateur(public.identifiant, public.libelle, public.libelle, public.numtel, public.email, public.identifiant, public.identifiant, public.etat, public.enaturelnn, timestamp)
drop table if exists srutilisateur.utilisateur;


-- ======== Creation de la table enregistrement
-- ==========================================================================================================================================
drop function if exists srutilisateur.recherchenregistrement(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srutilisateur.obtentionenregistrement(public.identifiant);
drop procedure if exists srutilisateur.mettreajourannulationenregistrement(public.identifiant, public.etat, timestamp);
drop procedure if exists srutilisateur.mettreajourvalidationenregistrement(public.identifiant, public.etat, timestamp);
drop procedure if exists srutilisateur.ajouterenregistrement(public.identifiant, public.nom, public.etat, timestamp, public.libelle, public.libelle, public.numtel, public.email, public.nom, public.codepin, public.typeutilisateur, public.etat, public.enaturelnn, timestamp);
drop table if exists srutilisateur.enregistrement;


-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du schema srutilisateur
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists srutilisateur;



-- ======== Creation de la table responsable
-- ==========================================================================================================================================
drop trigger if exists suppressionresponsable on cudutilisateur.responsable;
drop trigger if exists miseajourresponsable on cudutilisateur.responsable;
drop function if exists cudutilisateur.aftermiseajourresponsable();
drop procedure if exists cudutilisateur.supprimerresponsable(public.identifiant);
drop trigger if exists ajoutresponsable on cudutilisateur.responsable;
drop function if exists cudutilisateur.aftercreationresponsable();
drop function if exists cudutilisateur.creationresponsable(public.identifiant, public.codepin);
drop table if exists cudutilisateur.responsable;


-- ======== Creation de la table resposervey
-- ==========================================================================================================================================
drop trigger if exists suppressionresposervey on cudutilisateur.resposervey;
drop trigger if exists miseajourresposervey on cudutilisateur.resposervey;
drop function if exists cudutilisateur.aftermiseajourresposervey();
drop procedure if exists cudutilisateur.supprimerresposervey(public.identifiant);
drop trigger if exists ajoutresposervey on cudutilisateur.resposervey;
drop function if exists cudutilisateur.aftercreationresposervey();
drop function if exists cudutilisateur.creationresposervey(public.identifiant, public.codepin);
drop table if exists cudutilisateur.resposervey;



-- ======== creation de la table administrateur
-- ==========================================================================================================================================
drop trigger if exists suppressionadministrateur on cudutilisateur.administrateur;
drop function if exists cudutilisateur.aftersuppressionadministrateur();
drop trigger if exists miseajouradministrateur on cudutilisateur.administrateur;
drop function if exists cudutilisateur.aftermiseajouradministrateur();
drop procedure if exists cudutilisateur.supprimeradministrateur(public.identifiant);
drop trigger if exists ajoutadministrateur on cudutilisateur.administrateur;
drop function if exists cudutilisateur.aftercreationadministrateur();
drop function if exists cudutilisateur.creationadministrateur(public.identifiant);
drop table if exists cudutilisateur.administrateur;



-- ======== creation de la table exploitant
-- ==========================================================================================================================================
drop trigger if exists suppressionexploitant on cudutilisateur.exploitant;
drop trigger if exists miseajourexploitant on cudutilisateur.exploitant;
drop function if exists cudutilisateur.aftermiseajourexploitant();
drop procedure if exists cudutilisateur.supprimerexploitant(public.identifiant);
drop trigger if exists ajoutexploitant on cudutilisateur.exploitant;
drop function if exists cudutilisateur.aftercreationexploitant();
drop function if exists cudutilisateur.creationexploitant(public.identifiant);
drop table if exists cudutilisateur.exploitant;




-- ======== Creation de la table utilisateur
-- ==========================================================================================================================================
drop trigger if exists suppressionutilisateur on cudutilisateur.utilisateur;
drop function if exists cudutilisateur.aftersuppressionutilisateur();
drop trigger if exists miseajourutilisateur on cudutilisateur.utilisateur;
drop function if exists cudutilisateur.aftermiseajourutilisateur();
drop procedure if exists cudutilisateur.supprimerutilisateur(public.identifiant);
drop trigger if exists ajoututilisateur on cudutilisateur.utilisateur;
drop function if exists cudutilisateur.aftercreationutilisateur();
drop function if exists cudutilisateur.creationutilisateur(public.identifiant, public.identifiant)
drop table if exists cudutilisateur.utilisateur;



-- ======== Creation de la table enregistrement
-- ==========================================================================================================================================
drop trigger if exists suppressionenregistrement on cudutilisateur.enregistrement;
drop trigger if exists miseajourenregistrement on cudutilisateur.enregistrement;
drop function if exists cudutilisateur.aftermiseajourenregistrement();
drop procedure if exists cudutilisateur.supprimerenregistrement(public.identifiant);
drop procedure if exists cudutilisateur.annulerenregistrement(public.identifiant);
drop procedure if exists cudutilisateur.validerenregistrement(public.identifiant, public.nom);
drop trigger if exists ajoutenregistrement on cudutilisateur.enregistrement;
drop function if exists cudutilisateur.aftercreationenregistrement();
drop function if exists cudutilisateur.creationenregistrement(public.typeutilisateur, public.libelle, public.libelle, public.numtel, public.email, public.nom, public.codepin)
drop table if exists cudutilisateur.enregistrement ;


-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du schema cudutilisateur
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists cudutilisateur;



-- ======== creation de la table valeurcontenu
-- ==========================================================================================================================================
drop tabfunctionle if exists srcms.recherchevaleurcontenu(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srcms.obtentionvaleurscontenuscomposantlangue(public.identifiant, public.isolangue);
drop function if exists srcms.obtentionvaleurscontenu(public.identifiant);
drop function if exists srcms.obtentionvaleurcontenu(public.identifiant);
drop trigger if exists miseajourvaleurcontenu on srcms.valeurcontenu;
drop function if exists srcms.aftermiseajourvaleurcontenu();
drop procedure if exists srcms.mettreajourstatutvaleurcontenu(public.identifiant, public.etat, timestamp);
drop procedure if exists srcms.mettreajourvaleurcontenu(public.identifiant, text, timestamp);
drop procedure if exists srcms.ajoutervaleurcontenu(public.identifiant, public.isolangue, text, public.etat, public.identifiant, public.etat, public.enaturelnn, timestamp)
drop table if exists srcms.valeurcontenu;


-- ======== creation de la table contenu
-- ==========================================================================================================================================
drop function if exists srcms.recherchecontenu(public.libelle, public.enaturel, public.enaturelnn)
drop function if exists srcms.obtentioncontenuscomposant(public.identifiant);
drop function if exists srcms.obtentioncontenunom(pnom public.nom);
drop function if exists srcms.obtentioncontenu(pcode public.identifiant);
drop trigger if exists miseajourcontenu on srcms.contenu;
drop function if exists srcms.aftermiseajourcontenu();
drop procedure if exists srcms.mettreajourcontenu(public.identifiant, public.nom, public.libelle, timestamp);
drop procedure if exists srcms.ajoutercontenu(public.identifiant, public.nom, public.libelle, public.identifiant, public.etat, public.enaturelnn, timestamp)
drop table if exists srcms.contenu;



-- ======== creation de la table composantsvue
-- ==========================================================================================================================================
drop function if exists srcms.obtentioncomposantsvue(public.identifiant);
drop procedure if exists srcms.retirercomposantsvue(public.identifiant, public.identifiant);
drop procedure if exists srcms.ajoutercomposantsvue(public.identifiant, public.identifiant);
drop table if exists srcms.composantsvue;


-- ======== creation de la table composant
-- ==========================================================================================================================================
drop function if exists srcms.recherchecomposant(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srcms.obtentioncomposantsenfants(public.identifiant);
drop function if exists srcms.obtentioncomposantnom(public.nom);
drop function if exists srcms.obtentioncomposant(public.identifiant);
drop trigger if exists miseajourcomposant on srcms.composant;
drop function if exists srcms.aftermiseajourcomposant();
drop procedure if exists srcms.mettreajourcomposant public.identifiant, public.nom, public.libelle, timestamp);
drop procedure if exists srcms.ajoutercomposant(public.identifiant, public.nom, public.libelle, public.identifiant, public.etat, public.enaturelnn, timestamp);
drop table if exists srcms.composant ;



-- ======== creation de la table vuespacetravail
-- ==========================================================================================================================================
drop function if exists srcms.obtentionvuespacetravail(public.identifiant);
drop taprocedureble if exists srcms.mettreajourvuedefautvuespacetravail(public.identifiant, public.identifiant, public.etat);
drop procedure if exists srcms.retirervuespacetravail(public.identifiant, public.identifiant);
drop procedure if exists srcms.ajoutervuespacetravail(public.identifiant, public.identifiant, public.etat);
drop table if exists srcms.vuespacetravail;


-- ======== creation de la table vue
-- ==========================================================================================================================================
drop function if exists srcms.recherchevue(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srcms.obtentionvuenom(public.nom);
drop function if exists srcms.obtentionvue(public.identifiant);
drop trigger if exists miseajourvue on srcms.vue;
drop function if exists srcms.aftermiseajourvue();
drop procedure if exists srcms.mettreajourvue public.identifiant, public.nom, public.libelle, timestamp);
drop procedure if exists srcms.ajoutervue(public.identifiant, public.nom, public.libelle, public.etat, public.enaturelnn, timestamp);
drop table if exists srcms.vue;


-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== creation du schema srcms
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists srcms;


-- ======== creation de la table valeurcontenu
-- ==========================================================================================================================================
drop trigger if exists suppressionvaleurcontenu on cudcms.valeurcontenu;
drop function if exists cudcms.aftersuppressionvaleurcontenu();
drop trigger if exists miseajourvaleurcontenu on cudcms.valeurcontenu;
drop fonction if exists cudcms.aftermiseajourvaleurcontenu();
drop procedure if exists cudcms.supprimervaleurcontenu(public.identifiant);
drop procedure if exists cudcms.archivervaleurcontenu(public.identifiant);
drop procedure if exists cudcms.publiervaleurcontenu(public.identifiant);
drop procedure if exists cudcms.validervaleurcontenu(public.identifiant);
drop procedure if exists cudcms.modifiervaleurcontenu(public.identifiant, text);
drop trigger if exists ajoutvaleurcontenu on cudcms.valeurcontenu;
drop function if exists cudcms.aftercreationvaleurcontenu();
drop function if exists cudcms.creationvaleurcontenu(public.isolangue, text, public.identifiant);
drop table if exists cudcms.valeurcontenu;


-- ======== creation de la table contenu
-- ==========================================================================================================================================
drop trigger if exists suppressioncontenu on cudcms.contenu;
drop trigger if exists miseajourcontenu on cudcms.contenu;
drop function if exists cudcms.aftermiseajourcontenu();
drop procedure if exists cudcms.supprimercontenu(public.identifiant);
drop procedure if exists cudcms.modifiercontenu(public.identifiant, public.nom, public.libelle);
drop trigger if exists ajoutcontenu on cudcms.contenu;
drop function if exists cudcms.aftercreationcontenu();
drop function if exists cudcms.creationcontenu(public.nom, public.libelle, public.identifiant);
drop table if exists cudcms.contenu;




-- ======== creation de la table composantsvue
-- ==========================================================================================================================================
drop trigger if exists ajoutcomposantsvue on cudcms.composantsvue;
drop function if exists cudcms.aftercreercomposantsvue();
drop trigger if exists retraitcomposantsvue on cudcms.composantsvue;
drop function if exists cudcms.aftersupprimercomposantsvue();
drop procedure if exists cudcms.mettreajourcomposantsvue(public.identifiant, public.identifiant[]);
drop table if exists cudcms.composantsvue;


-- ======== creation de la table composant
-- ==========================================================================================================================================
drop trigger if exists suppressioncomposant on cudcms.composant;
drop function if exists cudcms.aftersuppressioncomposant();
drop trigger if exists miseajourcomposant on cudcms.composant;
drop function if exists cudcms.aftermiseajourcomposant();
drop procedure if exists cudcms.supprimercomposant(public.identifiant);
drop procedure if exists cudcms.modifiercomposant(public.identifiant, public.nom, public.libelle);
drop trigger if exists ajoutcomposant on cudcms.composant;
drop function if exists cudcms.aftercreationcomposant();
drop function if exists cudcms.creationcomposant(public.nom, public.libelle, public.identifiant);
drop table if exists cudcms.composant ;


-- ======== creation de la table vuespacetravail
-- ==========================================================================================================================================
drop trigger if exists ajoutvuespacetravail on cudcms.vuespacetravail;
drop function if exists cudcms.aftercreervuespacetravail();
drop trigger if exists retraitvuespacetravail on cudcms.vuespacetravail;
drop function if exists cudcms.aftersupprimervuespacetravail();
drop trigger if exists miseajourdefautvuespacetravail on cudcms.vuespacetravail;
drop function if exists cudcms.aftermettreajourvuedefautvuespacetravail();
drop procedure if exists cudcms.mettreajourvuedefautvuespacetravail(public.identifiant, public.identifiant);
drop procedure if exists cudcms.mettreajourvuespacetravail(public.identifiant, public.identifiant[]);
drop table if exists cudcms.vuespacetravail;


-- ======== creation de la table vue
-- ==========================================================================================================================================
drop trigger if exists suppressionvue on cudcms.vue;
drop function if exists cudcms.aftersuppressionvue();
drop trigger if exists miseajourvue on cudcms.vue;
drop function if exists cudcms.aftermiseajourvue();
drop procedure if exists cudcms.supprimervue(public.identifiant);
drop procedure if exists cudcms.modifiervue(public.identifiant, public.nom, public.libelle);
drop trigger if exists ajoutvue on cudcms.vue;
drop function if exists cudcms.aftercreationvue();
drop function if exists cudcms.creationvue(public.nom, public.libelle);
drop table if exists cudcms.vue;

-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== creation du schema cudcms
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists cudcms;


-- ======== création de la table valeurnomenclature
-- ==========================================================================================================================================
drop function if exists srdomaine.obtentionvaleursnomenclatures2nomdomainelangue(public.nom, public.identifiant, public.isolangue, int, int);
drop function if exists srdomaine.obtentionvaleursnomenclaturesnomdomainelangue(public.nom, public.isolangue, int, int);
drop function if exists srdomaine.obtentionvaleursnomenclaturesdomainelangue(public.identifiant, public.isolangue, int, int);
drop function if exists srdomaine.obtentionvaleursnomenclature(public.identifiant);
drop function if exists srdomaine.obtentionvaleurnomenclature(public.identifiant);
drop trigger if exists miseajourvaleurnomenclature on srdomaine.valeurnomenclature;
drop function if exists srdomaine.aftermiseajourvaleurnomenclature();
drop procedure if exists srdomaine.mettreajourvaleurnomenclature(public.identifiant, public.libelle, public.libelle, timestamp);
drop procedure if exists srdomaine.ajoutervaleurnomenclature(public.identifiant, public.identifiant, public.isolangue, public.libelle, public.libelle, public.etat, public.enaturelnn, timestamp);
drop table if exists srdomaine.valeurnomenclature;



-- ======== création de la table nomenclature
-- ==========================================================================================================================================
drop function if exists srdomaine.obtentionomenclaturesdomaine(public.identifiant, numeric, numeric);
drop function if exists srdomaine.obtentionomenclature(public.identifiant);
drop trigger if exists miseajournomenclature on srdomaine.nomenclature ;
drop function if exists srdomaine.aftermiseajournomenclature();
drop procedure if exists srdomaine.ajouternomenclature(public.identifiant, public.enumnomenclature, public.identifiant, public.identifiant, public.identifiant, public.etat, public.enaturelnn, timestamp);
drop table if exists srdomaine.nomenclature;


-- ======== création de la table domaine
-- ==========================================================================================================================================
drop function if exists srdomaine.recherchedomaine(public.libelle, numeric, numeric);
drop function if exists srdomaine.obtentiondomainenom(public.nom);
drop function if exists srdomaine.obtentiondomaine(public.identifiant);
drop trigger if exists miseajourdomaine on srdomaine.domaine;
drop function if exists srdomaine.aftermiseajourdomaine();
drop procedure if exists srdomaine.mettreajourdomaine(public.identifiant, public.nom, public.libelle, timestamp);
drop procedure if exists srdomaine.ajouterdomaine(public.identifiant, public.enumdomaine, public.nom, public.etat, public.libelle, public.identifiant, public.identifiant, public.etat, public.enaturelnn, timestamp);
drop table if exists srdomaine.domaine;


-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== création du schema srdomaine
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists srdomaine;



-- ======== création de la table valeurnomenclature
-- ==========================================================================================================================================
drop trigger if exists suppressionvaleurnomenclature on cuddomaine.valeurnomenclature ;
drop function if exists cuddomaine.aftermiseajourvaleurnomenclature();
drop procedure if exists cuddomaine.supprimervaleurnomenclature(public.identifiant);
drop procedure if exists cuddomaine.modifiervaleurnomenclature(public.identifiant, public.libelle, public.libelle);
drop trigger if exists ajoutvaleurnomenclature on cuddomaine.valeurnomenclature;
drop function if exists cuddomaine.aftercreationvaleurnomenclature();
drop function if exists cuddomaine.creationvaleurnomenclature(public.identifiant, public.isolangue, public.libelle, public.libelle);
drop table if exists cuddomaine.valeurnomenclature;


-- ======== création de la table nomenclature
-- ==========================================================================================================================================
drop trigger if exists suppressionomenclature on cuddomaine.nomenclature;
drop function if exists cuddomaine.aftersuppressionomenclature();
drop trigger if exists miseajournomenclature on cuddomaine.nomenclature;
drop function if exists cuddomaine.aftermiseajournomenclature();
drop procedure if exists cuddomaine.supprimernomenclature(public.identifiant);
drop trigger if exists ajoutnomenclature on cuddomaine.nomenclature;
drop function if exists cuddomaine.aftercreationomenclature();
drop function if exists cuddomaine.creationomenclature(public.enumnomenclature, public.nom, public.identifiant, public.identifiant);
drop table if exists cuddomaine.nomenclature;


-- ======== création de la table domaine
-- ==========================================================================================================================================
drop trigger if exists suppressiondomaine on cuddomaine.domaine ;
drop function if exists cuddomaine.aftersuppressiondomaine();
drop trigger if exists miseajourdomaine on cuddomaine.domaine;
drop function if exists cuddomaine.aftermiseajourdomaine();
drop table if exists cuddomaine.supprimerdomaine(public.identifiant);
drop procedure if exists cuddomaine.modifierdomaine(public.identifiant, public.nom, public.libelle);
drop trigger if exists ajoutdomaine on cuddomaine.domaine;
drop function if exists cuddomaine.aftercreationdomaine();
drop function if exists cuddomaine.creationdomaine(public.enumdomaine, public.nom, public.etat, public.libelle, public.identifiant, public.identifiant);
drop table if exists cuddomaine.domaine;

-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== création du schema cuddomaine
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists cuddomaine;


-- ======== Creation de la table fichier
-- ==========================================================================================================================================
drop function if exists srfichier.obtentionfichier(public.identifiant);
drop procedure if exists srfichier.mettreajourfichier(public.identifiant, public.nom, public.nom, numeric, bytea, timestamp);
drop procedure if exists srfichier.mettreajouretatfichier(public.identifiant, public.etat, timestamp);
drop procedure if exists srfichier.ajouterfichier(public.identifiant, public.nom, public.nom, numeric, bytea, public.etat, public.enaturelnn, timestamp);
drop table if exists srfichier.fichier;

-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du schema srfichier
-- ==========================================================================================================================================
drop schema if exists srfichier;


-- ======== Creation de la table fichier
-- ==========================================================================================================================================
drop trigger if exists supprimerfichier on cudfichier.fichier;
drop trigger if exists mettreajourfichier on cudfichier.fichier ;
drop function if exists cudfichier.aftermettreajourfichier();
drop procedure if exists cudfichier.supprimerfichier(public.identifiant);
drop procedure if exists cudfichier.modifierfichier(public.identifiant, public.nom, public.nom, numeric, bytea);
drop trigger if exists ajouterfichier on cudfichier.fichier;
drop function if exists cudfichier.aftercreationfichier();
drop function if exists cudfichier.creationfichier(public.nom, public.nom, numeric, bytea);
drop table if exists cudfichier.fichier;

-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du schema cudfichier
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists cudfichier;



-- ======== Creation de la table activite
-- ==========================================================================================================================================
drop function if exists srsecurite.obtentionactivitesespacetravail(public.identifiant);
drop function if exists srsecurite.obtentionactivitescompte(public.identifiant);
drop function if exists srsecurite.obtentionactivite(public.identifiant);
drop procedure if exists srsecurite.ajouteractivite(public.identifiant, timestamp, public.libelle, public.identifiant, public.etat, public.enaturelnn, timestamp);
drop table if exists srsecurite.activite;


-- ======== Creation de la table connexion
-- ==========================================================================================================================================
drop function if exists srsecurite.rechercheconnexionsactives(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srsecurite.obtentionconnexionsespacetravail(public.identifiant);
drop function if exists srsecurite.obtentionconnexionscompte(public.identifiant);
drop function if exists srsecurite.obtentionconnexion(public.identifiant);
drop function if exists srsecurite.authentificationconnexion(public.identifiant, public.libelle, cidr);
drop trigger if exists miseajourconnexion on srsecurite.connexion;
drop function if exists srsecurite.aftermiseajourconnexion();
drop procedure if exists srsecurite.mettreajourfermetureconnexion(public.identifiant, public.etat, timestamp, timestamp);
drop procedure if exists srsecurite.ajouterconnexion(public.identifiant, timestamp, public.libelle, cidr, macaddr, public.identifiant, public.identifiant, public.etat, public.etat, public.enaturelnn, timestamp);
drop table if exists srsecurite.connexion;

-- ======== creation de la table droitscompte
-- ==========================================================================================================================================
drop function if exists srsecurite.obtentiondroitscompte(public.identifiant);
drop procedure if exists srsecurite.retirerdroitcompte(public.identifiant, public.identifiant);
drop procedure if exists srsecurite.ajouterdroitcompte(public.identifiant, public.identifiant);
drop table if exists srsecurite.droitscompte;


-- ======== Creation de la table profilscompte
-- ==========================================================================================================================================
drop function if exists srsecurite.obtentionprofilscompte(public.identifiant);
drop taprocedureble if exists srsecurite.retirerprofilcompte(public.identifiant, public.identifiant);
drop procedure if exists srsecurite.ajouterprofilcompte(public.identifiant, public.identifiant);
drop table if exists srsecurite.profilscompte;



-- ======== Creation de la table compte
-- ==========================================================================================================================================
drop function if exists srsecurite.recherchecompte(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srsecurite.obtentioncompte(public.nom);
drop function if exists srsecurite.obtentioncompte(public.identifiant);
drop function if exists srsecurite.authentificationcompte(public.nom, public.nom, public.nom);
drop function if exists srsecurite.identificationcompte(public.nom, public.nom);
drop trigger if exists miseajourcompte on srsecurite.compte;
drop function if exists srsecurite.aftermiseajourcompte();
drop procedure if exists srsecurite.mettreajourdesactivationcompte(public.identifiant, public.etat, timestamp);
drop procedure if exists srsecurite.mettreajouractivationcompte(public.identifiant, public.etat, timestamp);
drop procedure if exists srsecurite.mettreajourmdpcompte(public.identifiant, public.motdepasse, timestamp);
drop procedure if exists srsecurite.mettreajourlogincompte(public.identifiant, public.nom, timestamp);
drop procedure if exists srsecurite.mettreajournomcompte(public.identifiant, public.libelle, timestamp);
drop procedure if exists srsecurite.ajoutercompte(public.identifiant, public.libelle, public.nom, public.motdepasse, public.etat, public.etat, public.enaturelnn, timestamp);
drop table if exists srsecurite.compte;


-- ======== Creation de la table droitsprofil
-- ==========================================================================================================================================
drop function if exists srsecurite.obtentiondroitsprofil(public.identifiant);
drop procedure if exists srsecurite.retirerdroitprofil(public.identifiant, public.identifiant);
drop procedure if exists srsecurite.ajouterdroitprofil(public.identifiant, public.identifiant);
drop table if exists srsecurite.droitsprofil;


-- ======== Creation de la table profil
-- ==========================================================================================================================================
drop function if exists srsecurite.obtenircodeprofil(public.nom);
drop function if exists srsecurite.rechercheprofil(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srsecurite.obtentionprofilsespacetravail(public.identifiant);
drop function if exists srsecurite.obtentionprofil(public.nom);
drop function if exists srsecurite.obtentionprofil(public.identifiant);
drop trigger if exists miseajourprofil on srsecurite.profil;
drop function if exists srsecurite.aftermiseajourprofil();
drop procedure if exists srsecurite.mettreajourprofil(public.identifiant, public.nom, public.libelle, timestamp);
drop procedure if exists srsecurite.ajouterprofil(public.identifiant, public.nom, public.libelle, public.identifiant, public.etat, public.enaturelnn, timestamp);
drop table if exists srsecurite.profil;


-- ======== Creation de la table droitsespacetravail
-- ==========================================================================================================================================
drop function if exists srsecurite.obtentiondroitsespacetravail(public.identifiant);
drop procedure if exists srsecurite.retirerdroitespacetravail(public.identifiant, public.identifiant);
drop procedure if exists srsecurite.ajouterdroitespacetravail(public.identifiant, public.identifiant);
drop table if exists srsecurite.droitsespacetravail;


-- ======== Creation de la table espacetravail
-- ==========================================================================================================================================
drop function if exists srsecurite.recherchespacetravail(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srsecurite.obtentionespacetravailnom(public.nom);
drop function if exists srsecurite.obtentionespacetravail(public.identifiant);
drop function if exists srsecurite.aftermiseajourespacetravail();
drop procedure if exists srsecurite.mettreajourespacetravail(public.identifiant, public.nom, public.nom, public.libelle, timestamp);
drop procedure if exists srsecurite.ajouterespacetravail(public.identifiant, public.nom, public.nom, public.libelle, public.etat, public.enaturelnn, timestamp);
drop table if exists srsecurite.espacetravail;


-- ======== Creation de la table droit
-- ==========================================================================================================================================
drop function if exists srsecurite.recherchedroit(public.libelle, public.enaturel, public.enaturelnn);
drop function if exists srsecurite.obtentiondroit(public.habilitation);
drop function if exists srsecurite.obtentiondroit(public.identifiant);
drop function if exists srsecurite.aftermiseajourdroit();
drop procedure if exists srsecurite.mettreajourdroit(public.identifiant, public.habilitation, public.libelle, timestamp);
drop procedure if exists srsecurite.ajouterdroit(public.identifiant, public.habilitation, public.libelle, public.etat, public.enaturelnn, timestamp);
drop table if exists srsecurite.droit;



-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du schema srsecurite
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists srsecurite;


-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du role akamsrdbservey
-- ==========================================================================================================================================
-- ==========================================================================================================================================  
drop role if exists akamsrdbservey with login password 'akamsr';



-- ======== Creation de la table activite
-- ==========================================================================================================================================
drop trigger if exists suppressionactivite on cudsecurite.activite ;
drop function if exists cudsecurite.aftersuppressionactivite();
drop function if exists cudsecurite.aftermiseajouractivite();
drop procedure if exists cudsecurite.supprimeractivite(public.identifiant);
drop trigger if exists ajoutactivite on cudsecurite.activite
drop function if exists cudsecurite.aftercreationactivite();
drop function if exists cudsecurite.creationactivite(public.libelle, public.identifiant);
drop table if exists cudsecurite.activite;


-- ======== Creation de la table connexion
-- ==========================================================================================================================================
drop trigger if exists suppressionconnexion on cudsecurite.connexion;
drop function if exists cudsecurite.aftersuppressionconnexion();
drop trigger if exists miseajourconnexion on cudsecurite.connexion ;
drop function if exists cudsecurite.aftermiseajourconnexion();
drop procedure if exists cudsecurite.supprimerconnexion(public.identifiant);
drop procedure if exists cudsecurite.fermerconnexion(public.identifiant);
drop trigger if exists ajoutconnexion on cudsecurite.connexion;
drop function if exists cudsecurite.aftercreationconnexion();
drop function if exists cudsecurite.creationconnexion(public.libelle, cidr, macaddr, public.identifiant, public.identifiant);
drop table if exists cudsecurite.connexion;



-- ======== creation de la table droitscompte
-- ==========================================================================================================================================
drop trigger if exists ajoutdroitscompte on cudsecurite.droitscompte;
drop function if exists cudsecurite.aftercreerdroitscompte();
drop trigger if exists retraitdroitscompte on cudsecurite.droitscompte ;
drop function if exists cudsecurite.aftersupprimerdroitscompte();
drop procedure if exists cudsecurite.mettreajourdroitscompte(public.identifiant, public.identifiant[]);
drop table if exists cudsecurite.droitscompte;



-- ======== Creation de la table profilscompte
-- ==========================================================================================================================================
drop trigger if exists ajoutprofilscompte on cudsecurite.profilscompte;
drop function if exists cudsecurite.aftercreerprofilscompte();
drop trigger if exists retraitprofilscompte on cudsecurite.profilscompte ;
drop function if exists cudsecurite.aftersupprimerprofilscompte();
drop procedure if exists cudsecurite.mettreajourprofilscompte(public.identifiant, public.identifiant[]);
drop table if exists cudsecurite.profilscompte;


-- ======== Creation de la table compte
-- ==========================================================================================================================================
drop trigger if exists suppressioncompte on cudsecurite.compte;
drop function if exists cudsecurite.aftersuppressioncompte();
drop trigger if exists miseajourcompte on cudsecurite.compte;
drop function if exists cudsecurite.aftermiseajourcompte();
drop procedure if exists cudsecurite.supprimercompte(public.identifiant);
drop procedure if exists cudsecurite.desactivercompte(public.identifiant);
drop procedure if exists cudsecurite.activercompte(public.identifiant);
drop procedure if exists cudsecurite.changermdpcompte(public.identifiant, public.nom);
drop procedure if exists cudsecurite.modifierlogincompte(public.identifiant, public.nom);
drop procedure if exists cudsecurite.modifiercompte(public.identifiant, public.libelle);
drop trigger if exists ajoutcompte on cudsecurite.compte;
drop function if exists cudsecurite.aftercreationcompte();
drop function if exists cudsecurite.creationcompte(public.libelle, public.nom, public.nom, public.etat);
drop table if exists cudsecurite.compte;



-- ======== Creation de la table droitsprofil
-- ==========================================================================================================================================
drop trigger if exists ajoutdroitprofil on cudsecurite.droitsprofil ;
drop function if exists cudsecurite.aftercreerdroitprofil();
drop trigger if exists retraitdroitprofil on cudsecurite.droitsprofil;
drop function if exists cudsecurite.aftersupprimerdroitprofil();
drop procedure if exists cudsecurite.mettreajourdroitsprofil(public.identifiant, public.identifiant[]);
drop table if exists cudsecurite.droitsprofil;


-- ======== Creation de la table profil
-- ==========================================================================================================================================
drop trigger if exists suppressionprofil on cudsecurite.profil;
drop function if exists cudsecurite.aftersuppressionprofil();
drop trigger if exists miseajourprofil on cudsecurite.profil;
drop function if exists cudsecurite.aftermiseajourprofil();
drop procedure if exists cudsecurite.supprimerprofil(public.identifiant);
drop procedure if exists cudsecurite.modifierprofil(public.identifiant, public.nom, public.libelle);
drop trigger if exists ajoutprofil on cudsecurite.profil;
drop function if exists cudsecurite.aftercreationprofil();
drop function if exists cudsecurite.creationprofil(public.nom, public.libelle, public.identifiant);
drop table if exists cudsecurite.profil;


-- ======== Creation de la table droitsespacetravail
-- ==========================================================================================================================================
drop trigger if exists ajoutdroitespacetravail on cudsecurite.droitsespacetravail;
drop function if exists cudsecurite.aftercreerdroitespacetravail();
drop trigger if exists retraitdroitespacetravail on cudsecurite.droitsespacetravail;
drop function if exists cudsecurite.aftersupprimerdroitespacetravail();
drop procedure if exists cudsecurite.mettreajourdroitsespacetravail(public.identifiant, public.identifiant[]);
drop table if exists cudsecurite.droitsespacetravail ;


-- ======== Creation de la table espacetravail
-- ==========================================================================================================================================
drop trigger if exists suppressionespacetravail on cudsecurite.espacetravail;
drop function if exists cudsecurite.aftersuppressionespacetravail();
drop trigger if exists miseajourespacetravail on cudsecurite.espacetravail;
drop function if exists cudsecurite.aftermiseajourespacetravail();
drop procedure if exists cudsecurite.supprimerespacetravail(public.identifiant);
drop procedure if exists cudsecurite.modifierespacetravail(public.identifiant, public.nom, public.nom, public.libelle);
drop trigger if exists ajoutespacetravail on cudsecurite.espacetravail;
drop function if exists cudsecurite.aftercreationespacetravail();
drop function if exists cudsecurite.creationespacetravail(public.nom, public.nom, public.libelle);
drop table if exists cudsecurite.espacetravail;


-- ======== Creation de la table droit
-- ==========================================================================================================================================
drop trigger if exists suppressiondroit on cudsecurite.droit
drop function if exists cudsecurite.aftersuppressiondroit();
drop trigger if exists miseajourdroit on cudsecurite.droit ;
drop function if exists cudsecurite.aftermiseajourdroit();
drop procedure if exists cudsecurite.supprimerdroit(public.identifiant);
drop procedure if exists cudsecurite.modifierdroit(public.identifiant, public.habilitation, public.libelle);
drop trigger if exists ajoutdroit on cudsecurite.droit ;
drop function if exists cudsecurite.aftercreationdroit();
drop function if exists cudsecurite.creationdroit(public.habilitation, public.libelle);
drop table if exists cudsecurite.droit;


-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du schema cudsecurite
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists cudsecurite;


-- ======== Creation de la table tabincrement
-- ==========================================================================================================================================
drop procedure if exists cudincrement.ajouterincrement(public.nom, public.prefixe);
drop function if exists cudincrement.generationidentifiant(public.nom);
drop procedure if exists cudincrement.incrementer(public.nom);
drop table if exists cudincrement.tabincrement;


-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du schema cudincrement
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop schema if exists cudincrement;


-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation du role akamcuddbservey
-- ==========================================================================================================================================
-- ==========================================================================================================================================
drop role if exists akamcuddbservey with login password 'akamcud';



-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Vider la base de donnees
-- ==========================================================================================================================================
drop procedure if exists public.viderdonnees();



-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Initialiser la base de donnees
-- ==========================================================================================================================================
drop procedure if exists public.initialiserdonnees();




drop function if exists public.cryptagemotdepasse(public.nom, public.identifiant, timestamp);
drop procedure if exists public.mettreajouretatuple(public.nom, public.nom, public.nom, public.identifiant, public.etat, timestamp);
drop procedure if exists public.supprimer(public.nom, public.nom, public.nom, public.identifiant);
drop procedure if exists public.detacher(public.nom, public.nom, public.nom, public.identifiant);
drop procedure if exists public.attacher(public.nom, public.nom, public.nom, public.identifiant);
drop function if exists public.obtentionombretuple(public.nom, public.nom);
drop function if exists public.obtentionordremax(public.nom, public.nom, public.nom);
drop function if exists public.existencetuple(public.nom, public.nom, public.nom, public.habilitation);
drop function if exists public.existencetuple(public.nom, public.nom, public.nom, public.isolangue);
drop function if exists public.existencetuple(public.nom, public.nom, public.nom, public.nom);
drop function if exists public.existencetable(public.nom);
drop function if exists public.existencetable(public.nom, public.nom);
drop function if exists public.existenceschema(public.nom);




drop type if exists public."enumnomenclature";
drop type if exists public."enumdomaine";
drop type if exists public.typeutilisateur;
drop type if exists public."habilitation";
drop type if exists public.isolangue;
drop type if exists public.langue;



drop domain if exists public.codepin;
drop domain if exists public.numtel;
drop domain if exists public.email;
drop domain if exists public.motdepasse;
drop domain if exists public.libelle;
drop domain if exists public.nom;
drop domain if exists public.enaturelnn;
drop domain if exists public.enaturel;
drop domain if exists public.etat;
drop domain if exists public.prefixe;
drop domain if exists public.identifiant;

-- ==========================================================================================================================================
-- ==========================================================================================================================================
-- ======== Creation des objets du schema public
-- ==========================================================================================================================================
-- ==========================================================================================================================================

 
---==================================================================================================================
