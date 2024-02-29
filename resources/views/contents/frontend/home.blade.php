@extends('layouts.frontend')
@section('content')
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm-9 mx-auto">
                <div class="official mb-5">
                    <div class="row">
                        <div class="col-sm-7">
                            <div class="official-content">
                                <h4><b>Wildan Store</b></h4>
                                <p>Mulailah perjalanan fashion Anda sekarang dan biarkan kami menjadi mitra setia Anda dalam
                                    menjelajahi dunia style yang tak terbatas.

                                </p>
                            </div>
                        </div>
                        <div class="col-sm-5">
                            <img src="{{ asset('assets/img/hero.jpg') }}" class="img-fluid w-100">
                        </div>
                    </div>
                </div>

                <!--product -->
                <div class="product">
                    <h4 class="mb-4"><b>Terbaru</b></h4>
                    @include('components.frontend.produk_list')
                </div>
                <!-- end product -->

            </div>
        </div>
    </div>
@endsection
@section('javascript')
@endsection
