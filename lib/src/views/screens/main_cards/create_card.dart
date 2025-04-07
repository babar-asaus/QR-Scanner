import 'package:flutter/material.dart';

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
                    Expanded(child: Center(child: Text("V card", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),))),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
