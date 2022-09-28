<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class NotesController extends Controller
{
    // aktualizuje dane o użytkowniku
    public function updateUsers(Request $users)
{
    $users->validate([
        'name' => 'required',
        'login' => 'required',
        'email' => 'required',
        'password' => 'required'
    ]);

    $query = DB::table('users')->where('id', $users->id)->update([
        'name'=>$users->input('name'),
        'login'=>$users->input('login'),
        'email'=>$users->input('email'),
        'password'=>$users->input(Hash::make('password'))
    ]);

    if($query){
        return back()->with('success', 'Data have been updated');
    }else{
        return back()->with('error', 'We couldn t update user:');
    }
}

// dodanie nowego użytkownika
public function storeUsers($users)
{
    $users->validate([
        'name' => 'required',
        'login' => 'required',
        'email' => 'required',
        'password' => 'required'
    ]);

    $query = DB::table('users')->where('id', $users->id)->update([
        'name'=>$users->input('name'),
        'login'=>$users->input('login'),
        'email'=>$users->input('email'),
        'password'=>$users->input(Hash::make('password'))
    ]);

    if($query){
        $this->sendEmail($users);
        return back()->with('success', 'All users created.');
    }else{
        return back()->with('error', 'We couldn t create users:');
    }
    $this->sendEmail($users);
}

// wysyłanie wiadomości potwierdzającej do użytkownika po udanym założeniu konta
private function sendEmail($users)
{
    $details = [
        'title'  => 'New account created',
        'body' => 'Account has beed created. You can log in as <b>' . $users->login . '</b>'
    ];

    Mail::to($users->email)->cc('support@company.com')->send(new($details));
}
}
