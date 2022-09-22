class Question {
  String question;
  Map<String, String> options;
  String answer;

  Question({
    required this.question,
    required this.options,
    required this.answer,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          runtimeType == other.runtimeType &&
          question == other.question &&
          options == other.options &&
          answer == other.answer);

  @override
  int get hashCode => question.hashCode ^ options.hashCode ^ answer.hashCode;

  @override
  String toString() {
    return 'Question{question: $question, options: $options, answer: $answer,}';
  }

  Question copyWith({
    String? question,
    Map<String, String>? options,
    String? answer,
  }) {
    return Question(
      question: question ?? this.question,
      options: options ?? this.options,
      answer: answer ?? this.answer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'question': question,
      'options': options,
      'answer': answer,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map) {
    return Question(
      question: map['Question'] as String,
      options: {
        'a': map['a'],
        'b': map['b'],
        'c': map['c'],
        'd': map['d'],
      },
      answer: map['correct'] as String,
    );
  }
}
