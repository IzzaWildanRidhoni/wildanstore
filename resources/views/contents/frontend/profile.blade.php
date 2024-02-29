@extends('layouts.frontend')
@section('content')
    <div class="container mt-5">
        <div class="card bg-primary text-white card-rounded">
            <div class="card-body text-center pt-4">
                <h4 class="card-title">
                    <b><i class="fas fa-check me-1"></i></b>
                    Selamat Datang <b>{{ auth()->user()->name }}</b>
                </h4>
                <a href="{{ route('logout') }}" target="_blank" class="btn btn-success btn-lg mt-2"
                    onclick="event.preventDefault();
                                        document.getElementById('logout-form').submit();">
                    <i class="fas fa-sign-out "></i> Logout
                </a>


                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                    @csrf
                </form>
            </div>
        </div>
    </div>
@endsection
@section('javascript')
@endsection
