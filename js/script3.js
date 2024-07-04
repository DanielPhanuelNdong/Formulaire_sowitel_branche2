const XHR = new XMLHttpRequest();
XHR.addEventListener('load', traiterevensrvapp);
XHR.addEventListener('timeout', traiterevensrvapp);

function traiterevensrvapp(e)
{
	switch (e.type) 
	{
		case 'timeout':
            signalerexception(null, "Chargement de la requete terminee. Timeout.");
            break;
            
		case 'load':
            try
            {
				var resp = JSON.parse(e.target.response);
				if (resp.head)
				{
					switch(resp.body.action)
					{
						case 'construirelavuecourante':							
							sessionStorage.setItem('sidxhr', resp.body.data.sidxhr);
							sessionStorage.setItem('nomesptrav', resp.body.data.nomesptrav);
							sessionStorage.setItem('nomvue', resp.body.data.vuecourante.nomvue);
							mettreajourprofilutilis(resp.body.data.connexion);
							construirevue(resp.body.data.nomesptrav, resp.body.data.vuecourante.nomvue);
							var nomcompos = '';
							var i = 0;
							for (composant of resp.body.data.vuecourante.composants) 
							{
								if(i == 0)
								{
									nomcompos = composant.nomcompo;
								}
								else
								{
									nomcompos = nomcompos + ',' + composant.nomcompo;
								}
								i = i + 1;
							}
							sessionStorage.setItem('nomcompos', nomcompos);
							initialisercomposant();						
							break;
							
						case 'construireuncomposant':							
							construirecomposant(sessionStorage.getItem("nomesptrav"), sessionStorage.getItem("nomvue"), resp.body.data.composant.nomcompo, resp.body.data.composant.contenus);
							initialisercomposant();
							break;
							
						case 'redirigerversconnexion':	
							location.href = resp.body.data.url;
							break;
							
						case 'signalersucces':	
							switch(resp.body.data.categorie)
							{
								case 'succescmdeobtenirleserveys':
									mettreajourtable('serveys', resp.body.data.serveys);
									//supprimercontainer('loaderblock');
									break;
									
								case 'succescmdeobtenirlistepays':
									mettreajourselectlist('idpays', resp.body.data.listepays);
									//supprimercontainer('loaderblock');
									break;

								// case 'succescmdeobtenirlisteville':
								// 	mettreajourselectlist('ville', resp.body.data.listeville);
								// 	//supprimercontainer('loaderblock');
								// 	break;

								// case 'succescmdeobtenirlisteoperateur':
								// 	mettreajourselectlist('ville', resp.body.data.listeoperateur);
								// 	//supprimercontainer('loaderblock');
								// 	break;
									
								// case 'succescmdeobtenirleswallets':
								// 	mettreajourtable('wallets', resp.body.data.wallets);
								// 	//supprimercontainer('loaderblock');
								// 	break;
							}
					}				
				}
				else
				{
					switch(resp.body.action)
					{
						case 'signalerexception':	
							switch(resp.body.data.categorie)
							{
								case 'echecinitesptrav':
								case 'echecinitvue':
								case 'echecinitcompo':
								case 'echecmodiflang':
								case 'echecsedeconn':
								case 'echecmdeobtenirleserveys':
								// case 'echecmdeobtenirlesadministrateurs':
								// case 'echecmdeobtenirleswallets':
								// case 'echecmdeobtenirlesclients':
								// case 'echecmdeobtenirlesagents':
								// case 'echecmdeobtenirlestransactions':
								// case 'echecmdeobtenirunetransaction':
								// case 'echecmdeobtenirunwallet':
								// case 'echecmdeobtenirlestransactionswallet':
									//rendermessage(resp.body.data.msg, 0);
									//supprimercontainer('loaderblock');
									break;
							}
					}
				}
			}
			catch(err)
			{
				//rendermessage(err, 0);
				//supprimercontainer('loaderblock');
			}
            break;
    }
}

