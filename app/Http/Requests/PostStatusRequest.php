<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class PostStatusRequest extends FormRequest
{

    public function authorize(): bool
    {
        return true;
    }


    public function rules(): array
    {
        return [
            "post_id" => "required|exists:posts,id",
            "status" => "required|in:approved,rejected",
            "rejected_reason" => "required_if:status,rejected",
        ];
    }
}
