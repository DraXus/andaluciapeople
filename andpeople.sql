

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `amigos`
-- 

CREATE TABLE `amigos` (
  `nick` varchar(50) NOT NULL,
  `amigo` varchar(50) NOT NULL
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `comentarios`
-- 

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `sitio` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `sitio` (`sitio`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `eventos`
-- 

CREATE TABLE `eventos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `nombre-sa` varchar(50) NOT NULL COMMENT 'sin acentos',
  `fecha` datetime NOT NULL,
  `sitio` int(11) NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL,
  `descripcion` text,
  `nick` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `eventos_lastfm`
-- 

CREATE TABLE `eventos_lastfm` (
  `id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `fotos`
-- 

CREATE TABLE `fotos` (
  `id` int(11) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `fecha` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `sitio` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `freetagged_objects`
-- 

CREATE TABLE `freetagged_objects` (
  `tag_id` int(10) unsigned NOT NULL default '0',
  `tagger_id` varchar(50) NOT NULL default '0',
  `object_id` int(10) unsigned NOT NULL default '0',
  `tagged_on` datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`tag_id`,`tagger_id`,`object_id`),
  KEY `tagger_id_index` (`tagger_id`),
  KEY `object_id_index` (`object_id`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `freetags`
-- 

CREATE TABLE `freetags` (
  `id` int(10) unsigned NOT NULL,
  `tag` varchar(30) NOT NULL default '',
  `raw_tag` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `intentoslogin`
-- 

CREATE TABLE `intentoslogin` (
  `ip` varchar(20) NOT NULL,
  `attempts` int(11) NOT NULL,
  `lastlogin` datetime NOT NULL
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `limitaciones`
-- 

CREATE TABLE `limitaciones` (
  `id` int(11) NOT NULL,
  `nick` varchar(50) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `contador` int(2) NOT NULL,
  `sitio` int(11) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY  (`id`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `mensajes`
-- 

CREATE TABLE `mensajes` (
  `id` int(11) NOT NULL,
  `remitente` varchar(50) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `destino` varchar(50) NOT NULL,
  `leido` tinyint(1) NOT NULL default '0',
  `destacado` tinyint(1) NOT NULL default '0',
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `mensaje` text NOT NULL,
  `enviado` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `opciones`
-- 

CREATE TABLE `opciones` (
  `name` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  PRIMARY KEY  (`name`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `ciudades`
-- 

CREATE TABLE `ciudades` (
  `slug` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`slug`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `sitios`
-- 

CREATE TABLE `sitios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `nombre-sa` varchar(32) NOT NULL COMMENT 'nombre sin acentos',
  `direccion` varchar(80) NOT NULL,
  `zona` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `web` varchar(50) default NULL,
  `lat` float NOT NULL default '0',
  `lng` float NOT NULL default '0',
  `rank` int(2) NOT NULL default '0',
  `pack` int(2) NOT NULL default '0',
  `descripcion` text NOT NULL,
  `votos` int(11) unsigned NOT NULL default '0',
  `tipo` varchar(50) NOT NULL,
  `nick` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `nombre` (`nombre`,`zona`),
  KEY `nombre-sa` (`nombre-sa`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `usuarios`
-- 

CREATE TABLE `usuarios` (
  `nick` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `web` varchar(100) default NULL,
  `imagen` varchar(200) default NULL,
  `fecha` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `boletin` tinyint(1) default '1',
  `sexo` varchar(1) default NULL,
  `nacimiento` date default NULL,
  `notificaciones` tinyint(1) default '1',
  `idioma` varchar(2) default 'es',
  `rol` tinyint(4) NOT NULL default '0',
  `zona` varchar(50) default NULL,
  `ciudad` varchar(50) default NULL,
  PRIMARY KEY  (`nick`)
);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `votos`
-- 

CREATE TABLE `votos` (
  `id` int(11) NOT NULL,
  `nick` varchar(20) NOT NULL,
  `valoracion` tinyint(3) unsigned NOT NULL default '0',
  `fecha` datetime NOT NULL,
  `ip` varchar(15) NOT NULL,
  `sitio` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `sitio` (`sitio`)
);
