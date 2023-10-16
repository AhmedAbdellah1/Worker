<?php

return [

    'defaults' => [
        'guard' => 'admin',
        'passwords' => 'admins',
    ],

    'guards' => [
        'web' => [
            'driver' => 'session',
            'provider' => 'users',
        ],
        'admin' => [
            'driver' => 'jwt',
            'provider' => 'admins',
            'hash' => false,
        ],
        'worker' => [
            'driver' => 'jwt',
            'provider' => 'workers',
            'hash' => false,
        ],
        'client' => [
            'driver' => 'jwt',
            'provider' => 'clients',
            'hash' => false,
        ],
    ],

    'providers' => [
        'admins' => [
            'driver' => 'eloquent',
            'model' => App\Models\Admin::class,
        ],
        'workers' => [
            'driver' => 'eloquent',
            'model' => App\Models\Worker::class,
        ],
        'clients' => [
            'driver' => 'eloquent',
            'model' => App\Models\Client::class,
        ],

    ],

    'passwords' => [

        'admins' => [
            'provider' => 'admins',
            'table' => 'password_reset_tokens',
            'expire' => 60,
            'throttle' => 60,
        ],
    ],

    'password_timeout' => 10800,

];
