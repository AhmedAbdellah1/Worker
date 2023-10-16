<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoringPostRequest extends FormRequest
{

    public function authorize(): bool
    {
        return true;
    }


    public function rules(): array
    {
        return [
            "content" => "required|string",
            "price" => "required|numeric",
            "photos.*" => "nullable|image|mimes:png,jpg,jpeg",
            // This is typically used when you allow multiple file uploads with the same field name.
        ];
    }
}
