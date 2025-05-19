import 'package:flutter/material.dart';
import 'package:qr_scanner/src/views/screens/social/social_results/facebook_result.dart';

import '../../widgets/dashboard_label.dart';
import '../../widgets/social_widget.dart';

class CreateFacebook extends StatefulWidget {
  const CreateFacebook({super.key});

  @override
  State<CreateFacebook> createState() => _CreateFacebookState();
}

class _CreateFacebookState extends State<CreateFacebook> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fbController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F5),
      body:  Column(
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.arrow_back, color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Transform.translate(
              offset: Offset(0, -70),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
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
                        iconPath: "assets/icons/fb_svg.svg",
                        label: "Facebook",
                      ),
                      SizedBox(height: 10),
                      DashboardLabel("User ID"),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _fbController,
                          validator: _notEmptyValidator,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Please Enter Your User Id",
                            hintStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
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
            onPressed: () {
              _submit();
            },
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


  String? _notEmptyValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final fbUrl = _fbController.text;
      String fbData = "https://www.facebook.com/$fbUrl";
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FacebookResult(data: fbData,),
        ),
      );
    }
  }

}