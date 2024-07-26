import 'package:flutter/material.dart';
import 'package:perpus1/models/book.dart';

class BookDetailPage extends StatefulWidget {
  final Book book;

  BookDetailPage({required this.book});

  @override
  _BookDetailPageState createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final List<Map<String, dynamic>> _reviews = [];
  final TextEditingController _reviewController = TextEditingController();
  double _rating = 4.5; // Nilai awal rating
  bool _isFavorite = false; // Favorite status

  void _addReview() {
    if (_reviewController.text.isNotEmpty) {
      setState(() {
        _reviews.add({
          'review': _reviewController.text,
          'rating': _rating,
        });
        _reviewController.clear();
      });
    }
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
        backgroundColor: Color(0xff526D82),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white), // Set the back button color to white
      ),
      backgroundColor: Color(0xff27374D),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/images/1.png',
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: _toggleFavorite,
                ),
                SizedBox(width: 8.0),
                Text(
                  _isFavorite ? 'Favorited' : 'Mark as Favorite',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              widget.book.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              'by ${widget.book.author}',
              style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Text(
              'Description or other details about the book can go here.',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(height: 16.0),
            Divider(color: Colors.white),
            SizedBox(height: 16.0),
            // Rating section
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_half, color: Colors.yellow),
                SizedBox(width: 8.0),
                Text(
                  '4.5',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            // Review section
            Text(
              'Reviews',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: _reviews.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(
                          5,
                          (starIndex) => Icon(
                            starIndex < _reviews[index]['rating']
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.yellow,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        _reviews[index]['review'],
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _reviewController,
              decoration: InputDecoration(
                labelText: 'Add a review',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  'Rating: ',
                  style: TextStyle(color: Colors.white),
                ),
                DropdownButton<double>(
                  value: _rating,
                  dropdownColor: Color(0xff27374D),
                  onChanged: (newRating) {
                    setState(() {
                      _rating = newRating!;
                    });
                  },
                  items: [1.0, 2.0, 3.0, 4.0, 4.5, 5.0] // Menambahkan 4.5 ke daftar
                      .map<DropdownMenuItem<double>>(
                          (rating) => DropdownMenuItem<double>(
                                value: rating,
                                child: Text(
                                  rating.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                      .toList(),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _addReview,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
