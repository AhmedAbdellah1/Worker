<?php

namespace App\Http\Controllers;

use App\Http\Requests\ClientOrderRequest;
use App\Models\Client;
use App\Models\ClientOrder;
use Illuminate\Http\Request;

class ClientOrderController extends Controller
{
    function addOrder(ClientOrderRequest $request)
    {
        $clientId = auth()->guard('client')->id();

        // this to check if the client has already ordered the post
        // if the table clientOrder has a record with the same client_id and post_id then the client has already ordered the post
        // if the table clientOrder has no record with the same client_id and post_id then the client has not ordered the post
        if (ClientOrder::where('client_id', $clientId)->where('post_id', $request->post_id)->exists()) {
            return response()->json([
                'message' => "LOL You have already ordered"
            ], 406);
        }

        $data = $request->all();

        $data['client_id'] = $clientId;

        $order = ClientOrder::create($data);

        return response()->json([
            'message' => "success",
            'order' => $order
        ], 200);
    }

    function workerOrder()
    {
        // this to get all the orders(orders and posts and clients) of the worker that is logged in and the status is pending (not accepted or rejected) and the post is posted by the worker
        $orders = ClientOrder::with('post', 'client')->whereStatus('pending')->whereHas('post', function ($query) {
            $query->where('worker_id', auth()->guard('worker')->id());
        })->get();

        return response()->json([

            'orders' => $orders

        ], 200);
    }

    function update($id, Request $request)
    {
        $order = ClientOrder::find($id);

        $order->setAttribute('status', $request->status)->save();
        // OR
        // $order->update(['status' => $request->status]);
        return response()->json([
            'message' => 'updated',
            'order' => $order
        ], 200);
    }
}
