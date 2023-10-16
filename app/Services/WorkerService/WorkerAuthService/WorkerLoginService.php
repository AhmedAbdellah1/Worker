<?php

namespace App\Services\WorkerService\WorkerAuthService;

use App\Models\Worker;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

/**
 * The WorkerLoginService class handles the authentication and status checks for worker accounts.
 * This class provides functions for validating input data, checking data validity, getting the status
 * of a worker account, verifying account status, creating a new authentication token, and performing
 * the login process.
 */
class WorkerLoginService
{

    protected $model;

    // Initializes the $model property with a new instance of the Worker model.
    function __construct()
    {
        $this->model = new Worker;
    }

    /**
     * Validate the input request data against specified validation rules.
     * @param $request The input request object.
     * @return mixed Returns the validator object or a JSON response with validation errors and status code 422 if validation fails.
     */
    function validation($request)
    {

        $validator = Validator::make($request->all(), $request->rules());

        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }
        return $validator;
    }

    /**
     * Check if the provided data is valid for authentication.
     * Attempt to generate a token using Laravel Passport's 'attempt' method for the 'worker' guard.
     * @param $data The data to be validated.
     * @return mixed Returns the generated token or a JSON response with an error message and status code 401 if token generation fails.
     */
    function isValidData($data)
    {
        if (!$token = auth()->guard('worker')->attempt($data->validated())) {
            return response()->json(['error' => 'invalid data'], 401);
        }
        return $token;
    }

    /**
     * Get the status of a worker's account based on the provided email.
     * @param $email The email address of the worker.
     * @return mixed Returns the account status of the worker.
     */
    function getStatus($email)
    {
        $worker =  $this->model->whereEmail($email)->first();
        $status = $worker->status;
        return $status;
    }

    /**
     * Check if a worker's account is verified based on the provided email.
     * @param $email The email address of the worker.
     * @return mixed Returns the verified_at timestamp or null if the account is unverified.
     */
    function isVerified($email)
    {
        $worker =  $this->model->whereEmail($email)->first();
        $verified = $worker->verified_at;
        return $verified;
    }

    /**
     * Generate a new JSON response containing an access token, token type, expiration time, and user information.
     * Used to format the response when a user successfully logs in.
     * @param $token The authentication token to include in the response.
     * @return mixed Returns a JSON response with the authentication details.
     */
    protected function createNewToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => Auth::factory()->getTTL() * 60,
            'user' => auth()->guard('worker')->user()
        ]);
    }

    /**
     * Perform نفذ the login process.
     * Validates input data, checks data validity, and handles account status checks.
     * Returns a JSON response with an authentication token upon successful login.
     * @param $request The input request object for login.
     * @return mixed Returns a JSON response with the authentication token or an error response if login fails.
     */

    function login($request)
    {
        $data =  $this->validation($request);
        $token = $this->isValidData($data);

        if ($this->isVerified($request->email) === null) {
            // لم يتم التحقق من حسابك
            return response()->json(["message" => "your account is not verified"], 422);
        } elseif ($this->getStatus($request->email) === 0) {
            //"حسابك معلق
            return response()->json(["message" => "your account is pending"], 422);
        }

        return $this->createNewToken($token);
    }
}
