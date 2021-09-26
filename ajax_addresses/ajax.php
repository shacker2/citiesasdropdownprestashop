<?php
	include(dirname(__FILE__). '/../../config/config.inc.php');
	include(dirname(__FILE__). '/../../init.php');
	
	

$list = '';
// obtengo  city 
if (isset($_GET['ajaxCity']) AND isset($_GET['id_state']))
{
   
$idTemp = ( (int)(Tools::getValue('id_state')) == 0 ? (int)(Tools::getValue('aux_id_state')) : (int)(Tools::getValue('id_state')) );
$idcity =  Tools::getValue('aux_city');
	$states = Db::getInstance()->ExecuteS('
		SELECT C.id_city, C.name
		FROM '._DB_PREFIX_.'city C
		WHERE C.id_state = '.$idTemp.'
		ORDER BY C.`name` ASC');
	$states2 = Db::getInstance()->getRow('
		SELECT C.id_city, C.name
		FROM '._DB_PREFIX_.'city C
		WHERE C.name = \''.$idcity.'\'
		ORDER BY C.`name` ASC');

if ($states2['name'] != null){
  
    		    $list .= '<option value="'.(int)($states2['id_city']).'"  selected="selected">   '.$states2['name'].'</option>'."\n";

    
}

//var_dump($states);
	if (is_array($states) AND !empty($states))
	{
		
		if (Tools::getValue('aux_id_state') != true)
		if($idcity != null){
			$list = '<option value="'.$states2['name'].'" class="showme" >'.($idcity == 0 ? "---" : $idcity) .'</option>'."\n";
		}

		foreach ($states AS $state)
		if($idcity == 0){
			$list .= '<option value="'.(int)($state['id_city']).'"'.((isset($_GET['id_city']) AND $_GET['id_city'] == $state['id_city']) ? ' selected="selected"' : '').'>'.$state['name'].'</option>'."\n";
		} else{
		    $list .= '<option value="'.(int)($state['id_city']).'"'.((isset($idcity) AND $idcity == $state['name']) ? ' selected="selected"' : '').'>'.$state['name'].'</option>'."\n";

		}
	}
	else
		$list = 'false';

	die($list);
}


