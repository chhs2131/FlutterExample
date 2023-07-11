class ScoreState {
  int? korean;
  int? english;
  int? math;

  ScoreState({this.korean, this.english, this.math});

  ScoreState.fromJson(Map<String, dynamic> json) {
    korean = json['korean'];
    english = json['english'];
    math = json['math'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['korean'] = this.korean;
    data['english'] = this.english;
    data['math'] = this.math;
    return data;
  }

  @override
  String toString() {
    return 'ScoreState{korean: $korean, english: $english, math: $math}';
  }
}
