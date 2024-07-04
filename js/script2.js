function construirevue(nomesptrav, nomvue)
{
	switch(nomesptrav)
    {
		case 'webresposervey':
			document.getElementById('editionserveys').setAttribute("style", "padding: 0; display: none;");
			document.getElementById('creationservey').setAttribute("style", "padding: 0; display: none;");
			switch(nomvue)
            {
				case 'editionserveys':
					document.getElementById(nomvue).setAttribute("style", "padding: 0; display: block;");
					break;

				case 'creationservey':
					document.getElementById(nomvue).setAttribute("style", "padding: 0; display: block;");
					break;
			}
		break;
	}
}

function construirecomposant(nomesptrav, nomvue, nomcompo, contenus)
{
  	switch(nomesptrav)
    {
		case 'webresposervey':
			switch(nomvue)
            {
				case 'editionserveys':
					switch(nomcompo)
		            {
						case 'sidebar':
							for (const conten of contenus)
							{
								switch(conten.nomconten)
					            {
									case 'lbdeconnexion':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										document.getElementById(conten.nomconten).setAttribute("data-action", 'sedeconnecter');
										document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
										break;
										
									case 'lbgestionserveys':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										document.getElementById(conten.nomconten).addEventListener("click", lbgestionserveyscosnteditionservey);
										//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
										break;
								}
							}
							// const menuBtn = document.querySelector("#menu-btn");
    						// menuBtn.addEventListener('click', () => {sidemenu.style.display = 'block';})
    						// const closeBtn = document.querySelector("#close-btn");
    						// closeBtn.addEventListener('click', () => {sidemenu.style.display = 'none';})
							break;
							
						case 'gestionbar1':	
							for (const conten of contenus) 
							{
								switch(conten.nomconten)
					            {
									case 'lbgestdeserveys':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										break;
									case 'lbeditserveys':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										break;
									case 'btncreerservey':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										document.getElementById(conten.nomconten).addEventListener("click", creerconstcreationservey);
										break;
								}
							}
							break;

							case 'espacecontenair':	
							for (const conten of contenus) 
							{
								switch(conten.nomconten)
					            {
									case 'lblistserveys':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										break;
								}
							}
							break;
							
						case 'tableserveys':
							for (const conten of contenus) 
							{
								switch(conten.nomconten)
					            {
									case 'colnumeros':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										break;
									case 'colnomsites':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										break;
									case 'colvilles':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										break;
									case 'coldates':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										break;
									case 'colpays':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										break;
									case 'colnomreseaux':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										break;
								}
							}
							break;
					}
					break;

			    case 'creationservey':
					switch(nomcompo)
					{
						case 'sidebar':
							for (const conten of contenus)
							{
								switch(conten.nomconten)
					            {
									case 'lbdeconnexion':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										document.getElementById(conten.nomconten).setAttribute("data-action", 'sedeconnecter');
										document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
										break;
										
									case 'lbgestionserveys':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
										break;
								}
							}
							break;

						case 'Entetecreatservey':
							for (const conten of contenus)
							{
								switch(conten.nomconten)
								{
									case 'lbnomsite':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										// document.getElementById(conten.nomconten).setAttribute("data-action", 'sedeconnecter');
										// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
										break;
											
									case 'lbpays':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
										break;

									case 'lbville':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
										break;

									case 'lbdate':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
										break;

									case 'lbnomreseau':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
										break;

									case 'lbinfoservey':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
										break;

									case 'placenomsite':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
										break;

									case 'placenomreseau':
										document.getElementById(conten.nomconten).innerText = conten.lib;
										// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
										break;

									
									}
							}
							break;

						case 'bdycreatservey1':
							for (const conten of contenus)
								{
									switch(conten.nomconten)
									{
										case 'lbcarateristiques':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).setAttribute("data-action", 'sedeconnecter');
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
												
										case 'lbimmeuble':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
											break;
	
										case 'lbimbleoui':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbimblenon':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbhauteur':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbdalle':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
											break;
	
										case 'lbdaloui':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbdalnon':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbetatdal':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbsourcelect':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
											break;
	
										case 'lbsourcelectoui':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbsourcelectnon':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbpriseterre':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbpriseterreoui':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
											break;
	
										case 'lbpriseterrenon':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbcoordgps':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lboperateurexist':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lboperateurexistoui':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
											break;
	
										case 'lboperateurexistnon':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lboperateur':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'placehauteur':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'placelongitude':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'placetatdal':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'placelatitude':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'placeadresse':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
										}
							}
							break;

						case 'bodycreatservey2':
							for (const conten of contenus)
							{
								switch(conten.nomconten)
									{
										case 'lbclientcible':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).setAttribute("data-action", 'sedeconnecter');
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbmobile':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'lbBtoB':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
											break;
	
										case 'placembile':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											//document.getElementById(conten.nomconten).parentNode.setAttribute('class', 'active');
											break;
	
										case 'placeBtoB':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;

										}
							}
							break;

						case 'bodycreatservey3':
							for (const conten of contenus)
							{
								switch(conten.nomconten)
									{
										case 'lbscanperiphwifi':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).setAttribute("data-action", 'sedeconnecter');
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
	
										case 'btnwifi':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
											
										}
							}
							break;

						case 'bodycreatservey4':
							for (const conten of contenus)
							{
								switch(conten.nomconten)
									{
										case 'lbphotos':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).setAttribute("data-action", 'sedeconnecter');
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
		
										case 'btnphotos':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;

										case 'placedescriptenviron':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
												
										}
							}
							break;

						case 'footercreatservey':
							for (const conten of contenus)
							{
								switch(conten.nomconten)
									{
										case 'btnsoumcreatservey':
											document.getElementById(conten.nomconten).innerText = conten.lib;
											// document.getElementById(conten.nomconten).setAttribute("data-action", 'sedeconnecter');
											// document.getElementById(conten.nomconten).addEventListener("click", traiterevenform);
											break;
									}
							}
							break;

					}
			}
		break;
	}
}

