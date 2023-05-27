import 'package:flutter/material.dart';
import 'package:ui_widget_example/widgets/button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Hey, Selena",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          )),
                      Text("Welcome back",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 18)),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Text('Total Balance',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                  )),
              const SizedBox(
                height: 5,
              ),
              const Text('\$5 194 482',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 44,
                      fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(text: "Transfer", bgColor: Colors.amber, textColor: Colors.black),
                  Button(text: "Request", bgColor: Color(0xFF1F2123), textColor: Colors.white),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Wallets", style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    )
                  ),
                  Text("view all", style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 18,
                  )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                clipBehavior: Clip.hardEdge, // container 밖으로 overflow 됬을 때 어떻게 처리할지 지정
                decoration: BoxDecoration(
                  color: Color(0xFF1F2123),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Euro", style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                          )),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text("6 428", style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),),
                              const SizedBox(width: 5),
                              Text("EUR", style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 20
                              )),
                            ],
                          ),
                        ],
                      ),
                      Transform.scale(
                        scale: 2.2,
                        child: Transform.translate(
                            offset: const Offset(-5, 12),
                            child: Icon(Icons.euro_rounded, color: Colors.white, size: 88),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
