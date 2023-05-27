import 'package:flutter/material.dart';
import 'package:ui_widget_example/widgets/button.dart';
import 'package:ui_widget_example/widgets/currency_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF181818),
        body: SingleChildScrollView(
          child: Padding(
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
                const CurrencyCard(
                    name: "Euro",
                    code: "EUR",
                    amount: "6 428",
                    icon: Icons.euro_rounded,
                    isInverted: true,
                ),
                const CurrencyCard(
                  name: "Bitcoin",
                  code: "BTC",
                  amount: "1 234",
                  icon: Icons.currency_bitcoin_rounded,
                  isInverted: false,
                ),
                const CurrencyCard(
                  name: "Dollar",
                  code: "USD",
                  amount: "9 876",
                  icon: Icons.attach_money_rounded,
                  isInverted: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
