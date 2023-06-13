class LoginState {
  bool isLoading;
  bool isLogin;
  String id;
  String pw;
  String message;

  LoginState({
    required this.isLoading,
    required this.isLogin,
    required this.id,
    required this.pw,
    required this.message,
  });

  LoginState copy() => LoginState(
    isLoading: isLoading,
    isLogin: isLogin,
    id: id,
    pw: pw,
    message: message,
  );

  LoginState setMessage(String message) {
    this.message = message;
    return this;
  }

  LoginState setLogin(bool state) {
    isLogin = state;
    return this;
  }

  LoginState setLoading(bool state) {
    isLoading = state;
    return this;
  }

  LoginState setAccount(String id, String pw) {
    this.id = id;
    this.pw = pw;
    return this;
  }

  @override
  String toString() {
    return "isLoading:$isLoading, isLogin:$isLogin, id:$id, pw:$pw, msg:$message";
  }
}
