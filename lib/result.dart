import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    if (resultScore == 50) {
      resultText = 'WOW! You nailed it! ';
      //print(resultScore);
    } else if (resultScore >= 41) {
      resultText = 'You are awesome!';
      //print(resultScore);
    } else if (resultScore >= 31) {
      resultText = 'Pretty likeable!';
      //print(resultScore);
    } else if (resultScore >= 21) {
      resultText = 'You need to work more!';
    } else if (resultScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      //print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            'Score: ' '$resultScore/50',
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            onPressed: () => resetHandler(),
            child: Container(
              color: const Color.fromARGB(255, 238, 238, 238),
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Color.fromARGB(255, 36, 180, 228)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
