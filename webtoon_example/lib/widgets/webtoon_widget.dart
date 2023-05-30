import 'package:flutter/material.dart';
import 'package:webtoon_example/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('누른것은, $title');
        Navigator.push(
          context,
          MaterialPageRoute(
            // route를 이용하여 stless인 detail screen을 렌더링 (연관있는 페이지에서 depth만 깊어지는 경우 사용하면 좋을듯)
            builder: (context) =>
                DetailScreen(title: title, thumb: thumb, id: id),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 250,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      offset: const Offset(10, 10),
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ]),
              child: Image.network(thumb),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(title,
              style: const TextStyle(
                fontSize: 22,
              )),
        ],
      ),
    );
  }
}
