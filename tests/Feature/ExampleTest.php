<?php

test('tamu yang membuka halaman utama diarahkan ke login', function () {
    $response = $this->get('/');

    $response->assertRedirect('/login');
});
