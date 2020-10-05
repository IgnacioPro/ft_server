<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'ignacio' );

/** MySQL database password */
define( 'DB_PASSWORD', '42madrid' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'cfM`1UxK<SKa4P9O}NRqQen`9*P9+)E~T9lqGBl!YPQ78&NnR3kx[D?01|tj|]1-');
define('SECURE_AUTH_KEY',  'GZ1tX9aEi9iZW:q!7LEd]J8]c|<?!Q.RpGc}a)~>*SbR>bPSmui[}Gxc^PVJM#X&');
define('LOGGED_IN_KEY',    ' !@k;_rp;ybJT2ZM6*,.+smkTc;T;p->&s;HM|-3?9VjOr`X&F|#%gPl2,jLaj.a');
define('NONCE_KEY',        ')lbxA #WqaBMMsCN~f34xy_]FYawQ:e@+TLOS|/kB|6ze%f|N7_5%5/HxAtzeBd#');
define('AUTH_SALT',        '-5<.t5md31>R_4 Z{y$D`1qLd-W/{}RBprWIP6$mUDayU2A>:HWYcAAX7.Blw4Om');
define('SECURE_AUTH_SALT', ',WaX>Q=e~r=0<E.`Ea,K`nF}=PXgeBg.L29*U]SRn n@FU2v[!-M,0%-UzCKL}q7');
define('LOGGED_IN_SALT',   '5[W~N ;OK32miRxHSR7s 5-$l;n$cDY*+%QB]YyGdbDeA3jz})cnycD|YPZrPn+3');
define('NONCE_SALT',       'bhz<kE7A(K/yD+<W4aBQ-FEM/CloZ-+H$V7J^#SG5!k5@$zbR=A=>4@K>yVbj.6j');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
