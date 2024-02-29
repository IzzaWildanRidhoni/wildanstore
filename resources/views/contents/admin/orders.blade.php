@extends('layouts.app')
@section('content')
    <div class="container">
        <!-- Button trigger modal -->
        {{ alertbs_form($errors) }}
        <div class="card card-rounded mt-2">
            <div class="card-header bg-primary text-white">
                <h5 class="card-title pt-2"> <i class="fas fa-database me-1"></i> Data Pesanan</h5>
            </div>
            <div class="card-body">
                <div class="table-responsive mt-1">
                    <table class="table table-striped table-bordered">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nama User</th> <!-- Add this line for user's name -->
                                <th>Produk</th>
                                <th>Qty</th>
                                <th>Harga</th>
                                <th>Total Bayar</th>
                                <th>Keterangan</th>
                                <th>Bukti Pembayaran</th>
                                <th>Status</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($orders as $order)
                                <tr>
                                    <td>{{ $order->id }}</td>
                                    <td>{{ $order->nama_user }}</td> <!-- Display user's name -->
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
                                    <td>
                                        <form method="post" action="{{ route('orders.update') }}">
                                            @csrf
                                            <input type="hidden" name="id" value="{{ $order->id }}">
                                            @if ($order->status == 'dikirim')
                                                <button type="submit" class="btn btn-success" disabled>Sudah
                                                    Dikirim</button>
                                            @else
                                                <button type="submit" class="btn btn-primary">Kirim</button>
                                            @endif
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                            @if (count($orders) == 0)
                                <tr>
                                    <td colspan="10">Tidak Ada Data</td>
                                </tr>
                            @endif
                        </tbody>
                    </table>
                </div>
                <br>
            </div>
        </div>
    </div>
@endsection
@section('javascript')
@endsection