function supprimercontainer(idcontainer)
{
    var contentdiv = document.getElementById(idcontainer);
    if (contentdiv !== null) 
    {
        contentdiv.remove();
    }
}

function demasquercomposant(nomcomposant, bool)
{
	if (!bool) 
	{
        document.getElementById(nomcomposant).setAttribute("style", "padding: 0; display: none;");
    } 
    else 
    {
        document.getElementById(nomcomposant).setAttribute("style", "padding: 0; display: block;");
    }
}

function mettreajourselectlist(selectid, data)
{
	var select = document.getElementById(selectid);
	var length = select.options.length;
	for (i = length-1; i > 0; i--) 
	{
	  select.remove(i);
	}
	var opt = null;
	for (conten of data) 
	{ 
        opt = document.createElement('option');
        opt.value = conten.codesptrav;
        opt.textContent = conten.nomprofil;
        select.appendChild(opt);
    }
	select.selectedIndex = 0;
	select.setAttribute("data-action", 'setcodesptrav');
	select.addEventListener("change", traiterevenform);
}

function mettreajourprofilutilis(connexion)
{
	document.getElementById('username').innerText = connexion.nomcompte;
}

function remplirformulaire(formid, data)
{
	switch(formid)
    {
		case 'editiontransaction':
       		for (const item in data) 
	       	{
	       		switch(item)
	            {
					case 'codetrans':
					case 'nomcommis':
					case 'datetrans':
					case 'descrtrans':
					case 'senstrans':
					case 'montantrans':
					case 'tauxcommis':
					case 'fraistrans':
					case 'totaltrans':
					case 'statutrans':
					case 'nomsutilistrans':
					case 'intitulewalletrans':
					case 'soldewalletrans':
					case 'nouveausoldetrans':
					case 'nomsmomo':
					case 'numtelmomo':
					case 'opermomo':
					case 'paysmomo':
					case 'nomsutilispart':
					case 'intitulewalletpart':
						document.getElementById(item).value = data[item];
						break;
				}			  
			}
	        break;
	        
        case 'editionwallet':
        	
       		for (const item in data) 
	       	{
	       		switch(item)
	            {
					case 'codewallet':
						const transwalletBtn = document.querySelector("#editranswallet");
						transwalletBtn.setAttribute("data-action", 'initialiserunevuetype2');
						transwalletBtn.setAttribute("data-nomvue", 'editiontransactionswallet');
						transwalletBtn.setAttribute("data-libcode", 'codewallet');
						transwalletBtn.setAttribute("data-valcode", data[item]);
						transwalletBtn.addEventListener("click", traiterevenform);
						transwalletBtn.addEventListener("dblclick", traiterevenform);
						document.getElementById(item).value = data[item];
						break;
					case 'intitulewallet':
					case 'soldewallet':
					case 'statutwallet':
					case 'codeclientwallet':
					case 'typeutiliswallet':
					case 'nomsutiliswallet':
					case 'numtelutiliswallet':
					case 'emailutiliswallet':
					case 'statutcomptewallet':
						document.getElementById(item).value = data[item];
						break;
				}			  
			}
	        break;
	}
}

