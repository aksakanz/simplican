<?php
    include 'conn.php';
    
    $nim= $_POST['nim'];
    $nama= $_POST['nama'];
    $alamat= $_POST['alamat'];
    $password= $_POST['password'];
    $status= $_POST['status'];
    $ipk= $_POST['ipk'];
    $thn_lulus= $_POST['thn_lulus'];
    $prodi= $_POST['prodi'];
    $fakultas= $_POST['fakultas'];
    $pekerjaan= $POST['pekerjaan'];
    $angkatan= $POST['angkatan'];

    $connect->query("INSERT INTO user SET nim='$nim', nama='$nama', alamat='$alamat', password='$password', status='$status', ipk='$ipk', thn_lulus='$thn_lulus', prodi='$prodi', fakultas='$fakultas', pekerjaan='$pekerjaan', angkatan='$angkatan',role='mahasiswa'");
?>