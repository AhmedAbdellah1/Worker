<?php

namespace App\Http\Requests;


use Illuminate\Foundation\Http\FormRequest;

class UpdatingProfileRequest extends FormRequest
{

    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'name' => 'required|string|between:2,100',
            'email' => 'required|string|email|max:100|unique:workers,email,' . auth()->guard('worker')->id(),
            'password' => 'nullable|string|min:6',
            'phone' => 'required|string|max:17',
            'photo' => 'nullable',
            'location' => 'required|string|min:5',
        ];
    }
}
