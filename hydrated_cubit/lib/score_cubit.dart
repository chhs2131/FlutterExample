import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_cubit/score_state.dart';

class ScoreCubit extends HydratedCubit<ScoreState> {
  ScoreCubit() : super(ScoreState(korean: 0, english: 0, math: 0));

  void plus() {
    // 점수 더하기 처리
    state.korean = (state.korean ?? 0) + 1;
    state.english = (state.english ?? 0) + 1;
    state.math = (state.math ?? 0) + 1;
    print(state.toString());

    // 변경된 사항을 반영하기 위해 새로운 instance를 생성하여 저장
    emit(ScoreState(
      korean: state.korean,
      english: state.english,
      math: state.math,
    ));
  }

  void reset() {
    emit(ScoreState(
        korean: 0,
        english: 0,
        math: 0)
    );
  }

  @override
  fromJson(Map<String, dynamic> json) {
    print("fromJson: ${json.toString()}");
    return ScoreState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(state) {
    print("toJson: ${state.toString()}");
    return state.toJson();
  }
}
