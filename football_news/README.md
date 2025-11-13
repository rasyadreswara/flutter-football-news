Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget :
Widget tree adalah struktur hierarki semua widget di layar. Setiap widget punya parent (induk) dan bisa punya child (anak).
Alur dasarnya saat layout:
1. Parent mengirim constraints ke child (batas ukuran).
2. Child mengembalikan size yang dipilih sesuai constraints.
3. Parent memposisikan child di dalam dirinya.
Relasi parent–child inilah yang menentukan tampilan, ukuran, dan posisi elemen UI (mis. Column berperan sebagai parent bagi tombol-tombolnya).

Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya :
MaterialApp: Pembungkus aplikasi Material; sediakan tema, navigasi, localizations, dan ScaffoldMessenger default.

StatelessWidget (FootballShopApp, MenuPage, _MenuButton): Widget tanpa state internal; dibangun ulang saat ada perubahan dari atas (parent) atau dependensi Inherited.

Scaffold: Kerangka halaman Material standar (app bar, body, snackbar, dll.).

AppBar: Bilah aplikasi di atas untuk judul & action.

Text: Menampilkan teks (“Football Shop”, label tombol, isi snackbar).

Padding: Memberi jarak tepi di sekitar child.

Column: Menyusun children secara vertikal.

SizedBox: Mengatur ukuran tetap/ruang antar elemen (tinggi tombol & spacer 12 px).

ElevatedButton.icon: Tombol Material dengan ikon + teks. (Variasi dari ElevatedButton.)

Icon: Menampilkan ikon Material (list, inventory, add).

SnackBar: Komponen umpan balik singkat di bawah layar (dipicu oleh ScaffoldMessenger).

ScaffoldMessenger (disediakan otomatis oleh MaterialApp): Pengelola SnackBar/MaterialBanner di atas seluruh halaman.

Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root :
Fungsi :
1. Menyediakan Material design defaults (tema, font, motion).
2. Menyiapkan navigator dan route management.
3. Menyediakan localizations dan text direction.
Karena ia menyatukan tema, navigasi, dan infrastruktur Material, MaterialApp hampir selalu dipakai sebagai root aplikasi Material agar seluruh subtree mendapat konteks & resource yang konsisten.

Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya? :
StatelessWidget saat :
1. Tidak punya state internal yang berubah seiring waktu.
2. Cocok untuk UI statis atau seluruh datanya berasal dari parent.
Contoh di proyek ini: semua layar & tombol (kita hanya memicu snackbar, tidak menyimpan state).

StatefulWidget saaat :
1. Memiliki objek State terpisah, bisa memanggil setState untuk rebuild berdasarkan perubahan.
2. Pakai saat ada data dinamis: form input, animasi manual, counter, stream, async data (loading/success/error), dsb

Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build? :
BuildContext adalah handle ke posisi widget di widget tree. Dengan context, widget:

Menemukan ancestor/inherited widgets (mis. Theme.of(context), ScaffoldMessenger.of(context), Navigator.of(context)).

Mendapat lokalisasi dan arah teks.

Memicu navigasi, snackbar, dialog, dsb.

Di build(BuildContext context), kita pakai context untuk:

Mengakses tema/media query (jika perlu).

Memanggil ScaffoldMessenger.of(context) untuk menampilkan SnackBar (seperti di proyek ini).

Memanggil Navigator.of(context).push(...) (kalau nanti menambah halaman).

Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart" :
Hot reload :
1. Menyuntikkan code changes ke Dart VM lalu rebuild widget tree.
2. State StatefulWidget tetap dipertahankan.
3. Cepat untuk ubah tampilan, layout, teks, atau logic build.
4. Tidak selalu menerapkan perubahan yang terjadi di initState atau perubahan struktur besar tertentu.

Hot restart :
1. Menjalankan ulang main() dan menghapus semua state di memori.
2. Aplikasi kembali ke kondisi awal, tapi tidak “cold boot” penuh (engine tetap).
Gunakan ketika perubahan tidak ter-reflect oleh hot reload 

TUGAS 8
Perbedaan utama antara `Navigator.push()` dan `Navigator.pushReplacement()` ada pada cara keduanya memperlakukan navigation stack. `Navigator.push()` menambahkan halaman baru di atas halaman sebelumnya sehingga halaman lama tetap berada di dalam stack dan pengguna masih dapat kembali menggunakan tombol back. Ini cocok digunakan di aplikasi Football Shop ketika saya berpindah dari halaman menu utama ke halaman seperti “Daftar Produk” atau “Tambah Produk”, karena memang diharapkan pengguna bisa kembali ke menu utama dengan mudah. Sebaliknya, `Navigator.pushReplacement()` akan mengganti halaman saat ini dengan halaman baru dan menghapus halaman lama dari stack, sehingga tombol back tidak akan mengembalikan pengguna ke halaman sebelumnya. Dalam Football Shop, pola ini lebih tepat dipakai misalnya setelah login berhasil menuju halaman menu utama agar pengguna tidak kembali lagi ke halaman login, atau setelah form “Tambah Produk” berhasil disubmit dan pengguna diarahkan ke “Daftar Produk” tanpa risiko kembali ke form lama yang sudah diisi.

Dalam konteks desain antarmuka, penggunaan layout widget seperti `Padding`, `SingleChildScrollView`, dan `ListView` sangat membantu saat menampilkan elemen-elemen form agar tampilan lebih rapi dan responsif. `Padding` saya gunakan untuk memberi jarak di sekeliling `TextFormField` dan tombol sehingga form tidak menempel ke tepi layar dan lebih nyaman dilihat, misalnya dengan menerapkan padding di seluruh body halaman form “Tambah Produk”. `SingleChildScrollView` saya manfaatkan untuk membungkus konten form yang tinggi, sehingga ketika keyboard muncul atau layar perangkat kecil, form tetap bisa digulir dan tidak menimbulkan error overflow di bagian bawah; ini penting ketika jumlah field cukup banyak seperti nama produk, harga, deskripsi, stok, dan lain-lain. Sementara itu, `ListView` berguna ketika elemen form atau daftar widget cukup panjang dan perlu scrolling yang efisien, misalnya pada halaman yang menampilkan daftar produk atau ketika form dipecah menjadi banyak bagian. Kombinasi `Padding` + `SingleChildScrollView` atau `Padding` + `ListView` membuat form di Football Shop terasa lebih terstruktur, tidak sesak, dan tetap dapat digunakan dengan nyaman di berbagai ukuran layar.

