// lib/data/dummy_recommended.dart
import 'package:perpus1/models/book.dart';

final List<Book> recommendedBooks = [
  Book(
    title: 'Sherelock Holmes',
    author: 'F. Scott Fitzgerald',
    coverAsset: '1.jpg', 
    category: 'Comedy'// Ganti dengan nama file gambar dari aset lokal
  ),
  Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    coverAsset: '2.jpg',
    category: 'Romance' // Ganti dengan nama file gambar dari aset lokal
  ),
  Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    coverAsset: '3.jpg',
    category: 'Horor' // Ganti dengan nama file gambar dari aset lokal
  ),
  Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    coverAsset: '4.jpg', 
    category: 'Action'// Ganti dengan nama file gambar dari aset lokal
  ),
  // Tambahkan buku yang direkomendasikan lainnya di sini
];