function mettreajourtable(tableid, data)
{
	

	switch(tableid)
    {
		
		case 'serveys':
			var table = document.getElementById(tableid);
			var tbody = document.createElement("tbody");
			var j = 1;
			data.forEach(item => 
			{
		        var tr = document.createElement("tr");
		        tr.setAttribute('id', item.nomsite);
		        var td = document.createElement("td");
		        td.setAttribute('class', 'text-center');
		        td.innerText = j;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.nomsite;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.nomreseau;
		        tr.appendChild(td);

				td = document.createElement("td");
		        td.innerText = item.dateservey;
		        tr.appendChild(td);

				td = document.createElement("td");
		        td.innerText = item.enumville;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.enumpays;
		        tr.appendChild(td);
		        		        
		        tbody.appendChild(tr);
		        j = j + 1;
		    });
			var anctbody = document.querySelector("table#" + tableid + ">tbody");
			if (anctbody !== null)
		    {
		        table.removeChild(anctbody);
		    }
	    	table.appendChild(tbody);
			break;
			
		case 'administrateurs':
			var table = document.getElementById(tableid);
			var tbody = document.createElement("tbody");
			var j = 1;
			data.forEach(item =>
			{
		        var tr = document.createElement("tr");
		        tr.setAttribute('id', item.code);
		        var td = document.createElement("td");
		        td.setAttribute('class', 'text-center');
		        td.innerText = j;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.noms;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.numtel;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.email;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        if(item.statut == '1')
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-check-circle');
		        }
		        else
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-lock');
		        }
		        td.appendChild(i);
		        tr.appendChild(td);
		        		        
		        tbody.appendChild(tr);
		        j = j + 1;
		    });						
			var anctbody = document.querySelector("table#" + tableid + ">tbody");
			if (anctbody !== null) 
		    {
		        table.removeChild(anctbody);
		    }
	    	table.appendChild(tbody);
			break;	
			
		case 'wallets':
			var table = document.getElementById(tableid);
			var tbody = document.createElement("tbody");
			var j = 1;
			data.forEach(item => 
			{
		        var tr = document.createElement("tr");	        
				tr.setAttribute("data-action", 'initialiserunevuetype2');
				tr.setAttribute("data-nomvue", 'editionwalletedit');
				tr.setAttribute("data-libcode", 'codewallet');
				tr.setAttribute("data-valcode", item.code);
				tr.addEventListener("click", traitereventable);
				tr.addEventListener("dblclick", traitereventable);
		        var td = document.createElement("td");
		        td.setAttribute('class', 'text-center');
		        td.innerText = j;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.intitule;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.solde;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.noms;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.numtel;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.email;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        if(item.statut == '1')
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-check-circle');
		        }
		        else
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-lock');
		        }
		        td.appendChild(i);
		        tr.appendChild(td);
		        		        
		        tbody.appendChild(tr);
		        j = j + 1;
		    });						
			var anctbody = document.querySelector("table#" + tableid + ">tbody");
			if (anctbody !== null) 
		    {
		        table.removeChild(anctbody);
		    }
	    	table.appendChild(tbody);
			break;
			
		case 'clients':
			var table = document.getElementById(tableid);
			var tbody = document.createElement("tbody");
			var j = 1;
			data.forEach(item => 
			{
		        var tr = document.createElement("tr");
		        tr.setAttribute('id', item.code);
		        var td = document.createElement("td");
		        td.setAttribute('class', 'text-center');
		        td.innerText = j;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.noms;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.numtel;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.email;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        if(item.statut == '1')
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-check-circle');
		        }
		        else
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-lock');
		        }
		        td.appendChild(i);
		        tr.appendChild(td);
		        		        
		        tbody.appendChild(tr);
		        j = j + 1;
		    });						
			var anctbody = document.querySelector("table#" + tableid + ">tbody");
			if (anctbody !== null) 
		    {
		        table.removeChild(anctbody);
		    }
	    	table.appendChild(tbody);
			break;
			
		case 'agents':
			var table = document.getElementById(tableid);
			var tbody = document.createElement("tbody");
			var j = 1;
			data.forEach(item => 
			{
		        var tr = document.createElement("tr");
		        tr.setAttribute('id', item.code);
		        var td = document.createElement("td");
		        td.setAttribute('class', 'text-center');
		        td.innerText = j;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.noms;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.numtel;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.email;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        if(item.statut == '1')
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-check-circle');
		        }
		        else
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-lock');
		        }
		        td.appendChild(i);
		        tr.appendChild(td);
		        		        
		        tbody.appendChild(tr);
		        j = j + 1;
		    });						
			var anctbody = document.querySelector("table#" + tableid + ">tbody");
			if (anctbody !== null) 
		    {
		        table.removeChild(anctbody);
		    }
	    	table.appendChild(tbody);
			break;
			
		case 'transactions':
			var table = document.getElementById(tableid);
			var tbody = document.createElement("tbody");
			var j = 1;
			data.forEach(item => 
			{
		        var tr = document.createElement("tr");	        
				tr.setAttribute("data-action", 'initialiserunevuetype2');
				tr.setAttribute("data-nomvue", 'editiontransactionedit');
				tr.setAttribute("data-libcode", 'codetrans');
				tr.setAttribute("data-valcode", item.code);
				tr.addEventListener("click", traitereventable);
				tr.addEventListener("dblclick", traitereventable);
		        var td = document.createElement("td");
		        td.setAttribute('class', 'text-center');
		        td.innerText = j;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.type;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.date;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.montant;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.taux;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.sens;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.intitule;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.noms;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        if(item.statut == '1')
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-check-circle');
		        }
		        else
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-lock');
		        }
		        td.appendChild(i);
		        tr.appendChild(td);
		        		        
		        tbody.appendChild(tr);
		        j = j + 1;
		    });						
			var anctbody = document.querySelector("table#" + tableid + ">tbody");
			if (anctbody !== null) 
		    {
		        table.removeChild(anctbody);
		    }
	    	table.appendChild(tbody);	    	
			break;
			
		case 'transactionswallet':
			var table = document.getElementById(tableid);
			var tbody = document.createElement("tbody");
			var j = 1;
			data.forEach(item => 
			{
		        var tr = document.createElement("tr");	        
				tr.setAttribute("data-action", 'initialiserunevuetype2');
				tr.setAttribute("data-nomvue", 'editiontransactionedit');
				tr.setAttribute("data-libcode", 'codetrans');
				tr.setAttribute("data-valcode", item.code);
				tr.addEventListener("click", traitereventable);
				tr.addEventListener("dblclick", traitereventable);
		        var td = document.createElement("td");
		        td.setAttribute('class', 'text-center');
		        td.innerText = j;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.type;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.date;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.montant;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.taux;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.sens;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.intitule;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        td.innerText = item.noms;
		        tr.appendChild(td);
		        
		        td = document.createElement("td");
		        if(item.statut == '1')
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-check-circle');
		        }
		        else
		        {
		        	var i = document.createElement("i");
		        	i.setAttribute('class', 'icon-feather-lock');
		        }
		        td.appendChild(i);
		        tr.appendChild(td);
		        		        
		        tbody.appendChild(tr);
		        j = j + 1;
		    });						
			var anctbody = document.querySelector("table#" + tableid + ">tbody");
			if (anctbody !== null) 
		    {
		        table.removeChild(anctbody);
		    }
	    	table.appendChild(tbody);	    	
			break;
	}
}

