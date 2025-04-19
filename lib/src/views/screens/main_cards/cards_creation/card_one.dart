import 'package:flutter/material.dart';

class CardOne extends StatelessWidget {
  const CardOne({super.key});

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
              padding: const EdgeInsets.only(left: 15, top: 50),
              child: Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.arrow_back, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Transform.translate(
              offset: Offset(0, -73),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xFF230044),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "Card One",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Card One Description",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                          Text(
                            "Card One",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, top: 30, bottom: 30),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.phone, color: Colors.blue, size: 20,),
                                SizedBox(width: 10),
                                Text("Phone Number")
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.email, color: Colors.blue, size: 20,),
                                SizedBox(width: 10),
                                Text("Email Address")
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.home, color: Colors.blue, size: 20,),
                                SizedBox(width: 10),
                                Text("Home Address")
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, color: Colors.blue, size: 20,),
                                SizedBox(width: 10),
                                Text("Location")
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
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
