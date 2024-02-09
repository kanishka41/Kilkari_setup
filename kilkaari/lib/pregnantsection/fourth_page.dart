import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Articles'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10, 
        itemBuilder: (context, index) {
          return ArticleCard(
            title: 'Article $index',
            imageUrl:
                'https://via.placeholder.com/150',
            onTapReadMore: () {
              // Implement navigation to the full article page
            },
            onSave: () {
              // Implement save functionality
            },
          );
        },
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onTapReadMore;
  final VoidCallback onSave;

  const ArticleCard({
    required this.title,
    required this.imageUrl,
    required this.onTapReadMore,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imageUrl,
              height: 170,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: onTapReadMore,
                      child: Text('Read More'),
                    ),
                    IconButton(
                      icon: Icon(Icons.bookmark_border),
                      onPressed: onSave,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
