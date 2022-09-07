# Routh-Stability-Criterion

```function routh(pol)```


Program ini dapat menampilkan polinomial, stabilitas dari polnomial tersebut, dan routh table. Untuk menampilkan polinomial menggunakan fungsi berikut.

    %% Show Polynomial
    poly2sym(pol)


Untuk menghitung stabilitas routh, pertama-tama identifikasi orde lalu buat tabel routh dengan ukuran yg sesuai.

    order = length(pol);
    cols = floor((order+1)/2);
    Table = zeros(order, cols);


Kemudia input setiap bagian dari tabel routh menggunakan perulangan.

    for row = 1:order
        for col = 1:cols


Masukkan polinomial pada bari pertama dan kedua tabel routh.

            if row < 3
                r = col;
                c = row;
                Table(r,c) = pol(i);
                i = i + 1;


Kemudian hitung komponen-komponen lainnya.

            else
                if col ~= cols
                    r = row;
                    c = col;
                    Table(r, c) = (Table(row-1,1) * Table(row-2,col+1) - Table(row-2,1) * Table(row-1,col+1)) / Table(row-1,1);
                end

Kemudian cek stabilitas dengan mengidentifikasi apakah kolom pertama pada tabel terdapat nilai negatif, jika iya maka sistem tersebut tidak stabil.

            if Table(r, 1) < 0
                stable = false;
            end


    %% Check the stablity
    if stable
        fprintf('The system is UNSTABLE.\n\n');
    else
        fprintf('The system is STABLE.\n\n');
    end

