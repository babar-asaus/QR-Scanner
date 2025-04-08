import 'package:flutter/material.dart';
import 'package:qr_scanner/src/views/screens/main_cards/cards_creation/card_two.dart';

import 'cards_creation/card_four.dart';
import 'cards_creation/card_one.dart';
import 'cards_creation/card_three.dart';

class CreateCard extends StatelessWidget {
  const CreateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F5),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, top: 35, right: 35),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    Expanded(
                      child: Center(
                        child: Text(
                          "V card",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap:
                        () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CardOne()),
                          ),
                        },
                    child: Image.asset("assets/images/card_1.png"),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: InkWell(
                    onTap:
                        () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => CardTwo()),
                          ),
                        },
                    child: Image.asset("assets/images/card_2.png"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap:
                        () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CardThree(),
                            ),
                          ),
                        },
                    child: Image.asset("assets/images/card_3.png"),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(child: InkWell(
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CardFour(),
                        ),
                      ),
                    },
                    child: Image.asset("assets/images/card_4.png"))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
