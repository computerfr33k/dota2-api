<?php
/**
 * Information about heroes (id, name, localized name).
 *
 * @author kronus
 *
 * @example
 * <code>
 *   $heroes = new heroes();
 *   $heroes->parse();
 *   $heroes-get_data_by_id(97); // get info about Magnus
 *   $heroes->get_img_url_by_id(97, false); // large image
 *   $heroes->get_img_url_by_id(97); // thumb
 * </code>
 */
class heroes extends heroes_data
{
    public function __construct()
    {
        $this->set_filename('heroes.json');
        $this->set_field('heroes');
        //$this->_suffixes['thumb'] = 'sb';
    }
}
