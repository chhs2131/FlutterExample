import 'package:flutter/material.dart';

import '../models/webtoon_model.dart';
import '../services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            // return const Text("There is data!");
            return ListView.separated(  // ListView.builder: 사용자가 보고있는 item만 listView에 빌드한다.
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                print(index);
                var webtoon = snapshot.data![index];
                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => SizedBox(  // Item 사이마다 아래 구문을 실행한다.
                width: 20,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
