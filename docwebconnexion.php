<?php
namespace app;

require_once ('document.php');

use app\document;
use Exception;

class docwebconnexion extends document
{
    private $profils;
    
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
    
    public function cmdesidentifier(String $login, String $mdp)
    {
        try
        {
            $args = [
                'codeserv' => "identifieruncompte",
                'login' => $login,
                'mdp' => $mdp
            ];
            $url = METIERURL . 'securite';
            $resp = $this->executerequetepost($args, $url);
            if($resp['codeserv'] !== 'identifieruncompte' || $resp['statut'] !== 'sucidentcpte')
            {
                throw new Exception(utf8_encode("Une incohérence dans la réponse du service métier est survenue."));
            }            
            $this->compte = ['codecompte' => $resp['compte']['codecompte'], 'nomcompte' => $resp['compte']['nomcompte']];
            
            $args = [
                'codeserv' => "obtenirlesprofilsuncompte",
                'codecompte' => $this->compte['codecompte']
            ];
            $url = METIERURL . 'securite';
            $resp = $this->executerequetepost($args, $url);
            if($resp['codeserv'] !== 'obtenirlesprofilsuncompte' || $resp['statut'] !== 'sucobtprofilscpte')
            {
                throw new Exception(utf8_encode("Une incohérence dans la réponse du service métier est survenue."));
            }
            foreach ($resp['profils'] as $value)
            {
                $this->profils[$value['nomprofil']] = ['nomprofil' => $value['nomprofil'], 'libprofil' => $value['libprofil'], 'codesptrav' => $value['codesptrav']];
            }
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function cmdeannulerconnexion()
    {
        try
        {
            $this->compte = NULL;
            $this->profils = NULL;
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function obtenirmesprofils()
    {
        try
        {
            $mesprofils = [];
            foreach ($this->profils as $value)
            {
                $mesprofils[] = ['nomprofil' => $value['nomprofil'], 'libprofil' => $value['libprofil'], 'codesptrav' => $value['codesptrav']];
            }
            return $mesprofils;
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
    
    public function cmdevaliderconnexion( String $codecompte, String $codesptrav, String $nomterm, String $adrip, String $adrmac = NULL)
    {
        try
        {
            if(is_null($adrmac))
            {
                $args = [
                    'codeserv' => "creeruneconnexion",
                    'nomterm' => $nomterm,
                    'adrip' => $adrip,
                    'codecompte' => $codecompte,
                    'codesptrav' => $codesptrav
                ];
            }
            else 
            {
                $args = [
                    'codeserv' => "creeruneconnexion",
                    'nomterm' => $nomterm,
                    'adrip' => $adrip,
                    'adrmac' => $adrmac,
                    'codecompte' => $codecompte,
                    'codesptrav' => $codesptrav
                ];
            }
            $url = METIERURL . 'securite';
            $resp = $this->executerequetepost($args, $url);
            if($resp['codeserv'] !== 'creeruneconnexion' || $resp['statut'] !== 'succreaconn')
            {
                throw new Exception(utf8_encode("Une incohérence dans la réponse du service métier est survenue."));
            }
            $this->connexion = ['codeconn' => $resp['connexion']['codeconn'], 'lienesptrav' => $resp['connexion']['lienesptrav']];
            
            $this->compte = NULL;
            $this->profils = NULL;
        }
        catch (Exception $e)
        {
            throw new Exception($e->getMessage());
        }
    }
}

