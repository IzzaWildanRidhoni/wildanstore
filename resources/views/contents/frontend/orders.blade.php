@extends('layouts.frontend')
@section('content')
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm-9 mx-auto">
                <!--product -->
                <div class="product">
                    <h4 class="mb-4"><b>{{ $title }}</b></h4>
                </div>
                <table class="table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Produk</th>
                            <th>Qty</th>
                            <th>Harga</th>
                            <th>Total Bayar</th>
                            <th>Keterangan</th>
                            <th>Bukti Pembayaran</th>
                            <th>Status</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($orders as $order)
                            <tr>
                                <td>{{ $order->id }}</td>
                                <td>{{ $order->nama_produk }}</td>
                                <td>{{ $order->qty }}</td>
                                <td>{{ 'Rp ' . number_format($order->harga_jual, 0, ',', '.') }}</td>
                                <td>{{ 'Rp ' . number_format($order->total, 0, ',', '.') }}</td>
                                <td>{{ $order->keterangan }}</td>
                                <td><img src="{{ url_images('gambar', $order->bukti_order) }}" class="img-fluid"
                                        style="width:80px;"></td>
                                <td>
                                    @if ($order->status == 'diproses')
                                        <span class="badge bg-warning text-dark">{{ $order->status }}</span>
                                    @elseif($order->status == 'dikirim')
                                        <span class="badge bg-success">{{ $order->status }}</span>
                                    @else
                                        {{ $order->status }}
                                    @endif
                                </td>
                                <td>{{ 'Rp ' . number_format($order->total, 0, ',', '.') }}</td>
                            </tr>
                        @endforeach

                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection
@section('javascript')
@endsection