function viderformidentificationweb() 
{
	document.getElementById("lblogin").value = '';
	document.getElementById("lbmdp").value = '';
}

function rendermessage(msg, type) 
{
    var class1 = "", class2 = "";
    switch (type) 
    {
        case 0:
            class1 = "alert fade alert-danger lgalert";
            class2 = "icon icon-feather-alert-triangle";
            break;

        case 1:
            class1 = "alert fade alert-success lgalert";
            class2 = "icon icon-feather-check-circle";
            break;

        case 2:
            class1 = "alert fade alert-warning lgalert";
            class2 = "icon icon-feather-alert-triangle";
            break;

        case 3:
            class1 = "alert fade alert-info lgalert";
            class2 = "icon icon-feather-info";
            break;
    }

    var contentmessage = document.getElementById('message');
	contentmessage.innerHTML = '';
    var divmessage = document.createElement("div");
    divmessage.setAttribute("class", class1);
    var buttonmsgclose = document.createElement("button");
    buttonmsgclose.setAttribute("class", "closealert");
    buttonmsgclose.setAttribute("id", "closemsg")
    var ibuttonmsgclose = document.createElement("i");
    ibuttonmsgclose.setAttribute("class", "icon icon-feather-x-circle");
    buttonmsgclose.appendChild(ibuttonmsgclose);
    divmessage.appendChild(buttonmsgclose);
    var iconmsg = document.createElement("i");
    iconmsg.setAttribute("class", class2);
    divmessage.appendChild(iconmsg);
    var spanmsg = document.createElement("span");
    spanmsg.innerText = msg;
    divmessage.appendChild(spanmsg);

    contentmessage.appendChild(divmessage);

   	const closeMsg = document.querySelector("#closemsg");

    closeMsg.addEventListener('click', () => {
        divmessage.remove();
    })
}

function buildoperatinloader() 
{
    var contentviewloader = document.getElementById('loader');

    var divloadercontent = document.createElement("div");
    divloadercontent.setAttribute("style", "background-color: rgba(254, 254, 254, 0.8); position: fixed; left: 0; right: 0; top: 0; bottom: 0; font-weight: 400; display: flex; flex-direction: column; justify-content: center; align-items: center; z-index: 999;");
    divloadercontent.setAttribute("id", "loaderblock");
    var divwifiloader = document.createElement("div");
    divwifiloader.setAttribute("class", "lds-ripple");
    var _contentloader = `<div></div><div></div>`;

    divwifiloader.innerHTML = _contentloader;

    divloadercontent.appendChild(divwifiloader);

    contentviewloader.appendChild(divloadercontent);
}