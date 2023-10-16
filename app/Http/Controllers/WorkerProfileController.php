<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdatingProfileRequest;
use App\Models\Post;
use App\Models\Worker;
use App\Models\WorkerReview;
use App\Services\WorkerService\UpdatingProfileService;
use Illuminate\Http\Request;

class WorkerProfileController extends Controller
{

    public function userProfile()
    {
        // Get the worker ID
        $workerId = auth()->guard('worker')->id();

        // Get the worker with posts relation
        $worker = Worker::with("posts.reviews")->find($workerId)->makeHidden('status', 'verification_token', 'verified_at');

        // Get the reviews of the worker's posts
        $reviews = WorkerReview::whereIn('post_id', $worker->posts->pluck('id'));

        // Calculate the average rate of the worker
        $rate = round($reviews->sum('rate') / $reviews->count(), 1);

        // Return the worker, reviews, and rate
        return [
            'worker' => array_merge($worker->toArray(), ['rate' => $rate]),
        ];
    }

    public function edit()
    {
        return response()->json([
            "worker" => Worker::find(auth()->guard('worker')->id())->makeHidden('status', 'verified_at', 'verification_token')
        ]);
    }

    public function update(UpdatingProfileRequest $request)
    {
        return (new UpdatingProfileService())->update($request);
    }

    public function delete()
    {
        Post::where('worker_id', auth()->guard('worker')->id())->delete();
        return response()->json([
            "message" => "deleted"
        ]);
    }
}
