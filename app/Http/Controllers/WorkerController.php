<?php

namespace App\Http\Controllers;

use App\Http\Requests\WorkerLoginRequest;
use App\Http\Requests\WorkerRegisterRequest;
use App\Models\Worker;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Requests\WorkerStoreRequest;
use App\Services\WorkerService\WorkerAuthService\WorkerLoginService;
use App\Services\WorkerService\WorkerAuthService\WorkerRegisterService;

class WorkerController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:worker', ['except' => ['login', 'register', 'verify', 'forgotPassword']]);
    }

    public function register(WorkerRegisterRequest $request)
    {
        return (new WorkerRegisterService())->register($request);
    }

    function verify($token)
    {
        $worker = Worker::whereVerificationToken($token)->first();

        if (!$worker) {
            return response()->json([
                "message" => "this token is invalid"
            ]);
        }
        $worker->verification_token = null;
        $worker->verified_at = now();
        $worker->save();
        return response()->json([
            "message" => "your account has been verified"
        ]);
    }

    public function login(WorkerLoginRequest $request)
    {
        return (new WorkerLoginService())->login($request);
    }

    public function logout()
    {
        // ليه حددنا هنا الجارد ومحددناهوش فى الادمن قلك ععشان الادمن مخليته الافتراضى
        auth()->guard('worker')->logout();
        return response()->json(['message' => 'User successfully logout ']);
    }

    public function refresh()
    {
        return $this->createNewToken(Auth::refresh());
    }

    protected function createNewToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => Auth::factory()->getTTL() * 60,
            // هنا حددنا الحارس وركر لانه الافتراضى  الحارس  ادمن فلو محددناش هيرجع الحارس الافتراضى اللى هو ادمن
            'user' => auth()->guard('worker')->user()
        ]);
    }
}

    // other way to write a code

    // public function login(Request $request)
    //  {
        //     $validator = Validator::make($request->all(), [
        //         'email' => 'required|email',
        //         'password' => 'required|string|min:6',
        //     ]);
        //     if ($validator->fails()) {
        //         return response()->json($validator->errors(), 422);
        //     }
        //     if (!$token = auth()->guard('worker')->attempt($validator->validated())) {
        //         return response()->json(['error' => 'Unauthorized'], 401);
        //     }
        //     return $this->createNewToken($token);
    // }

    // public function register(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'name' => 'required|string|between:2,100',
    //         'email' => 'required|string|email|max:100|unique:workers',
    //         'password' => 'required|string|min:6',
    //         'phone' => 'required|string|max:17',
    //         'photo' => 'required|image|mimes:jpeg,png,jpg,gif,svg',
    //         'location' => 'required|string|max:100',
    //     ]);

    //     if ($validator->fails()) {
    //         return response()->json($validator->errors(), 400);
    //     }

    //     $worker = Worker::create(array_merge(
    //         $validator->validated(),
    //         [
    //             'password' => bcrypt($request->password),

    //             // go to filesystem.php and change the 'root' => storage_path()
    //             // to 'root' => public_path() in the public disck, and then
    //             // go to .env file and change FILESYSTEM_DISK=local to FILESYSTEM_DISK=public
    //             'photo' => $request->file('photo')->store('worker'),

    //             // OR anther way to do it
    //             // go to filesystem.php and change the 'root' => storage_path()
    //             // to 'root' => public_path() in the public disck,
    //             // 'photo' => $request->file('photo')->store('worker', 'public'),
    //         ]
    //     ));

    //     return response()->json(['message' => 'User successfully registered', 'user' => $worker], 201);
    // }
