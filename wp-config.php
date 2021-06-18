<?php

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', $_ENV['ARTIFAKT_MYSQL_DATABASE_NAME'] );

/** MySQL database username */
define( 'DB_USER', $_ENV['ARTIFAKT_MYSQL_USER'] );

/** MySQL database password */
define( 'DB_PASSWORD', $_ENV['ARTIFAKT_MYSQL_PASSWORD'] );

/** MySQL hostname */
define( 'DB_HOST', $_ENV['ARTIFAKT_MYSQL_HOST'] );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );
define('AUTH_KEY',         ($_ENV['AUTH_KEY'] != '') ? $_ENV['AUTH_KEY'] : '!0cYeO;9o]z}8R@Xp55eKiNU~ZtT[wsjW-(Ji=ddL$Yo*O`EXt82 r=EO1-[X}w(');
define('SECURE_AUTH_KEY',  ($_ENV['SECURE_AUTH_KEY'] != '') ? $_ENV['SECURE_AUTH_KEY'] : '2/RGYVWR!:;z2tsuE=e84<Z-Oj>Uvm*GLzNz<53 @|gwBK$Mna%Jb8G#9D/A/xcS');
define('LOGGED_IN_KEY',    ($_ENV['LOGGED_IN_KEY'] != '') ? $_ENV['LOGGED_IN_KEY'] : 'T3C>W`XoF<@_+[P1P-DIh(EF=Otn;hiF D%6@gaI<`4?B`U1jH7]}&@bes]5&],{');
define('NONCE_KEY',        ($_ENV['NONCE_KEY'] != '') ? $_ENV['NONCE_KEY'] : '*hl^lPLoe<m.)w0=Nk-J3z!InR?%LD|?$ou30I0-@,{AW>|V&R-knzDR0hX+os5X');
define('AUTH_SALT',        ($_ENV['AUTH_SALT'] != '') ? $_ENV['AUTH_SALT'] : ')*+-%6ksW-}~|nYeYf%X1uRWv4}O&m}r>P8Vp3V5A&8ly94qouQK2Nre/`_A>~Hd');
define('SECURE_AUTH_SALT', ($_ENV['SECURE_AUTH_SALT'] != '') ? $_ENV['SECURE_AUTH_SALT'] : ',ZoFK~-:L6x(LWvI01e6>S~8zhADT(qO--(aaJ)[ aZke(&i+81K&c89%M+WjFVL');
define('LOGGED_IN_SALT',   ($_ENV['LOGGED_IN_SALT'] != '') ? $_ENV['LOGGED_IN_SALT'] : '-2,><jcgjGm!FriM7A-$6y[R@aj.f,t1)B<$`+q`+hztch~?Ka-n%M;SS|#AbLE*');
define('NONCE_SALT',       ($_ENV['NONCE_SALT'] != '') ? $_ENV['NONCE_SALT'] : 'E-;VUw{6?v tah]~^,dBmN`G=>+L:`OV# I:&h;]YM(lBNEr):BR3h>TP|Z@5=IU');

$table_prefix = 'wp_';

define( 'WP_DEBUG', ($_ENV['WP_DEBUG'] != '') ? $_ENV['WP_DEBUG'] : false);

define( 'WP_DEBUG_LOG', '/var/log/artifakt/wp-errors.log' );

/* That's all, stop editing! Happy publishing. */
/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
    define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );