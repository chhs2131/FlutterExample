import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit()
      : super(LoginState(
            isLoading: false, isLogin: false, id: "", pw: "", message: "-"));

  // 로그인 시도 했을 때
  void tryLogin(String id, String pw) async {
    // 로그인 정보를 가져오고 Loading 상태로 변경
    emit(state.setAccount(id, pw).setLoading(true).copy()); // method chaining

    // 대기
    await Future.delayed(const Duration(seconds: 3));

    // 계정 정보를 확인하고 결과를 적용
    if (id == "testid" && pw == "testpw") {
      emit(state.setLogin(true).setMessage("로그인 성공!").setLoading(false).copy());
      return;
    }
    emit(state.setLogin(false).setMessage("로그인 실패!").setLoading(false).copy());
  }

  // 로그아웃 동작!
  void tryLogout() async {
    // 로그인 정보를 가져오고 Loading 상태로 변경
    emit(state.setMessage("마지막으로 로그인한 계정 testid").setLoading(true).copy()); // method chaining

    // 대기
    await Future.delayed(const Duration(seconds: 3));

    // 로그아웃 진행
    emit(state.setAccount("", "").setLogin(false).setLoading(false).copy());
  }

  // emit
  @override
  void onChange(Change<LoginState> loginState) {
    super.onChange(loginState);
    print(loginState.toString());
  }
}
