import 'package:flutter/material.dart';

import '../../widgets/dashboard_label.dart';
import '../../widgets/social_widget.dart';

class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

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
              offset: Offset(0, -70),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      SocialWidget(
                        iconPath: "assets/icons/calendar_svg.svg",
                        label: "Event",
                      ),
                      SizedBox(height: 10),
                      DashboardLabel("Title"),
                      TextField(
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        maxLength: 10,
                        decoration: InputDecoration(
                          hintText: "Please enter the title",
                          counterText: '',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      DashboardLabel("Location"),
                      TextField(
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        maxLength: 10,
                        decoration: InputDecoration(
                          hintText: "Please enter the Location",
                          counterText: '',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      DashboardLabel("Description"),
                      TextField(
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        maxLength: 10,
                        decoration: InputDecoration(
                          hintText: "Please enter the description",
                          counterText: '',
                          hintStyle: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text("Create", style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}