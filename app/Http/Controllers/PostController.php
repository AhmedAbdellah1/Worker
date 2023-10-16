<?php

namespace App\Http\Controllers;

use App\filter\PostFilter;
use App\Models\Post;
use Illuminate\Http\Request;
use Spatie\QueryBuilder\QueryBuilder;
use Spatie\QueryBuilder\AllowedFilter;
use App\Http\Requests\StoringPostRequest;
use Illuminate\Database\Eloquent\Builder;
use App\Services\PostService\StoringPostService;

class PostController extends Controller
{

    function store(StoringPostRequest $request)
    {
        return (new StoringPostService())->store($request);
    }

    public function index()
    {
        $posts = Post::all();
        return response()->json([
            "posts" => $posts
        ]);
    }

    public function show($id)
    {
        $post = Post::find($id);
        if ($post) {
            return response()->json([
                "post" => $post
            ]);
        } else {
            return response()->json([
                "error" => "Post not found"
            ]);
        }
    }

    public function approved(Request $request)
    {

        // $posts = Post::with('worker:id,name')->where('status', 'approved')->get();

        // OR

        // $posts = QueryBuilder::for(Post::class)
        // ->allowedFilters(['content', 'price', 'worker.name'])
        // ->with('worker:id,name')
        // ->where('status', 'approved')
        // ->get();

        //OR

        $posts = QueryBuilder::for(Post::class)
            ->allowedFilters((new PostFilter)->filter())
            ->with('worker:id,name')
            ->where('status', 'approved')
            ->get(['id', 'content', 'price', 'worker_id']);

        return response()->json([
            "posts" => $posts
        ]);
    }
}
