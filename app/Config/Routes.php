<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Search::index');
$routes->post('search/results', 'Search::results');

// Rute ini hanya perlu diakses sekali untuk memicu perhitungan
// Perlu diingat, rute ini tidak aman untuk produksi karena tidak ada otentikasi.
// Ganti 'RAHASIA' dengan kata kunci yang sulit ditebak.
$routes->get('admin/triggerPagerank/RAHASIA', 'Search::runPagerankEngine');

// Rute untuk API Graf
$routes->get('api/graph/links/(:num)', 'Graph::links/$1');