@extends('layouts.frontend')
@section('content')
    <div class="container mt-5">
        <div class="row">
            <div class="col-sm-9 mx-auto">
                <!--product -->
                <div class="product">
                    <h4 class="mb-4"><b>{{ $title }}</b></h4>
                    <div class="row">
                        <div class="col-sm-4">
                            <img src="{{ url_images('gambar', $edit->gambar) }}" class="img-fluid w-100 mb-3">
                        </div>
                        <div class="col-sm-8 detail-produk">
                            <div class="row mt-3">
                                <div class="col-sm-4"><b>Kategori</b></div>
                                <div class="col-sm-8">
                                    <a class="text-produk" href="{{ url('kategori/' . $edit->id) }}">
                                        {{ $edit->nama_kategori }}
                                    </a>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4"><b>Nama Produk</b></div>
                                <div class="col-sm-8"><?= $edit->nama_produk ?></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4"><b>Harga jual</b></div>
                                <div class="col-sm-8 text-success">
                                    <h4><b>Rp<?= number_format($edit->harga_jual) ?>,-</b></h4>
                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4"><b>Deskripsi</b></div>
                                <div class="col-sm-8"><?= $edit->deskripsi ?></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4"><b>Stok</b></div>
                                <div class="col-sm-8"><?= $edit->stok ?></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-sm-4"><b></b></div>
                                <div class="col-sm-8">
                                    @if (Auth::check() && Auth::user()->role == 'pembeli')
                                        <button type="button" class="btn btn-primary btn-md" data-bs-toggle="modal"
                                            data-bs-target="#modelIdPlus">Order Now</button>
                                    @else
                                        <button type="button" class="btn btn-primary btn-md" onclick="orderNow()">Order
                                            Now</button>
                                    @endif

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modelIdPlus" data-bs-backdrop="static" tabindex="-1" role="dialog"
        aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"> Order Produk</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form method="post" action="{{ route('order_produk') }}" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <input type="hidden" name="id_produk" value="{{ $edit->id }}">
                        <div class="form-group mt-3">
                            <label for="">Jumlah</label>
                            <input type="number" class="form-control @error('qty') is-invalid @enderror" required
                                value="{{ old('qty') }}" name="qty" id="qty" placeholder="">
                            @error('qty')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="form-group mt-3">
                            <label for="">Keterangan</label>
                            <textarea class="form-control @error('keterangan') is-invalid @enderror" rows="5" required name="keterangan"
                                id="keterangan" placeholder="">{{ old('keterangan') }}</textarea>
                            @error('keterangan')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="form-group mt-3">
                            <label for="">Bukti Order</label>
                            <input type="file" class="form-control @error('bukti_order') is-invalid @enderror" required
                                value="{{ old('bukti_order') }}" name="bukti_order" id="bukti_order" placeholder="">
                            @error('bukti_order')
                                <span class="text-danger">{{ $message }}</span>
                            @enderror
                        </div>
                        <div class="form-group mt-3 text-center">
                            <h5> Total Bayar : Rp.<b class="text-primary" id="total"> 0</b></h5>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Order</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@section('javascript')
    <script>
        function orderNow() {
            Swal.fire({
                title: "Login Terlebih Dahulu Sebagai Pembeli!",
                icon: "error", // Menentukan ikon gagal
                customClass: {
                    confirmButton: "btn btn-primary" // Menentukan kelas untuk tombol konfirmasi
                }
            });
        }

        // Mendapatkan elemen input qty
        const qtyInput = document.getElementById('qty');

        // Mendengarkan setiap perubahan pada input qty
        qtyInput.addEventListener('input', function() {
            // Mengambil nilai qty
            const qtyValue = parseFloat(qtyInput.value);

            // Mengambil harga jual dari PHP
            const hargaJual = {{ $edit->harga_jual }};

            // Menghitung total
            const total = qtyValue * hargaJual;

            // Format total sebagai mata uang Rupiah
            const formattedTotal = new Intl.NumberFormat('id-ID', {
                style: 'currency',
                currency: 'IDR'
            }).format(total);

            // Menampilkan total pada elemen h2 dengan id "total"
            document.getElementById('total').textContent = formattedTotal;
        });
    </script>
@endsection
