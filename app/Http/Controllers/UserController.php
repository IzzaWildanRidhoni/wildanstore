<?php

namespace App\Http\Controllers;

use App\Models\Kategori;
use App\Models\Orders;
use App\Models\Produk;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    function index()
    {
        // echo "halo";
        return view('contents/frontend/loginuser');
    }

    function profile()
    {
        $data = [
            'title'     => 'Profile',
            'kategori'  => Kategori::All(),
        ];
        return view('contents/frontend/profile', $data);
    }

    function login(Request $request)
    {
        // validasi
        $request->validate([
            'email' => 'required',
            'password' => 'required',
        ], [
            'email.required' => 'email wajib diisi',
            'password.required' => 'password wajib diisi',
        ]);

        $infologin = [
            'email' => $request->email,
            'password' => $request->password
        ];

        if (Auth::attempt($infologin)) {
            if (Auth::user()->role == 'pembeli') {
                return redirect('');
            }
        } else {
            return redirect('masuk')->withErrors('Username dan password yang dimasukkan tidak sesuai');
        }
    }

    function buatakun()
    {
        return view('contents/frontend/buatakun');
    }

    function  prosesdaftarakun(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'phone' => ['required', 'string', 'max:255'],
            'address' => ['required', 'string'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);

        if ($validator->fails()) {
            return redirect()->route('buatakun')
                ->withErrors($validator)
                ->withInput();
        }

        // Check if email already exists
        if (User::where('email', $request->email)->exists()) {
            return redirect()->route('buatakun')
                ->with('error', 'Email already exists. Please choose a different email.');
        }

        // Create new user
        User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'password' => Hash::make($request->password),
        ]);

        // Redirect to login page with success message
        return redirect()->route('masuk')->with('success', 'Registration successful. Please login.');
    }

    function order_produk(Request $request)
    {
        $validator = \Validator::make($request->all(), [
            "qty"   => "required",
            "keterangan"   => "required",
            "bukti_order"        => "required|image|max:1024",
        ]);

        if ($validator->passes()) {
            $image = $request->file('bukti_order');
            $input['imagename'] = 'bukti_' . time() . '.' . $image->getClientOriginalExtension();

            $destinationPath = storage_path('app/public/gambar');
            $image->move($destinationPath, $input['imagename']);

            Orders::insert([
                'id_user'   => Auth::id(),
                'id_produk'   => $request->get("id_produk"),
                'qty'   => $request->get("qty"),
                'keterangan'   => $request->get("keterangan"),
                'bukti_order'   => $input['imagename'],
                'status'   => 'diproses',
                'updated_at'    => date('Y-m-d H:i:s'),
            ]);

            // Mengurangi stok produk
            $produk = Produk::find($request->get("id_produk"));
            $new_stok = $produk->stok - $request->get("qty");
            $produk->update(['stok' => $new_stok]);

            return redirect()->back()->with("success", " Berhasil Insert Data ! ");
        } else {
            return redirect()->back()->withErrors($validator)->with("failed", " Gagal Insert Data ! ");
        }
    }

    public function orders()
    {
        // Mendapatkan id pengguna yang sedang login
        $userId = Auth::id();

        // Mengambil data order yang dimiliki oleh pengguna yang sedang login
        $data_orders = Orders::select('orders.id', 'produk.nama_produk', 'orders.qty', 'orders.keterangan', 'orders.bukti_order', 'orders.status', 'produk.harga_jual')
            ->join('produk', 'orders.id_produk', '=', 'produk.id')
            ->where('orders.id_user', $userId) // Menyaring order berdasarkan id pengguna yang sedang login
            ->get();

        // Menghitung total untuk setiap order
        foreach ($data_orders as $order) {
            $order->total = $order->qty * $order->harga_jual;
        }

        $data = [
            'title'     => 'Order',
            'kategori'  => Kategori::all(),
            'orders'    => $data_orders,
        ];

        return view('contents.frontend.orders', $data);
    }
}
