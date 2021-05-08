<?php
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pass' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

define('AUTH_KEY',         'w?fQ[R{hvu`?Ila*n?S5{7(^)7t?Hb30t 7<sJ9:T2o|-fFbg[>| ),<hYm-`JH:');
define('SECURE_AUTH_KEY',  'U++&fsnlI[Sn?%@p$kC7+fziC<VV]nhcKX;#[^|mTCmdZwKv`FI:c!:G] f0q88B');
define('LOGGED_IN_KEY',    'h.!8r~5vg|RaS+K.67q/p}w)Y.Q+.00btF_Cn1s8Ct~MiFZO XJ>!41n![`h;U/X');
define('NONCE_KEY',        '.1%Z-.P;M;W^hwpm+AQd1#*B < )|pg4HMY!tF#AYBiT<(}LFyractbM!]-_MUtg');
define('AUTH_SALT',        'X[g1(&W;E sv~l-D-^dMN}N M)4ql _:mv|g)a)-8ukD@*vHIa3kc/Yy{:O[[CR8');
define('SECURE_AUTH_SALT', '!+U+h]NJ.a#-iqLheO~+OGw@vTTR`74}Yqp:Uhw|b;0BI_/AO0M1 Sf#^omMuuPS');
define('LOGGED_IN_SALT',   'MWYXv#q!l7i(f*4eey6.FX ^HZ}p)rpw[b2:)eu!!BY_N>x2jaQ~n &R347->Zfw');
define('NONCE_SALT',       'n9X;w1F cPOP~QA&[f#;Pau>~TY_xuK{dz&bhp;x5=/BUz*^uUf^TK|W`-eju#LS');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';