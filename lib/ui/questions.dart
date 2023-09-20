import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatelessWidget {
  final String question;
  final List<String> answers;
  final int correctAnswerIndex;
  final Function(int) onAnswerSelected;

  QuestionScreen({
    required this.question,
    required this.answers,
    required this.correctAnswerIndex,
    required this.onAnswerSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 27, 72, 18),
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              const SizedBox(
                height: 120,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:0.0),
                  child: Text(
                    question,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 90),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: answers.asMap().entries.map((entry) {
                  int index = entry.key;
                  String answer = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                      onPressed: () => onAnswerSelected(index),
                      child: Text(
                        answer,
                        textAlign: TextAlign.center,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 16, 162, 140),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: Size(200, 50),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
