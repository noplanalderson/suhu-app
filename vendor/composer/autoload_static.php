<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit1b79a58fad84d27b42b68ace26f20716
{
    public static $prefixLengthsPsr4 = array (
        'C' => 
        array (
            'Cron\\' => 5,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Cron\\' => 
        array (
            0 => __DIR__ . '/..' . '/poliander/cron/src/Cron',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit1b79a58fad84d27b42b68ace26f20716::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit1b79a58fad84d27b42b68ace26f20716::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit1b79a58fad84d27b42b68ace26f20716::$classMap;

        }, null, ClassLoader::class);
    }
}
