<?php

namespace app;

$allowedOrigins = [
    'http://servey.sowitelgroup.com',
    'https://servey.sowitelgroup.com'
];

if(in_array($_SERVER['HTTP_ORIGIN'], $allowedOrigins))
{
    $http_origin = $_SERVER['HTTP_ORIGIN'];
} 
else 
{
    $http_origin = "http://servey.sowitelgroup.com";
}

header('Content-Type: application/json; charset=utf-8');
header("Access-Control-Allow-Origin: *");

require_once 'docwebconnexion.php';
require_once 'docwebadminis.php';
require_once 'docwebresposervey.php';
require_once 'result.php';

use app\document;
use Exception;

$id_from_xhr = isset($_POST["sidxhr"]) ? $_POST["sidxhr"] : NULL;
if(!is_null($id_from_xhr))
{
    session_id($id_from_xhr);
    session_name("PHPSESSID");
}
session_start();

function keepinsession($key, $value)
{
    if(isset($key) && isset($value) && is_string($key))
    {
        $_SESSION[$key] = $value;
    }
}

function emptysession()
{
    unset($_SESSION['document']);
}

function identterm()
{
    $u_agent = $_SERVER['HTTP_USER_AGENT'];
    $bname = 'Unknown';
    $platform = 'Unknown';
    $version= "";
    
    if (preg_match('/linux/i', $u_agent))
    {
        $platform = 'linux';
    }
    elseif (preg_match('/macintosh|mac os x/i', $u_agent))
    {
        $platform = 'mac';
    }
    elseif (preg_match('/windows|win32/i', $u_agent))
    {
        $platform = 'windows';
    }
    
    if(preg_match('/MSIE/i',$u_agent) && !preg_match('/Opera/i',$u_agent))
    {
        $bname = 'Internet Explorer';
        $ub = "MSIE";
    }
    elseif(preg_match('/Firefox/i',$u_agent))
    {
        $bname = 'Mozilla Firefox';
        $ub = "Firefox";
    }
    elseif(preg_match('/Chrome/i',$u_agent))
    {
        $bname = 'Google Chrome';
        $ub = "Chrome";
    }
    elseif(preg_match('/Safari/i',$u_agent))
    {
        $bname = 'Apple Safari';
        $ub = "Safari";
    }
    elseif(preg_match('/Opera/i',$u_agent))
    {
        $bname = 'Opera';
        $ub = "Opera";
    }
    elseif(preg_match('/Netscape/i',$u_agent))
    {
        $bname = 'Netscape';
        $ub = "Netscape";
    }
    
    $known = array('Version', $ub, 'other');
    $pattern = '#(?<browser>' . join('|', $known) . ')[/ ]+(?<version>[0-9.|a-zA-Z.]*)#';
    if (!preg_match_all($pattern, $u_agent, $matches))
    {
    }
    
    $i = count($matches['browser']);
    if ($i != 1)
    {
        if (strripos($u_agent,"Version") < strripos($u_agent,$ub))
        {
            $version= $matches['version'][0];
        }
        else
        {
            $version= $matches['version'][1];
        }
    }
    else
    {
        $version= $matches['version'][0];
    }
    
    if ($version==null || $version=="")
    {
        $version="?";
    }
    
    return $platform . '-' . $bname . '-' . $version;
    
}

function adrip()
{
    if (isset($_SERVER['HTTP_CLIENT_IP']))
    {
        return $_SERVER['HTTP_CLIENT_IP'];
    }
    if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
    {
        return $_SERVER['HTTP_X_FORWARDED_FOR'];
    }
    if(isset($_SERVER['HTTP_X_FORWARDED']))
    {
        return $_SERVER['HTTP_X_FORWARDED'];
    }
    if(isset($_SERVER['HTTP_X_CLUSTER_CLIENT_IP']))
    {
        return $_SERVER['HTTP_X_CLUSTER_CLIENT_IP'];
    }
    if(isset($_SERVER['HTTP_FORWARDED_FOR']))
    {
        return $_SERVER['HTTP_FORWARDED_FOR'];
    }
    if(isset($_SERVER['HTTP_FORWARDED']))
    {
        return $_SERVER['HTTP_FORWARDED'];
    }
    if(isset($_SERVER['REMOTE_ADDR']))
    {
        return $_SERVER['REMOTE_ADDR'];
    }
    return NULL;
}

if(isset($_POST['action']))
{
    $action = $_POST['action'];
}
else
{
    $data = new result(4, NULL);
    echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
    exit();
}

