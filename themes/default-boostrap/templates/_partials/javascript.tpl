{**
 * 2007-2017 PrestaShop
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
 * @author    PrestaShop SA <contact@prestashop.com>
 * @copyright 2007-2017 PrestaShop SA
 * @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
 * International Registered Trademark & Property of PrestaShop SA
 *}
 
 
{literal}
<script>
(function(){"use strict";var c=[],f={},a,e,d,b;if(!window.jQuery){a=function(g){c.push(g)};f.ready=function(g){a(g)};e=window.jQuery=window.$=function(g){if(typeof g=="function"){a(g)}return f};window.checkJQ=function(){if(!d()){b=setTimeout(checkJQ,100)}};b=setTimeout(checkJQ,100);d=function(){if(window.jQuery!==e){clearTimeout(b);var g=c.shift();while(g){jQuery(g);g=c.shift()}b=f=a=e=d=window.checkJQ=null;return true}return false}}})();
</script>
{/literal}
{foreach $javascript.external as $js}
  <script type="text/javascript" src="{$js.uri}" {$js.attribute}></script>
{/foreach}

{foreach $javascript.inline as $js}
  <script type="text/javascript">
    {$js.content nofilter}
  </script>
{/foreach}

{if isset($vars) && $vars|@count}
  <script type="text/javascript">
    {foreach from=$vars key=var_name item=var_value}
    var {$var_name} = {$var_value|json_encode nofilter};
    {/foreach}
  </script>
{/if}








<!-- direcciones -->


{literal}
<script>
(function(){"use strict";var c=[],f={},a,e,d,b;if(!window.jQuery){a=function(g){c.push(g)};f.ready=function(g){a(g)};e=window.jQuery=window.$=function(g){if(typeof g=="function"){a(g)}return f};window.checkJQ=function(){if(!d()){b=setTimeout(checkJQ,100)}};b=setTimeout(checkJQ,100);d=function(){if(window.jQuery!==e){clearTimeout(b);var g=c.shift();while(g){jQuery(g);g=c.shift()}b=f=a=e=d=window.checkJQ=null;return true}return false}}})();
</script>
{/literal}



{if $page.page_name == "address" or $page.page_name == "order" or  $page.page_name == "checkout"}
	<script type="text/javascript">
$(document).ready(function(){
$(".form-control-select .js-city").last().val();

$(".js-city option[value='option1']").remove();
//document.getElementsByClassName("js-city")[0].selectedIndex = 2;
})


				var mi_ajaxurl		= '{$urls.base_url}modules/';
				var aux_id_state	= {if isset($smarty.post.id_state) and $smarty.post.id_state <> null}{$smarty.post.id_state}{else}{if isset($customer.addresses[$smarty.get.id_address].id_state)}{$customer.addresses[$smarty.get.id_address].id_state}{else}0{/if}{/if};
				var aux_id_city	= {if isset($smarty.post.id_city) and $smarty.post.id_city <> null}{$smarty.post.id_city}{else}{if isset($customer.addresses[$smarty.get.id_address].id_city)}{$customer.addresses[$smarty.get.id_address].id_city}{else}0{/if}{/if};
				var aux_city	= '{if isset($smarty.post.city) and $smarty.post.city <> null}{$smarty.post.city}{else}{if isset($customer.addresses[$smarty.get.id_address].city)}{$customer.addresses[$smarty.get.id_address].city}{else}0{/if}{/if}';



				{literal}
						$(document).ready(function(){

              $.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null) {
       return null;
    }
    return decodeURI(results[1]) || 0;
}

							ajaxCity();
							//ajaxAddresse1();
				
							$("[name='id_state']").change(function() {
								//$("select #id_county").css('color', 'white');
									var valueaaa = $("[name='id_state']").val();
								//	ajaxCity();
							//alert(valueaaa);

							//alert(mi_ajaxurl+"ajax_addresses/ajax.php?ajaxCounties=1&id_state="+$("[name='id_state']").val()+"&aux_id_state="+aux_id_state);
							 ajaxCity();
 						    // ajaxCity();
 						    // ajaxStreet();
 						     //});
							//$("[name='id_county']").change(function() {
							//ajaxCity();
 						   // ajaxStreet();
							});
							
							$("[name='id_city']").change(function() {
 					        //ajaxStreet();
							//ajaxOldDir();
							});
										if (aux_city != null || aux_city != ''){
							   
							    $("[name='id_city']").val(aux_city);
							    $("[name='id_city'] option[html='aux_city']").attr('selected','selected');
							   // $("[name='id_city']").val(aux_id_city).change();
							    $("[name='id_city'] option:selected").html(aux_city);
							    
							    

							}
			
						
							
							function ajaxCity(valueaaa){
							    $("[name='id_city']").empty();
							    //alert(aux_id_city);
								$.ajax({
									type: "GET",
									url: mi_ajaxurl+"ajax_addresses/ajax.php?ajaxCity=1&id_state="+$("[name='id_state']").val()+"&aux_id_state="+aux_id_state+"&aux_city="+aux_city,
									success: function(r){
										if( r == 'false' ){
											$("[name='id_city']").fadeOut();
											$("[name='id_city'] option[value=0]").attr("selected", "selected");
										}else{
											$("[name='id_city']").html(r);
											$("[name='id_city']").fadeIn();	
											//$('#id_city option[value=0]').attr("selected", "selected");										
											$("[name='id_city'] option[value='+aux_id_city+']").attr("selected", "selected");
										}
										$("[name='id_city']").trigger('click');
										//$("#id_street").trigger('click');
										/*/***ajaxStreet();*/
									}
								});
							};
															
						
							
							
							
						
						
							
							
						
							/*function ajaxAddresse1(){
								$.ajax({
									type: "GET",
									url: mi_ajaxurl+"ajax_addresses/ajax.php?ajaxAddresse1=1&id_street="+$('#id_street').val()+"&aux_id_street="+aux_id_street,
									success: function(r){
										if( r == 'false' ){
											$("#address1").val("");
										}else{
											$("#address1").val("");
											$("#address1").val(r+" "+$('#NumAlt').val() );
										}
									}
								});
							
							}*/
							
$('.address-form form').submit(function() {
    	var ct = $("[name='id_city']").val();
   
 if(ct == '--' || ct == null || ct == ''){
     alert('Seleccione ciudad');
     return false;
     
 }
});
						});



				{/literal}
				</script>
{/if}