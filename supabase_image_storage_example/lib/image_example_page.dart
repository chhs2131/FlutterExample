import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageExamplePage extends StatelessWidget {
  const ImageExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
          child: BodyWidget(),
        )
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  static final bucketName = 'test';
  late SupabaseClient supabase;
  List<FileObject> files = [];

  @override
  void initState() {
    super.initState();
    initSupabase();
  }

  Future<void> initSupabase() async {
    supabase = Supabase.instance.client;
    files = await supabase.storage.from(bucketName).list();
    setState(() {
      files;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          children: [
            const Center(
              child: Text(
                "Storage 파일 목록",
                style: TextStyle(fontSize: 30),
              ),
            ),
            for (var file in files)
              StorageChild(
                fileName: file.name,
                fileUrl: supabase.storage.from(bucketName).getPublicUrl(file.name),
              ),

            // Center(
            //   child: IconButton(
            //     icon: const Icon(Icons.add_a_photo),
            //     onPressed: () async {
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class StorageChild extends StatelessWidget {
  final String fileName;
  final String fileUrl;

  const StorageChild({Key? key, required this.fileName, required this.fileUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(fileName, style: const TextStyle(fontSize: 10)),
        OutlinedButton(
            onPressed: () {
              print(fileUrl);

              showDialog(
                  context: context,
                  barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Image.network(fileUrl),  // <- url로 이미지 불러오기
                      insetPadding: const  EdgeInsets.fromLTRB(0, 80, 0, 80),
                      actions: [
                        TextButton(
                          child: const Text('확인'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  }
              );

            },
            child: const Text("닫기"),
        ),
      ],
    );
  }
}
