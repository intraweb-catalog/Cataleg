<?php

/**
 * @authors Josep Ferràndiz Farré <jferran6@xtec.cat>
 * @authors Jordi Fons Vilardell  <jfons@xtec.cat>
 * @authors Joan Guillén Pelegay  <jguille2@xtec.cat> 
 * 
 * @par Llicència: 
 * GNU/GPL - http://www.gnu.org/copyleft/gpl.html
 * @package Cataleg
 * @version 1.0
 * @copyright Departament d'Ensenyament. Generalitat de Catalunya 2012-2013
 */

class Cataleg_Version extends Zikula_AbstractVersion
{
    public function getMetaData()
    {
        $meta=array();
        $meta['version'] = '1.1.1';
        $meta['description'] = $this->__('Elaboració i consulta del catàleg unificat de formació permanent del Departament d\'Ensenyament.');
        $meta['displayname'] = $this->__('Catàleg');
        $meta['url'] = $this->__('cataleg');
        $meta['securityschema'] = array('Cataleg::' => '::','CatalegAdmin::' => '::', 'SiriusAdmin::' => '::');
        return $meta;
    }
}