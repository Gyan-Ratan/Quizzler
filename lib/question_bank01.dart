import 'package:quiz_app/questions.dart';

class QuestionBank1 {
  int _questionNumber = 0;
  // _ before the text make the class private
  List<Question> _quest = [
    Question(q: 'You can lead a cow down stairs but not up stairs.', a: false),
    Question(
        q: 'Approximately one quarter of human bones are in the feet.',
        a: true),
    Question(q: 'A slug\'s blood is green.', a: true),
    Question(q: 'We are Humans', a: false),
    Question(q: 'Matrix is Real', a: true),
    Question(q: 'THis is Piece of Shit', a: false),
  ];
  void nextQuestion() {
    if (_questionNumber < _quest.length - 1) {
      _questionNumber++;
    }
  }

  // /Encapsulation
//creating a method to serve the question
  String getQuestionText() {
    return _quest[_questionNumber].questionText;
  }

//   Method to get Answers
  bool getAnswer() {
    return _quest[_questionNumber].questionAnswers;
  }

//  Method to give the number of Questions
  int getTotalQuestion() {
    int a = _quest.length;
    return a;
  }

  bool isFinished() {
    if (_questionNumber >= _quest.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
