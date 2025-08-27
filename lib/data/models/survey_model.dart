class SurveyModel {
  final int id;
  final String question;
  int? score;
  String? comment;

  SurveyModel({
    required this.id,
    required this.question,
    this.score,
    this.comment,
  });

  factory SurveyModel.fromJson(Map<String, dynamic> json) {
    return SurveyModel(
      id: json['id'],
      question: json['question'],
      score: json['score'],
      comment: json['comment'],
    );
  }

  factory SurveyModel.zero() {
    return SurveyModel(
      id: 0,
      question: "Question desu",
      score: null,
      comment: "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'question': question,
      'score': score,
      'comment': comment,
    };
  }


  
}
