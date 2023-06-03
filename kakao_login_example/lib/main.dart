import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'kakao_login_api.dart';
import 'kakao_user_model.dart';

void main() {
  // 웹 환경에서 카카오 로그인을 정상적으로 완료하려면 runApp() 호출 전 아래 메서드 호출 필요
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
    nativeAppKey: '5105c538e874bd1869e7115df04297071qa',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<KakaoUserModel> kakaoUser;
  bool isLogin = false;

  void pressedLoginButton() {
    kakaoUser = KakaoApiService.pressedLoginButton();
    setState(() {
      isLogin = true;
    });
  }

  void pressedInformationButton() {
    KakaoApiService.accessTokenInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("flutter kakao login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Transform.scale(
              scale: 1.5,
              child: IconButton(
                icon: const Icon(Icons.login_rounded),
                onPressed: pressedLoginButton,
              ),
            ),
            Transform.scale(
              scale: 1.5,
              child: IconButton(
                icon: const Icon(Icons.info_outline_rounded),
                onPressed: pressedInformationButton,
              ),
            ),
            isLogin ? FutureBuilder(
              future: kakaoUser,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text("카카오아이디: ${snapshot.data!.uuid}"),
                        Text("성별: ${snapshot.data!.gender}"),
                        Text("AccessToken: ${snapshot.data!.accessToken}"),
                        Container(
                          width: 250,
                          child: Image.network(snapshot.data!.profileImageUrl),
                        ),
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                  return Container();
                }
            ) : Text("please login"),
          ],
        ),
      ),
    );
  }
}