switch ($action) 
{        
    case 'initialiserunespacetravail': 
        try
        {  
            switch (trim($_POST['nomesptrav']))
            {
                case 'webconnexion':
                    keepinsession('document', new docwebconnexion());
                    break;
                case 'webadminis':
                    keepinsession('document', new docwebadminis());
                    break;
            }
            
            $_SESSION['document']->chargerespacetravail(trim($_POST['nomesptrav']));
            $_SESSION['document']->chargermesvues();
            $_SESSION['document']->definirlavuecourante($_SESSION['document']->obtenirmavuedefaut());
            $_SESSION['document']->vuecourante->chargermescomposants();
            
            $body = [
                'action' => "construirelavuecourante",
                'data' => [
                    'nomesptrav' => $_SESSION['document']->getNomesptrav(), 
                    'vuecourante' => $_SESSION['document']->vuecourante->obtenirvue(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }            
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecinitesptrav', 'msg' => $e->getMessage(),
                'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'initialiserunevue':
        try
        {
            $_SESSION['document']->definirlavuecourante($_SESSION['document']->obtenirunevue(trim($_POST['nomvue'])));
            $_SESSION['document']->vuecourante->chargermescomposants();
            
            $body = [
                'action' => "construirelavuecourante",
                'data' => [
                    'nomesptrav' => $_SESSION['document']->getNomesptrav(), 
                    'vuecourante' => $_SESSION['document']->vuecourante->obtenirvue(),
                    'connexion' => $_SESSION['document']->getConnexion(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecinitvue', 'msg' => $e->getMessage(),
                'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'modifierlalangue':
        try
        {
            if(!isset($_SESSION['document']))
            {
                keepinsession('document', new document());
                $_SESSION['document']->chargerespacetravail(trim($_POST['nomesptrav']));
                $_SESSION['document']->chargermesvues();
                $_SESSION['document']->definirlavuecourante($_SESSION['document']->obtenirmavuedefaut());
                $_SESSION['document']->vuecourante->chargermescomposants();
            }
            $_SESSION['document']->setLang(trim($_POST['lang']));
            
            
            $body = [
                'action' => "construirelavuecourante",
                'data' => [
                    'nomesptrav' => $_SESSION['document']->getNomesptrav(), 
                    'vuecourante' => $_SESSION['document']->vuecourante->obtenirvue(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecmodiflang', 'msg' => $e->getMessage(),
                'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'initialiseruncomposant':
        try
        {
            keepinsession('useragent', $_SERVER['HTTP_USER_AGENT']);
            $_SESSION['document']->vuecourante->obteniruncomposant(trim($_POST['nomcompo']))->chargermescontenus(trim($_POST['lang']));
            
            $body = [
                'action' => "construireuncomposant",
                'data' => [
                    'nomesptrav' => $_SESSION['document']->getNomesptrav(),
                    'nomvue' => $_SESSION['document']->vuecourante->getNomvue(),
                    'composant' => $_SESSION['document']->vuecourante->obteniruncomposant(trim($_POST['nomcompo']))->obtenircomposant(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecinitcompo', 'msg' => $e->getMessage(),
                'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'verifierlaconnexion':
        try
        {
            switch (trim($_POST['nomesptrav']))
            {
                case 'webconnexion':
                    keepinsession('document', new docwebconnexion());
                    break;
                case 'webadminis':
                    keepinsession('document', new docwebadminis());
                    break;
                case 'webresposervey':                    
                    keepinsession('document', new docwebresposervey());
                    break;
            }
            $_SESSION['document']->verifierlaconnexion(trim($_POST['codeconn']), identterm(), adrip());
            
            $_SESSION['document']->chargerespacetravail(trim($_POST['nomesptrav']));
            $_SESSION['document']->chargermesvues();
            $_SESSION['document']->definirlavuecourante($_SESSION['document']->obtenirmavuedefaut());
            $_SESSION['document']->vuecourante->chargermescomposants();
            
            $body = [
                'action' => "construirelavuecourante",
                'data' => [
                    'nomesptrav' => $_SESSION['document']->getNomesptrav(),
                    'vuecourante' => $_SESSION['document']->vuecourante->obtenirvue(),
                    'connexion' => $_SESSION['document']->getConnexion(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "redirigerversconnexion",
                'data' => [
                    'url' => "https://servey.sowitelgroup.com/",
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
            /*$body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecsedeconn', 'msg' => $e->getMessage(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);*/
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'sedeconnecter':
        try
        {
            $_SESSION['document']->sedeconnecter(trim($_POST['codeconn']));
            emptysession();
            $body = [
                'action' => "redirigerversconnexion",
                'data' => [
                    'url' => "https://servey.sowitelgroup.com/",
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecsedeconn', 'msg' => $e->getMessage(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'cmdesidentifier':
        try
        {   
            $_SESSION['document']->cmdesidentifier(trim($_POST['login']), trim($_POST['mdp']));
            
            $body = [
                'action' => "signalersucces",
                'data' => [
                    'categorie' => "succescmdesidentifier",
                    'msg' => utf8_encode("Votre compte a été identifié avec succès. Bienvenue, " . $_SESSION['document']->getCompte()['nomcompte']),
                    'codecompte' => $_SESSION['document']->getCompte()['codecompte'],
                    'nomcompte' => $_SESSION['document']->getCompte()['nomcompte'],
                    'profils' => $_SESSION['document']->obtenirmesprofils(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecmdesidentifier', 'msg' => $e->getMessage(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'cmdeannulerconnexion':
        try
        {
            $_SESSION['document']->cmdeannulerconnexion();
            
            $body = [
                'action' => "signalersucces",
                'data' => [
                    'categorie' => "succescmdeannulerconnexion",
                    'msg' => utf8_encode("Annulation effectuée avec succès."),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => [
                    'categorie' => 'echecmdeannulerconnexion', 'msg' => $e->getMessage(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'cmdevaliderconnexion':
        try
        {
            $_SESSION['document']->cmdevaliderconnexion(trim($_POST['codecompte']), trim($_POST['codesptrav']), identterm(), adrip());
            $body = [
                'action' => "signalersucces",
                'data' => [
                    'categorie' => "succescmdevaliderconnexion",
                    'msg' => utf8_encode("Votre connexion s'est effectué avec succès. Vous serez rediriger vers votre espace de travail dans quelques seconde"),
                    'codeconn' => $_SESSION['document']->getConnexion()['codeconn'],
                    'lienesptrav' => $_SESSION['document']->getConnexion()['lienesptrav'],
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            emptysession();
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecmdevaliderconnexion', 'msg' => $e->getMessage(),
                            'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'cmdeobtenirleserveys':
        try
        {
            $_SESSION['document']->cmdeobtenirleserveys(isset($_POST['critere']) ? trim($_POST['critere']) : NULL, trim($_POST['debut']), trim($_POST['limit']));
            $body = [
                'action' => "signalersucces",
                'data' => [
                    'categorie' => "succescmdeobtenirleserveys",
                    'msg' => utf8_encode("Serveys chargées avec succès."),
                    'serveys' => $_SESSION['document']->obtenirmeserveys(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecmdecmdeobtenirleserveys', 'msg' => $e->getMessage(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'cmdeobtenirunservey':
        try
        {
            $_SESSION['document']->cmdeobtenirunservey(trim($_POST['codeservey']));
            $body = [
                'action' => "signalersucces",
                'data' => [
                    'categorie' => "succescmdeobtenirunservey",
                    'msg' => utf8_encode("Servey chargé avec succès."),
                    'servey' => $_SESSION['document']->obtenirmatransaction(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecmdeobtenirunservey', 'msg' => $e->getMessage(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'cmdeobtenirlistepays':
        try
        {
            $_SESSION['document']->cmdeobtenirlistepays();
            $body = [
                'action' => "signalersucces",
                'data' => [
                    'categorie' => "succescmdeobtenirlistepays",
                    'msg' => utf8_encode("Liste pays chargée avec succès."),
                    'listepays' => $_SESSION['document']->obtenirlistepays(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecmdeobtenirlistepays', 'msg' => $e->getMessage(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'cmdeobtenirlisteville':
        try
        {
            $_SESSION['document']->cmdeobtenirlisteville(trim($_POST['codepays']));
            $body = [
                'action' => "signalersucces",
                'data' => [
                    'categorie' => "succescmdeobtenirlisteville",
                    'msg' => utf8_encode("Liste ville chargée avec succès."),
                    'listeville' => $_SESSION['document']->obtenirlisteville(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecmdeobtenirlisteville', 'msg' => $e->getMessage(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
        
    case 'cmdeobtenirlisteoperateur':
        try
        {
            $_SESSION['document']->cmdeobtenirlisteoperateur(trim($_POST['codepays']));
            $body = [
                'action' => "signalersucces",
                'data' => [
                    'categorie' => "succescmdeobtenirlisteoperateur",
                    'msg' => utf8_encode("Liste operateur chargée avec succès."),
                    'listeoperateur' => $_SESSION['document']->obtenirlisteoperateur(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(3, $body);
        }
        catch (\Exception $e)
        {
            $body = [
                'action' => "signalerexception",
                'data' => ['categorie' => 'echecmdeobtenirlisteoperateur', 'msg' => $e->getMessage(),
                    'sidxhr' => is_null($id_from_xhr) ? session_id() : $id_from_xhr
                ]
            ];
            $data = new result(4, $body);
        }
        
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
           
    default:
        $data = new result(4, NULL);
        echo json_encode($data, JSON_UNESCAPED_SLASHES || JSON_UNESCAPED_UNICODE);
        exit();
}

