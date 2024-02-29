<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [HomeController::class, 'index'])->name('home.index');
Route::get('produk/{category}', [HomeController::class, 'produk'])->name('home.produk');
Route::get('kategori/{category}', [HomeController::class, 'kategori'])->name('home.kategori');
Route::get('search', [HomeController::class, 'search'])->name('home.search');
Route::get('home', [HomeController::class, 'redir_admin'])->name('home.redir_admin');

// ----------------------ADMIN----------------------------------
// Route::group(['middleware' => 'revalidate'], function () {
Auth::routes(['register' => false, 'reset' => false]);
Route::get('admin', [AdminController::class, 'index'])->name('admin.index')->middleware(['auth', 'role:admin']);
// route produk
Route::prefix('admin/produk')->middleware(['auth', 'role:admin'])->group(function () {
    Route::get('/', [AdminController::class, 'produk'])->name('admin.produk');
    Route::get('delete/{category}', [AdminController::class, 'delete_produk'])->name('admin.delete_produk');
    Route::post('edit', [AdminController::class, 'edit_produk'])->name('admin.edit_produk');
    Route::post('create', [AdminController::class, 'create_produk'])->name('admin.create_produk');
    Route::post('update', [AdminController::class, 'update_produk'])->name('admin.update_produk');
});

// route kategori
Route::prefix('admin/kategori')->middleware(['auth', 'role:admin'])->group(function () {
    Route::get('/', [AdminController::class, 'kategori'])->name('admin.kategori');
    Route::get('delete/{category}', [AdminController::class, 'delete_kategori'])->name('admin.delete_kategori');
    Route::post('create', [AdminController::class, 'create_kategori'])->name('admin.create_kategori');
    Route::post('update', [AdminController::class, 'update_kategori'])->name('admin.update_kategori');
});

// route orderan
Route::prefix('admin/orders')->middleware(['auth', 'role:admin'])->group(function () {
    Route::get('/', [AdminController::class, 'orders'])->name('admin.orders');
    Route::post('update', [AdminController::class, 'update_order'])->name('orders.update');
});
// route profil
Route::prefix('admin/profil')->middleware(['auth', 'role:admin'])->group(function () {
    Route::get('/', [AdminController::class, 'profil'])->name('admin.profil');
    Route::post('update', [AdminController::class, 'update_profil'])->name('admin.update_profil');
});

// ----------------------CUSTOMER----------------------------------
Route::get('orders', [UserController::class, 'orders'])->name('orders')->middleware(['auth', 'role:pembeli']);
Route::post('order_produk', [UserController::class, 'order_produk'])->name('order_produk')->middleware(['auth', 'role:pembeli']);;
Route::get('/masuk', [UserController::class, 'index']);
Route::post('/masuk', [UserController::class, 'login'])->name('masuk');
Route::get('/buatakun', [UserController::class, 'buatakun'])->name('buatakun');
Route::post('/prosesdaftarakun', [UserController::class, 'prosesdaftarakun'])->name('prosesdaftarakun');
Route::get('/profile', [UserController::class, 'profile']);
