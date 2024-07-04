<?php
namespace app;

require_once ('document.php');

use app\document;
use Exception;

class docwebresposervey extends document
{
    private $serveys;
    private $servey;
    private $resposervey;
    private $pays;
    private $villes;
    private $operateurs;
    
    public function getCompte()
    {
        return $this->compte;
    }
    
    public function getConnexion()
    {
        return $this->connexion;
    }
    
    public function __construct()
    {
        parent::__construct();
    }
    
    private function obtenirleresposervey()
    {
        try
        {
            $args = [
                'codeserv' => "obtenirunresposerveycompte",
                'codecompte' => $this->connexion['codecompte']
            ];
            $url = METIERURL . 'utilisateur';
            $resp = $this->executerequetepost($args, $url);
            if($resp['codeserv'] !== 'obtenirunresposerveycompte' || $resp['statut'] !== 'sucobtresposerveycpte')
            {
                throw new Exception(utf8_encode("Une incohérence dans la réponse du service métier est survenue."));
            }
            $this->resposervey = [
                'coderesposerv' => $resp['resposervey']['coderesposerv'],
                'pinresposervey' => $resp['resposervey']['pinresposervey'],
                'codeutilis' => $resp['resposervey']['codeutilis'],
                'nomsutilis' => $resp['resposervey']['nomsutilis'],
                'prenomsutilis' => $resp['resposervey']['prenomsutilis'],
                'numtelutilis' => $resp['resposervey']['numtelutilis'],
                'emailutilis' => $resp['resposervey']['emailutilis'],
                'codenreg' => $resp['resposervey']['codenreg'],
                'codecompte' => $resp['resposervey']['codecompte'],
                'nomcompte' => $resp['resposervey']['nomcompte'],
                'logincompte' => $resp['resposervey']['logincompte'],
                'statutcompte' => $resp['resposervey']['statutcompte']
            ];
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function cmdeobtenirleserveys(String $critere, int $debut, int $limit)
    {
        try
        {
            $this->obtenirleresposervey();
            $args = [
                'codeserv' => "obtenirleserveysresposervey",
                'coderesposerv' => $this->resposervey['coderesposerv'],
                'critere' => $critere,
                'debut' => $debut,
                'limit' => $limit
            ];
            $url = METIERURL . 'servey';
            $resp = $this->executerequetepost($args, $url);
            if($resp['codeserv'] !== 'obtenirleserveysresposervey' || $resp['statut'] !== 'sucobtserveysresposerv')
            {
                throw new Exception(utf8_encode("Une incohérence dans la réponse du service métier est survenue."));
            }
            $this->serveys = [];
            foreach ($resp['serveys'] as $value)
            {
                $this->serveys[$value['servey']['codeservey']] = [
                    'codeservey' => $value['servey']['codeservey'],
                    'statutservey' => $value['servey']['statutservey'],
                    'nomreseau' => $value['servey']['nomreseau'],
                    'dateservey' => $value['servey']['dateservey'],
                    'codepays' => $value['servey']['codepays'],
                    'enumpays' => $value['servey']['enumpays'],
                    'codeville' => $value['servey']['codeville'],
                    'enumville' => $value['servey']['enumville'],
                    'clientmobile' => $value['servey']['clientmobile'],
                    'clientbtob' => $value['servey']['clientbtob'],
                    'coderesposerv' => $value['servey']['coderesposerv'],
                    'pinresposervey' => $value['servey']['pinresposervey'],
                    'codeutilis' => $value['servey']['codeutilis'],
                    'codesite' => $value['servey']['codesite'],
                    'nomsite' => $value['servey']['nomsite'],
                    'immeuble' => $value['servey']['immeuble'],
                    'hauteur' => $value['servey']['hauteur'],
                    'immeuble' => $value['servey']['immeuble'],
                    'dalle' => $value['servey']['dalle'],
                    'descrdalle' => $value['servey']['descrdalle'],
                    'sourcelectrique' => $value['servey']['sourcelectrique'],
                    'priseterre' => $value['servey']['priseterre'],
                    'operateurs' => $value['servey']['operateurs'],
                    'longitude' => $value['servey']['longitude'],
                    'latitude' => $value['servey']['latitude'],
                    'adresse' => $value['servey']['adresse'],
                    'descrenviron' => $value['servey']['descrenviron']
                ];
            }
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function obtenirmeserveys()
    {
        try
        {
            $meserveys = [];
            foreach ($this->serveys as $value)
            {
                $meserveys[] = [
                    'code' => $value['codeservey'],
                    'nomsite' => $value['nomsite'],
                    'nomreseau' => $value['nomreseau'],
                    'enumpays' => $value['enumpays'],
                    'enumville' => $value['enumville'],
                    'dateservey' => $value['dateservey']
                ];
            }
            return $meserveys;
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function cmdeobtenirunservey($codeservey)
    {
        try
        {
            $monservey = $this->serveys[$codeservey];
            if(is_null($monservey))
            {
                throw new Exception(utf8_encode("Une incohérence dans le service applicatif est survenue."));
            }
            $this->servey = [
                'statutservey' => $monservey['statutservey'],
                'nomreseau' => $monservey['nomreseau'],
                'dateservey' => $monservey['dateservey'],
                'codepays' => $monservey['codepays'],
                'enumpays' => $monservey['enumpays'],
                'codeville' => $monservey['codeville'],
                'enumville' => $monservey['enumville'],
                'clientmobile' => $monservey['clientmobile'],
                'clientbtob' => $monservey['clientbtob'],
                'coderesposerv' => $monservey['coderesposerv'],
                'pinresposervey' => $monservey['pinresposervey'],
                'codeutilis' => $monservey['codeutilis'],
                'codesite' => $monservey['codesite'],
                'nomsite' => $monservey['nomsite'],
                'immeuble' => $monservey['immeuble'],
                'hauteur' => $monservey['hauteur'],
                'immeuble' => $monservey['immeuble'],
                'dalle' => $monservey['dalle'],
                'descrdalle' => $monservey['descrdalle'],
                'sourcelectrique' => $monservey['sourcelectrique'],
                'priseterre' => $monservey['priseterre'],
                'operateurs' => $monservey['operateurs'],
                'longitude' => $monservey['longitude'],
                'latitude' => $monservey['latitude'],
                'adresse' => $monservey['adresse'],
                'descrenviron' => $monservey['descrenviron']
            ];
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function obtenirmonservey()
    {
        try
        {
            return $this->servey;
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function cmdecreerunservey(String $nomreseau, String $dateservey, String $codepays, String $codeville, String $clientmobile, String $clientbtob, String $nomsite, String $immeuble, String $hauteur, String $dalle, String $descrdalle, String $sourcelectrique, String $priseterre, String $operateurs, String $codesoperateurs, String $latitude, String $longitude, String $adresse, String $descrenviron, String $coderesposerv)
    {
        try
        {
            $args = [
                'codeserv' => "creerunservey",
                'nomreseau' => $nomreseau,
                'dateservey' => $dateservey,
                'codepays' => $codepays,
                'codeville' => $codeville,
                'clientmobile' => $clientmobile,
                'clientbtob' => $clientbtob,
                'nomsite' => $nomsite,
                'immeuble' => $immeuble,
                'hauteur' => $hauteur,
                'dalle' => $dalle,
                'descrdalle' => $descrdalle,
                'sourcelectrique' => $sourcelectrique,
                'priseterre' => $priseterre,
                'operateurs' => $operateurs,
                'codesoperateurs' => $codesoperateurs,
                'latitude' => $latitude,
                'longitude' => $longitude,
                'adresse' => $adresse,
                'descrenviron' => $descrenviron,
                'coderesposerv' => $coderesposerv
            ];
            $url = METIERURL . 'servey';
            $resp = $this->executerequetepost($args, $url);
            if($resp['codeserv'] !== 'creeruneservey' || $resp['statut'] !== 'succreaservey')
            {
                throw new Exception(utf8_encode("Une incohérence dans la réponse du service métier est survenue."));
            }            
                $this->servey = [
                    'codeservey' => $resp['servey']['codeservey'],
                    'statutservey' => $resp['servey']['statutservey'],
                    'nomreseau' => $resp['servey']['nomreseau'],
                    'dateservey' => $resp['servey']['dateservey'],
                    'codepays' => $resp['servey']['codepays'],
                    'enumpays' => $resp['servey']['enumpays'],
                    'codeville' => $resp['servey']['codeville'],
                    'enumville' => $resp['servey']['enumville'],
                    'clientmobile' => $resp['servey']['clientmobile'],
                    'clientbtob' => $resp['servey']['clientbtob'],
                    'coderesposerv' => $resp['servey']['coderesposerv'],
                    'pinresposervey' => $resp['servey']['pinresposervey'],
                    'codeutilis' => $resp['servey']['codeutilis'],
                    'codesite' => $resp['servey']['codesite'],
                    'nomsite' => $resp['servey']['nomsite'],
                    'immeuble' => $resp['servey']['immeuble'],
                    'hauteur' => $resp['servey']['hauteur'],
                    'immeuble' => $resp['servey']['immeuble'],
                    'dalle' => $resp['servey']['dalle'],
                    'descrdalle' => $resp['servey']['descrdalle'],
                    'sourcelectrique' => $resp['servey']['sourcelectrique'],
                    'priseterre' => $resp['servey']['priseterre'],
                    'operateurs' => $resp['servey']['operateurs'],
                    'longitude' => $resp['servey']['longitude'],
                    'latitude' => $resp['servey']['latitude'],
                    'adresse' => $resp['servey']['adresse'],
                    'descrenviron' => $resp['servey']['descrenviron']
                ];
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function cmdeobtenirlistepays()
    {
        try
        {
            $args = [
                'codeserv' => "obtenirlistepaysafrique",
                'debut' => "0",
                'limit' => "100"
            ];
            $url = METIERURL . 'domaine';
            $resp = $this->executerequetepost($args, $url);
            if($resp['codeserv'] !== 'obtenirlistepaysafrique' || $resp['statut'] !== 'sucobtlstpaysafrique')
            {
                throw new Exception(utf8_encode("Une incohérence dans la réponse du service métier est survenue."));
            }
            $this->pays = [];
            foreach ($resp['listepays'] as $value)
            {
                $this->pays[$value['codenomen']] = [
                    'codenomen' => $value['codenomen'],
                    'lib' => $value['lib'],
                    'enumnomen' => $value['enumnomen']
                ];
            }
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }    
    
    public function obtenirlistepays()
    {
        try
        {
            $lespays = [];
            foreach ($this->pays as $value)
            {
                $lespays[] = [
                    'code' => $value['codenomen'],
                    'lib' => $value['lib'],
                    'enum' => $value['enumnomen']
                ];
            }
            return $lespays;
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function cmdeobtenirlisteville($codepays)
    {
        try
        {
            $args = [
                'codeserv' => "obtenirlisteville",
                'codenomen' => $codepays,
                'debut' => "0",
                'limit' => "100"
            ];
            $url = METIERURL . 'domaine';
            $resp = $this->executerequetepost($args, $url);
            if($resp['codeserv'] !== 'obtenirlisteville' || $resp['statut'] !== 'sucobtlstville')
            {
                throw new Exception(utf8_encode("Une incohérence dans la réponse du service métier est survenue."));
            }
            $this->villes = [];
            foreach ($resp['listeville'] as $value)
            {
                $this->villes[$value['codenomen']] = [
                    'codenomen' => $value['codenomen'],
                    'lib' => $value['lib'],
                    'enumnomen' => $value['enumnomen']
                ];
            }
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function obtenirlisteville()
    {
        try
        {
            $lesvilles = [];
            foreach ($this->villes as $value)
            {
                $lesvilles[] = [
                    'code' => $value['codenomen'],
                    'lib' => $value['lib'],
                    'enum' => $value['enumnomen']
                ];
            }
            return $lesvilles;
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function cmdeobtenirlisteoperateur($codepays)
    {
        try
        {
            $args = [
                'codeserv' => "obtenirlisteoperateur",
                'codenomen' => $codepays,
                'debut' => "0",
                'limit' => "100"
            ];
            $url = METIERURL . 'domaine';
            $resp = $this->executerequetepost($args, $url);
            if($resp['codeserv'] !== 'obtenirlisteoperateur' || $resp['statut'] !== 'sucobtlstoperateur')
            {
                throw new Exception(utf8_encode("Une incohérence dans la réponse du service métier est survenue."));
            }
            $this->operateurs = [];
            foreach ($resp['listeoperateur'] as $value)
            {
                $this->operateurs[$value['codenomen']] = [
                    'codenomen' => $value['codenomen'],
                    'lib' => $value['lib'],
                    'enumnomen' => $value['enumnomen']
                ];
            }
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function obtenirlisteoperateur()
    {
        try
        {
            $lesoperateurs = [];
            foreach ($this->operateurs as $value)
            {
                $lesoperateurs[] = [
                    'code' => $value['codenomen'],
                    'lib' => $value['lib'],
                    'enum' => $value['enumnomen']
                ];
            }
            return $lesoperateurs;
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
}

