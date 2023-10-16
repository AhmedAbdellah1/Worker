<?php

namespace App\Http\Controllers;

use App\Http\Requests\WorkerReviewRequest;
use App\Http\Resources\WorkerReviewResource;
use App\Models\Worker;
use App\Models\WorkerReview;
use Illuminate\Http\Request;

class WorkerReviewController extends Controller
{
    public function store(WorkerReviewRequest $request)
    {
        $data = $request->all();
        $data['client_id'] = auth()->guard('client')->id();

        $reviews = WorkerReview::create($data);
        return response()->json([
            'data' => $reviews
        ]);
    }

    // get all reviews for Specific post
    public function postRate($id)
    {
        // get all reviews for Specific post
        $reviews = WorkerReview::wherePostId($id);
        //get sum of rate and count of reviews for Specific post
        $average = $reviews->sum('rate') / $reviews->count();
        return response()->json([
            // using round function to round up to 1 decimal place
            'total_rate' => round($average, 1),
            'data' => WorkerReviewResource::collection($reviews->get())
        ]);
    }
}
