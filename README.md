# bootcamp

Project ini menggunakan provider sebagai state management. Semua provider yang ada dideklarasikan terlebih dahulu di dalam widget MultiProvider yang terdapat pada file main.dart. Untuk pemanggilan API terdapat pada folder services yang kemudian baru akan dipanggil oleh provider.

## All posts
- Fungsi getPosts pada PostService akan dipanggil di dalam fungsi getPosts dari PostProvider dengan await.
- Setelah fungsi getPosts pada PostService selesai dieksekusi, masukkan hasil dari getPosts ke dalam variabel posts.
- Panggil notifyListener untuk memperbarui tampilan layar.
- Dengan menggunakan Consumer<PostProvider>, ambil variabel posts di dalam PostScreen.
- Masukkan variabel posts pada ListView.
![All posts](all_posts.jpg?raw=true "Title")

## Search post
- Fungsi getPost dengan parameter id pada PostService akan dipanggil di dalam fungsi getPost dari PostProvider dengan await.
- Setelah fungsi getPost dengan parameter id pada PostService selesai dieksekusi, masukkan hasil dari getPost dengan id ke dalam variabel posts.
- Panggil notifyListener untuk memperbarui tampilan layar.
- Setiap kali inputan TextField berubah, akan memanggil fungsi getPost dari PostProvider sesuai dengan id yang dimasukkan.
- Dengan menggunakan Consumer<PostProvider>, ambil variabel posts di dalam PostScreen.
- Masukkan variabel posts pada ListView.
![Search posts](search_posts.jpg?raw=true "Title")
