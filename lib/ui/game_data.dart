import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:forex_trading/ui/questions.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  void initState() {
    super.initState();
  }

  List<Map<String, dynamic>> questionsAndAnswers = [
    {
      "question":
          "What financial statement lists assets from current to long term?",
      "answers": [
        "A. Balance Sheet",
        "B. Income Statement",
        "C. Cash Flow Statement",
        "D. Statement of Retained earnings",
      ],
      "correctAnswerIndex": 0,
      "explanation":
          "The balance sheet is a financial statement that lists assets from current to long term...",
    },
    {
      "question": "What balance sheet format is vertical?",
      "answers": [
        "A. Standard",
        "B. Report",
        "C. Account",
        "D. Inverted",
      ],
      "correctAnswerIndex": 1,
      "explanation":
          "The correct answer is 'Report'. A vertical balance sheet format is a type of financial statement...",
    },
    {
      "question":
          "Income statement format that separates the cost of goods sold into categories?",
      "answers": [
        "A. Standard",
        "B. Detailed",
        "C. Expanded",
        "D. Multi-Step",
      ],
      "correctAnswerIndex": 3,
      "explanation":
          "The multi-step income statement format separates the cost of goods sold into categories...",
    },
    {
      "question":
          "Which is not a cash activity listed on the cash flow statement?",
      "answers": [
        "A. Operating activities",
        "B. Investing activities",
        "C. Purchasing activities",
        "D. Financing activities",
      ],
      "correctAnswerIndex": 2,
      "explanation":
          "Purchasing activities is not a cash activity listed on the cash flow statement...",
    },
    {
      "question":
          "Earnings per share show investors the __________ earned per outstanding share of stock.",
      "answers": [
        "A. Operating Income",
        "B. Income before taxes",
        "C. Net Income",
        "D. Income before interest and taxes",
      ],
      "correctAnswerIndex": 2,
      "explanation":
          "Earnings per share is a financial metric that indicates the amount of profit...",
    },
    {
      "question":
          "After a business transaction has occurred, journal entries are recorded in the:",
      "answers": [
        "A. General Ledger",
        "B. General Journal",
        "C. Expense Accounts",
        "D. Balance Sheets",
      ],
      "correctAnswerIndex": 1,
      "explanation":
          "After a business transaction has occurred, journal entries are recorded in the General Journal...",
    },
    {
      "question":
          "Which trial balance lists all the business accounts before year-end adjusting journal entries are made.",
      "answers": [
        "A. Adjusted Trial Balance",
        "B. Unadjusted Trial Balance",
        "C. Post Closing Trial Balance",
        "D. Pre Closing Trial Balance",
      ],
      "correctAnswerIndex": 1,
      "explanation":
          "The unadjusted trial balance lists all the business accounts before year-end adjusting journal entries are made...",
    },
    {
      "question":
          "Entries that are made at the end of a period to correct accounts before financial statements are prepared.",
      "answers": [
        "A. Closing entries",
        "B. Adjusting entries",
        "C. Reversing entries",
        "D. Journal entries",
      ],
      "correctAnswerIndex": 1,
      "explanation":
          "Adjusting entries are made at the end of a period to correct accounts before financial statements are prepared...",
    },
    {
      "question":
          "The assumption that states that businesses can divide up their activities into artificial time periods.",
      "answers": [
        "A. Business entity concept",
        "B. Going concern concept",
        "C. Monetary unit assumption",
        "D. Periodicity assumption",
      ],
      "correctAnswerIndex": 3,
      "explanation":
          "The periodicity assumption states that businesses can divide up their activities into artificial time periods...",
    },
    {
      "question":
          "Which of these is not included as a separate item in the basic accounting equation?",
      "answers": [
        "A. Assets",
        "B. Revenue",
        "C. Liabilities",
        "D. Stockholder's equity",
      ],
      "correctAnswerIndex": 1,
      "explanation":
          "Revenue is not included as a separate item in the basic accounting equation...",
    },
  ];

  List<String> namings = [
    "Financial",
    "Investments",
    "Job ",
    "Crypto",
    "Real Estate",
    "Stocks"
  ];

  Random random = Random();

  int currentPlayer = 0;
  List<Map<int, int>> tappedContainers = [];

  void _handleTap(int row, int column) {
    setState(() {
      int index = row * 2 + column;
      if (tappedContainers.any((container) => container.containsKey(index))) {
        tappedContainers
            .removeWhere((container) => container.containsKey(index));
      } else {
        int randomQuestionIndex = random.nextInt(questionsAndAnswers.length);
        tappedContainers.add({index: randomQuestionIndex});
        _showQuestionDialog(
          questionsAndAnswers[randomQuestionIndex]["question"],
          List<String>.from(
              questionsAndAnswers[randomQuestionIndex]["answers"]),
          questionsAndAnswers[randomQuestionIndex]["correctAnswerIndex"],
        );
        currentPlayer = currentPlayer == 1 ? 2 : 1;
      }
    });
  }

  void _showQuestionDialog(
      String question, List<String> answers, int correctAnswerIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionScreen(
          question: question,
          answers: answers,
          correctAnswerIndex: correctAnswerIndex,
          onAnswerSelected: (index) async {
            if (index == correctAnswerIndex) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    'Correct',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: const Color.fromARGB(255, 14, 153, 4),
                  duration: const Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CupertinoAlertDialog(
                    title: const Text('Incorrect'),
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Explanation:'),
                          SingleChildScrollView(
                            child: Text(
                              questionsAndAnswers[index]['explanation'],
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      CupertinoDialogAction(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 27, 72, 18),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContainer(0, 0),
                  const SizedBox(
                    width: 50.0,
                  ),
                  _buildContainer(0, 1),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContainer(1, 0),
                  const SizedBox(
                    width: 50.0,
                  ),
                  _buildContainer(1, 1),
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildContainer(2, 0),
                  const SizedBox(
                    width: 50.0,
                  ),
                  _buildContainer(2, 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(int row, int column) {
    int index = row * 2 + column;
    bool isTapped = tappedContainers.contains(index);
    return GestureDetector(
      onTap: isTapped ? null : () => _handleTap(row, column),
      child: Container(
        width: 150,
        height: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: const Color.fromARGB(255, 248, 248, 248),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          isTapped ? 'Opened' : namings[index],
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

extension IterableMapIndexed on Iterable<dynamic> {
  Iterable<R> mapIndexed<R>(R Function(int index, dynamic e) f) {
    var index = 0;
    return map((e) => f(index++, e));
  }
}
