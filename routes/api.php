<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{AdminController, WorkerController, ClientController, ClientOrderController, FileController, PostController, WorkerProfileController, WorkerReviewController};
use App\Http\Controllers\AdminDashboard\{AdminNotificationController, PostStatusController};


Route::prefix('auth')->group(function () {

    Route::controller(AdminController::class)->prefix('admin')->group(function () {
        Route::post('/register', 'register');
        Route::post('/login',  'login');
        Route::post('/logout', 'logout');
        Route::post('/refresh',  'refresh');
        Route::get('/user-profile', 'userProfile');
    });

    Route::controller(WorkerController::class)->prefix('worker')->group(function () {
        Route::post('/register', 'register');
        Route::post('/login',  'login');
        Route::post('/logout', 'logout');
        Route::post('/refresh',  'refresh');
        Route::get('/verify/{token}', 'verify');
    });

    Route::controller(ClientController::class)->prefix('client')->group(function () {
        Route::post('/register', 'register');
        Route::post('/login',  'login');
        Route::post('/logout', 'logout');
        Route::post('/refresh',  'refresh');
        Route::get('/user-profile', 'userProfile');
    });
});

Route::get('/unauthorized', function () {
    return response()->json([
        "message" => "Unauthorized"
    ], 401);
})->name('login');

Route::controller(PostController::class)->prefix('worker/post')->group(function () {
    Route::get('/all_posts', 'index')->middleware('auth:admin');
    Route::get('/show/{id}', 'show')->middleware('auth:admin');
    Route::post('/add', 'store')->middleware('auth:worker');
    Route::get('/approved', 'approved');
});

Route::prefix('worker')->group(function () {
    Route::get('pending/orders', [ClientOrderController::class, 'workerOrder'])->middleware('auth:worker');
    Route::patch('update/order/{id}', [ClientOrderController::class, 'update'])->middleware('auth:worker');
    Route::post('/review', [WorkerReviewController::class, 'store'])->middleware('auth:client');
    Route::get('/review/post/{postId}', [WorkerReviewController::class, 'postRate'])->middleware('auth:worker');
    Route::get('/profile', [WorkerProfileController::class, 'userProfile'])->middleware('auth:worker');
    Route::get('/profile/edit', [WorkerProfileController::class, 'edit'])->middleware('auth:worker');
    Route::post('/profile/update', [WorkerProfileController::class, 'update'])->middleware('auth:worker');
    Route::delete('/profile/posts/delete', [WorkerProfileController::class, 'delete'])->middleware('auth:worker');
    Route::get('export', [FileController::class, 'export']);
    Route::post('import', [FileController::class, 'import']);
});

Route::prefix('admin')->group(function () {

    Route::controller(PostStatusController::class)
        ->prefix('/post')->group(function () {
            Route::post('/status', 'changeStatus');
        });

    Route::controller(AdminNotificationController::class)
        ->middleware('auth:admin')
        ->prefix('/notification')->group(function () {
            Route::get('/all', 'index');
            Route::get('/unread', 'unread');
            Route::post('/markReadAll', 'markReadAll');
            Route::delete('/deleteAll', 'deleteAll');
            Route::delete('/delete/{id}', 'delete');
        });
});

Route::prefix('client')->group(function () {
    Route::controller(ClientOrderController::class)->prefix('/order')->group(function () {
        Route::post('/request', 'addOrder')->middleware('auth:client');
    });
});
