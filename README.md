# bootcamp

Project ini menggunakan provider sebagai state management. Semua provider yang ada dideklarasikan terlebih dahulu di dalam widget MultiProvider yang terdapat pada file main.dart. Untuk pemanggilan API terdapat pada folder services yang kemudian baru akan dipanggil oleh provider.

## All posts
- Fungsi getPosts pada PostService akan dipanggil di dalam fungsi getPosts dari PostProvider dengan await.
- Setelah fungsi getPosts pada PostService selesai dieksekusi, masukkan hasil dari getPosts ke dalam variabel posts.
- Panggil notifyListener untuk memperbarui tampilan layar.
- Dengan menggunakan Consumer<PostProvider>, ambil variabel posts di dalam PostScreen.
- Masukkan variabel posts pada ListView.
![all_posts](https://user-images.githubusercontent.com/48285366/156373021-33916807-a789-4e05-acc5-2306b923d740.png)

## Search post
- Fungsi getPost dengan parameter id pada PostService akan dipanggil di dalam fungsi getPost dari PostProvider dengan await.
- Setelah fungsi getPost dengan parameter id pada PostService selesai dieksekusi, masukkan hasil dari getPost dengan id ke dalam variabel posts.
- Panggil notifyListener untuk memperbarui tampilan layar.
- Setiap kali inputan TextField berubah, akan memanggil fungsi getPost dari PostProvider sesuai dengan id yang dimasukkan.
- Dengan menggunakan Consumer<PostProvider>, ambil variabel posts di dalam PostScreen.
- Masukkan variabel posts pada ListView.
![search_post](https://user-images.githubusercontent.com/48285366/156373040-d217fdc6-22fb-4cd4-9ac5-a0eb26cd0280.png)
