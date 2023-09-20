import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:forex_trading/models/news_model.dart';

class NewsDetailsPage extends StatelessWidget {
  final NewsMList news;
  const NewsDetailsPage({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 72, 18),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 27, 72, 18),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              child: Image.network(news.imageUrl),
            ),
            const SizedBox(height: 16),
            Text(
              news.title,
              style: GoogleFonts.dmSans(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              news.description,
              style: GoogleFonts.dmSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
