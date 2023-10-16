<?php

namespace App\Services\WorkerService\WorkerAuthService;

use Exception;
use App\Models\Worker;
use App\Mail\VerificationEmail;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class WorkerRegisterService
{
    protected $model;

    // Initialize the $model property with a new Worker instance.
    function __construct()
    {
        $this->model = new Worker;
    }

    function validation($request)
    {
        // Validate the incoming request data using the provided rules.
        $validator = Validator::make($request->all(), $request->rules());

        // If validation fails, return JSON response with validation errors.
        if ($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }

        // Return the validator instance if validation succeeds.
        return $validator;
    }

    function store($data, $request)
    {
        // Create a new Worker instance with the validated data and additional information.
        $worker =  $this->model->create(array_merge(
            $data->validated(),
            [
                'password' => bcrypt($request->password),
                'photo' => $request->file('photo')->store('worker'),
            ]
        ));

        // Return the email address of the created worker.
        return $worker->email;
    }

    function generateToken($email)
    {
        // Generate a random token using MD5, the worker's email, and the current timestamp.
        $token = substr(md5(rand(0, 9) . $email . time()), 0, 32);

        // Retrieve the worker with the provided email from the database.
        // استرداد العامل بالبريد الإلكتروني المقدم من قاعدة البيانات
        $worker = $this->model->whereEmail($email)->first();

        // Associate the generated token with the worker and save it to the database.
        // قم بربط الرمز المميز الذي تم إنشاؤه بالعامل وحفظه في قاعدة البيانات.
        $worker->verification_token = $token;
        $worker->save();
        // Return the updated worker instance.
        return $worker;
    }

    function sendEmail($worker)
    {
        // Send a verification email to the worker
        Mail::to($worker->email)->send(new VerificationEmail($worker));
    }

    function register($request)
    {
        try {

            // Begin a database transaction.

            // Validate the request data and get the validation result.
            $data =  $this->validation($request);

            // Store the worker's data and retrieve their email.
            $email = $this->store($data, $request);

            // Generate a verification token for the worker.
            $worker = $this->generateToken($email);

            // Send a verification email hear
            $this->sendEmail($worker);
            // Commit the database transaction.
            DB::commit();

            // Return a JSON response indicating successful account creation.
            return response()->json(["message" => "Account has been created. Please check your email."]);
        } catch (Exception $e) {
            // Rollback the database transaction in case of an exception.
            DB::rollBack();
            // Return an error message in case of an exception.
            return $e->getMessage();
        }
    }
}
