section .data
    dividend dd 10         ; angka yang akan dibagi
    divisor dd 2          ; angka yang akan menjadi pembagi

section .text
    global _start

_start:
    ; inisialisasi register
    mov eax, [dividend]   ; muat isi variabel dividend ke dalam register eax
    mov ebx, [divisor]    ; muat isi variabel divisor ke dalam register ebx

    ; cek apakah divisor adalah 0
    cmp ebx, 0
    je division_by_zero_error ; jika divisor adalah 0, lompat ke label division_by_zero_error

    ; bagikan eax oleh ebx
    div ebx               ; hasil pembagian akan disimpan di eax, sementara sisa pembagian di edx

    ; hasil pembagian sekarang ada di eax
    ; sisa pembagian sekarang ada di edx

    ; tambahkan kode di sini untuk menggunakan hasil pembagian dan sisa pembagian
    ; ...

    ; exit program
    mov eax, 1            ; sistem panggilan exit (sys_exit)
    xor ebx, ebx          ; exit code 0
    int 0x80              ; panggil kernel

division_by_zero_error:
    ; tambahkan kode di sini untuk menangani kesalahan pembagian oleh 0
    ; ...

    ; exit program dengan kode kesalahan
    mov eax, 1            ; sistem panggilan exit (sys_exit)
    mov ebx, 1            ; exit code 1 (kesalahan)
    int 0x80              ; panggil kernel