function envoyerequete(data)
{
	XHR.open('POST', 'https://appliwebservey.sowitelsrv.com/control');
	XHR.send(data);
}

function setlang(plang)
{
	switch(plang)
    {
		case 'fr':
			sessionStorage.setItem('lang', "fra");
			break;
			
		case 'en':
			sessionStorage.setItem('lang', "eng");
			break;
	}	
}

function getlang()
{
	return sessionStorage.getItem("lang");
}

function ouvrir(pnomesptrav)
{	
	sessionStorage.clear();
	var data = new FormData();
	data.append('action', "initialiserunespacetravail");
	data.append('nomesptrav', pnomesptrav);
	envoyerequete(data);
}


function initialiserunevue(pnomvue)
{	
	//buildoperatinloader();
	var data = new FormData();
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('action', "initialiserunevue");
	data.append('nomesptrav', getdata('nomesptrav'));
	data.append('nomvue', pnomvue);
	envoyerequete(data);
}

function initialisercomposant()
{
	var nomcompos = sessionStorage.getItem("nomcompos");
	if( nomcompos !== null)
	{
		var tabnomcompos = nomcompos.split(',');
		var nomcompo = tabnomcompos.pop();
		if( nomcompo !== undefined)
		{
			tabnomcompos.length == 0 ? sessionStorage.removeItem('nomcompos') : sessionStorage.setItem('nomcompos', tabnomcompos.join(','));				
			var data = new FormData();
			data.append('sidxhr', sessionStorage.getItem("sidxhr"));
			data.append('action', 'initialiseruncomposant');
			data.append('nomesptrav', sessionStorage.getItem("nomesptrav"));
			data.append('nomvue', sessionStorage.getItem("nomvue"));
			data.append('nomcompo', nomcompo);
			data.append('lang', getlang());
			envoyerequete(data);
		}
	}
	else
	{
		switch(getdata('nomvue'))
	    {
			case 'editionserveys':	
				editerleserveys();
				break;	
				
			case 'creationservey':	
				cmdeobtenirlistepays();
				break;
		}
	}
}

function verifierconnexion(pnomesptrav, pcodeconn)
{
	//buildoperatinloader();
	var data = new FormData();
	data.append('action', "verifierlaconnexion");
	data.append('nomesptrav', pnomesptrav);
	data.append('codeconn', pcodeconn);
	envoyerequete(data);
}

function sedeconnecter()
{
	//buildoperatinloader();
	var data = new FormData();
	data.append('action', "sedeconnecter");
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('codeconn', getdata('conn'));
	envoyerequete(data);
}

function editerleserveys()
{
	var data = new FormData();
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('action', 'cmdeobtenirleserveys');
	data.append('critere', "");
	data.append('debut', 0);
	data.append('limit', 100);
	envoyerequete(data);
}

function editerlesadministrateurs()
{
	var data = new FormData();
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('action', 'cmdeobtenirlesadministrateurs');
	data.append('critere', "");
	data.append('debut', 0);
	data.append('limit', 100);
	envoyerequete(data);
}

function editerleswallets()
{
	var data = new FormData();
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('action', 'cmdeobtenirleswallets');
	data.append('critere', "");
	data.append('debut', 0);
	data.append('limit', 100);
	envoyerequete(data);
}

function editerlesclients()
{
	var data = new FormData();
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('action', 'cmdeobtenirlesclients');
	data.append('critere', "");
	data.append('debut', 0);
	data.append('limit', 100);
	envoyerequete(data);
}

function editerlesagents()
{
	var data = new FormData();
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('action', 'cmdeobtenirlesagents');
	data.append('critere', "");
	data.append('debut', 0);
	data.append('limit', 100);
	envoyerequete(data);
}

function editerlestransactions()
{
	var data = new FormData();
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('action', 'cmdeobtenirlestransactions');
	data.append('debut', 0);
	data.append('limit', 100);
	envoyerequete(data);
}

