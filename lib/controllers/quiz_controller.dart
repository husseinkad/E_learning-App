import 'dart:async';
import 'package:e_learning/models/quiz_models.dart';
import 'package:e_learning/views/home_screen.dart';
import 'package:e_learning/views/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizController extends GetxController {
  // Question variables
  final List<QuizModels> _questionsList = [
    QuizModels(
      id: 1,
      question: "What is the primary purpose of 'let' in JavaScript?",
      answer: 1, // Corrected to index 1 ('Declare a variable')
      options: [
        'Declare a constant',
        'Declare a variable',
        'Declare a function',
        'Declare an array'
      ],
    ),
    QuizModels(
      id: 2,
      question: "Which operator is used for strict equality in JavaScript?",
      answer: 3, // Corrected to index 3 ('!==')
      options: ['==', '===', '!=', '!=='],
    ),
    QuizModels(
      id: 3,
      question: "How do you write a single-line comment in JavaScript?",
      answer: 0, // Corrected to index 0 ('//')
      options: ['//', '/*', '--', '#'],
    ),
    QuizModels(
      id: 4,
      question: "What does the 'typeof' operator return for an array?",
      answer: 1, // Corrected to index 1 ('Array')
      options: ['Object', 'Array', 'String', 'Undefined'],
    ),
    QuizModels(
      id: 5,
      question:
          "Which function is used to add an element to the end of an array?",
      answer: 1, // Corrected to index 1 ('push()')
      options: ['append()', 'push()', 'addToEnd()', 'insert()'],
    ),
    QuizModels(
      id: 6,
      question: "In JavaScript, what does the acronym 'DOM' stand for?",
      answer: 0, // Corrected to index 0 ('Document Object Model')
      options: [
        'Document Object Model',
        'Data Object Module',
        'Dynamic Object Mani',
        'Digital Output Mode'
      ],
    ),
    QuizModels(
      id: 7,
      question: "What is the purpose of the 'JSON.stringify()' method?",
      answer: 2, // Corrected to index 2 ('Convert to JSON string')
      options: [
        'Parse JSON',
        'Create JSON object',
        'Convert to JSON string',
        'Decode JSON string'
      ],
    ),
    QuizModels(
      id: 8,
      question: "Which keyword is used to declare a function in JavaScript?",
      answer: 1, // Corrected to index 1 ('function')
      options: ['method', 'function', 'declare', 'function()'],
    ),
    QuizModels(
      id: 9,
      question: "How can you check the length of an array named 'myArray'?",
      answer: 3, // Corrected to index 3 ('myArray.length')
      options: [
        'len(myArray)',
        'array.length',
        'myArray.size',
        'myArray.length'
      ],
    ),
    QuizModels(
      id: 10,
      question: "What does the 'NaN' stand for in JavaScript?",
      answer: 0, // Corrected to index 0 ('Not a Number')
      options: [
        'Not a Number',
        'No and Never',
        'Null and None',
        'Numeric and Null'
      ],
    ),
  ];

  // Getters
  List<QuizModels> get questionsList => [..._questionsList];
  bool get isPressed => _isPressed;
  double get numberOfQuestion => _numberOfQuestion;
  int? get selectAnswer => _selectAnswer;
  int get countOfCorrectAnswers => _countOfCorrectAnswers;
  int get countOfQuestion => _questionsList.length;
  RxInt get sec => _sec;

  // State variables
  bool _isPressed = false;
  double _numberOfQuestion = 1;
  int? _selectAnswer;
  int? _correctAnswer;
  int _countOfCorrectAnswers = 0;

  // Map to check if the question has been answered
  final Map<int, bool> _questionIsAnswered = {};

  // Page view controller
  late PageController pageController;

  // Timer
  Timer? _timer;
  final maxSec = 15;
  final RxInt _sec = 15.obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  // Get final score
  double get scoreResult =>
      _countOfCorrectAnswers * 100 / _questionsList.length;

  // Check the selected answer and update state
  void checkAnswer(QuizModels questionModel, int selectAnswer) {
    _isPressed = true;
    _selectAnswer = selectAnswer;
    _correctAnswer = questionModel.answer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswers++;
    }

    stopTimer();
    _questionIsAnswered.update(questionModel.id, (value) => true);

    // Delay before moving to the next question
    Future.delayed(const Duration(milliseconds: 500))
        .then((value) => nextQuestion());

    update();
  }

  // Check if the question has been answered
  bool checkIsQuestionAnswered(int quesId) {
    return _questionIsAnswered[quesId] ?? false;
  }

  // Move to the next question
  void nextQuestion() {
    if (_timer != null && _timer!.isActive) {
      stopTimer();
    }

    if (pageController.page == _questionsList.length - 1) {
      Get.off(ResultScreen());
    } else {
      _isPressed = false;
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );

      startTimer();
    }

    _numberOfQuestion = pageController.page! + 2;
    update();
  }

  // Reset the answers for a new quiz
  void resetAnswer() {
    _questionIsAnswered.clear();
    for (var element in _questionsList) {
      _questionIsAnswered[element.id] = false;
    }
    update();
  }

  // Get the color based on whether the answer is correct or wrong
  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green.shade700;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Colors.red.shade700;
      }
    }
    return Colors.white;
  }

  // Get the icon based on whether the answer is correct or wrong
  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  // Start the timer for each question
  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  // Reset the timer
  void resetTimer() => _sec.value = maxSec;

  // Stop the timer
  void stopTimer() => _timer?.cancel();

  // Start a new quiz
  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswer();
    _selectAnswer = null;
    Get.offAll(const HomeScreen());
  }
}
