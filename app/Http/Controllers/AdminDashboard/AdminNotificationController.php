<?php

namespace App\Http\Controllers\AdminDashboard;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AdminNotificationController extends Controller
{
    function index()
    {
        // to check if the Admin is logged in
        if (!Auth::check()) {
            return response()->json(["message " => "You must be logged"]);
        }

        // get all the notifications
        $admin = Admin::find(auth()->id());
        return response()->json([
            "notifications" => $admin->notifications
        ]);
    }

    function unread()
    {
        $admin = Admin::find(auth()->id());
        return response()->json([
            "notifications" => $admin->unreadNotifications
        ]);
    }

    function markReadAll()
    {
        $admin = Admin::find(auth()->id());
        foreach ($admin->unreadNotifications as $notification) {
            $notification->markAsRead();
        }
        return response()->json([
            "message" => "success"
        ]);
    }

    function deleteAll()
    {
        $admin = Admin::find(auth()->id());
        $admin->notifications()->delete();
        return response()->json([
            "message" => "deletedAll"
        ]);
    }

    function delete($id)
    {
        // we not have a model notifications so we use the table notifications using the DB facade
        DB::table('notifications')->where('id', $id)->delete();
        return response()->json([
            "message" => "notificationDeleted"
        ]);
    }
}
