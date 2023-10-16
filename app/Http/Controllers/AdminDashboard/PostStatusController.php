<?php

namespace App\Http\Controllers\AdminDashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\PostStatusRequest;
use App\Models\Post;
use App\Notifications\AdminPost;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;

class PostStatusController extends Controller
{
    function changeStatus(PostStatusRequest $request)
    {
        $post = Post::find($request->post_id);
        $post->update(['status' => $request->status, 'rejected_reason' => $request->rejected_reason]);

        // to send notification to worker about post status change
        Notification::send($post->worker, new AdminPost($post->worker, $post));

        return response()->json(['success' => 'Status updated successfully.']);
    }
}