function editerunetransaction(pcodetrans)
{
	var data = new FormData();
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('action', 'cmdeobtenirunetransaction');
	data.append('codetrans', pcodetrans);
	envoyerequete(data);
}

function editerunwallet(pcodewallet)
{
	var data = new FormData();
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('action', 'cmdeobtenirunwallet');
	data.append('codewallet', pcodewallet);
	envoyerequete(data);
}

function editerlestransactionsunwallet(pcodewallet)
{
	var data = new FormData();
	data.append('sidxhr', sessionStorage.getItem("sidxhr"));
	data.append('action', 'cmdeobtenirlestransactionswallet');
	data.append('codewallet', pcodewallet);
	data.append('debut', 0);
	data.append('limit', 100);
	envoyerequete(data);
}

document.addEventListener("readystatechange", traiterevenpage);

function traiterevenpage(e) 
{
	switch (e.target.readyState) 
	{
        case 'interactive':
        	break;
            
        case 'complete':	
            setlang(e.target.documentElement.lang);
        	var tab = document.URL.split('?');
        	if(tab.length == 2)
        	{
				var prm =tab[1].split('=');
				setdata(prm[0], prm[1]);
        		history.replaceState(null, '', tab[0]);	
			}        	
            verifierconnexion(e.target.body.id, getdata('conn'));
            break;
    }
	
}  

function setdata(pkey, pvalue)
{
	sessionStorage.setItem(pkey, pvalue);
}

function getdata(pkey)
{
	return sessionStorage.getItem(pkey);
}

// fonction construire la vue creationservey à partir de creer
function creerconstcreationservey(){
	construirevue('webresposervey', 'creationservey');
}

//fonction pour charger l'edtion d'un servey
function constediterservey(){
	construirevue('webresposervey', 'editionservey');
}

// fonction construire la vue editionserveys à partir de lbgestionserveys
function lbgestionserveyscosnteditionservey(){
    construirevue('webresposervey', 'editionserveys');
	//formulaire.classList.add('disp');
}

lbgestionserveys

function traiterevenform(e)
{
	e.preventDefault();	
	switch(e.target.dataset.action)
	{
		case 'sedeconnecter':
			sedeconnecter();
			break;
			
		case 'initialiserunevue':
			initialiserunevue(e.target.dataset.nomvue);
			break;
			
		case 'initialiserunevuetype2':
			initialiserunevue(e.target.dataset.nomvue);
			setdata(e.target.dataset.libcode, e.target.dataset.valcode);
			break;
	}	
}

function traitereventable(e)
{
	e.preventDefault();	
	//console.log(e.target.parentNode.dataset.action, e.target.parentNode.dataset.nomvue, e.target.parentNode.dataset.libcode, e.target.parentNode.dataset.valcode);
	switch(e.target.parentNode.dataset.action)
	{
		case 'initialiserunevuetype2':
			initialiserunevue(e.target.parentNode.dataset.nomvue);
			setdata(e.target.parentNode.dataset.libcode, e.target.parentNode.dataset.valcode);
			break;
	}	
}

// fonction pour ooobtenir la listes des pays 
function cmdeobtenirlistepays()
{
	var data = new FormData();
    data.append('codeserv', "cmdeobtenirlistepays");
    envoyerequete(data);
}

//fonction pour obtenir la liste des operateurs
function cmdeobtenirlisteoperateurs()
{
	var data = new FormData();
    data.append('codeserv', "obtenirlisteoperateur");
	data.append('codenomen', "nomen372024000000007");
	data.append('debut', "0");
	data.append('limit', "100");
    envoyerequete(data);
}

//fonction pour obtenir la liste des villes
function cmdeobtenirlistevilles()
{
	var data = new FormData();
    data.append('codeserv', "obtenirlisteville");
	data.append('codenomen', "nomen372024000000007");
	data.append('debut', "0");
	data.append('limit', "100");
    envoyerequete(data);
}