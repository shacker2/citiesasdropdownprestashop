<?php
/*
* 2007-2012 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 14001 $
*  @license	http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

class CityCore extends ObjectModel
{

   public $id_city;
   public $id_state;
   public $name;

   
	protected 	$fieldsRequired = array('id_city', 'name');
	protected 	$fieldsSize = array('name' => 128, 'id_state' => 10);
	protected 	$fieldsValidate = array('name' => 'isGenericName', 'id_state' => 'isUnsignedId', );

	protected 	$table = 'city';
	protected 	$identifier = 'id_city';
   
	private static $_cache_get_cities = array(); 
   
   
	public function getFields()
	{
		parent::validateFields();
		$fields['id_city'] = (int)($this->id_city);
		$fields['name'] = pSQL($this->name);
		$fields['id_state'] = pSQL($this->id_state);      
		return $fields;
	}
   

	public function delete()
	{
		$id = $this->id;
		parent::delete();
	}   
   
   
	public static function getCities($id_state)
	{

			$id_city = Db::getInstance()->ExecuteS('
			SELECT * FROM `'._DB_PREFIX_.'city`
			WHERE `id_state` = '.(int)$id_state.' 
         ORDER BY `name`;'
			);
		

		return $id_city;
	}
   
   
   public static function getCityName($id_city)
   {
		return Db::getInstance()->getValue('
		SELECT `name` FROM `'._DB_PREFIX_.'city`
		WHERE `id_city` = '.(int)$id_city
		);  
   }

}