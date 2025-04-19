import 'package:flutter/material.dart';
import 'package:qr_scanner/src/views/screens/utility/utility_results/wifi_result.dart';

import '../../widgets/dashboard_label.dart';
import '../../widgets/social_widget.dart';

class CreateWifi extends StatefulWidget {
  const CreateWifi({super.key});

  @override
  State<CreateWifi> createState() => _CreateWifiState();
}

class _CreateWifiState extends State<CreateWifi> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                    child: Icon(Icons.arrow_back, color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20,),
            child: Transform.translate(
              offset: Offset(0, -70),
              child: Container(
                width: MediaQuery.of(context).size.width,

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
                        iconPath: "assets/icons/wifi_svg.svg",
                        label: "Wifi",
                      ),
                      SizedBox(height: 10),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            DashboardLabel("Wireless network name"),
                            TextFormField(
                              controller: _nameController,
                              validator: _notEmptyValidator,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Please fill in SSID",
                                counterText: '',
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            DashboardLabel("Password"),
                            TextFormField(
                              controller: _passwordController,
                              validator: _notEmptyValidator,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Please Enter Password",
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
                      SizedBox(height: 30),
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
              child: Text("Create", style: TextStyle(color: Colors.white)),
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
      final name = _nameController.text;
      final password = _passwordController.text;
      String wifiData = "Wifi Name: $name, Password: $password";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WifiResult(data: wifiData)),
      );
    }
  }
}
