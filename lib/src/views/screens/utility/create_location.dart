import 'package:flutter/material.dart';
import 'package:qr_scanner/src/views/screens/utility/utility_results/location_result.dart';

import '../../widgets/dashboard_label.dart';
import '../../widgets/social_widget.dart';

class CreateLocation extends StatefulWidget {
  const CreateLocation({super.key});

  @override
  State<CreateLocation> createState() => _CreateLocationState();
}

class _CreateLocationState extends State<CreateLocation> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7F5),
      body: SingleChildScrollView(
        child: Column(
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
                offset: Offset(0, MediaQuery.of(context).size.height * -0.05),
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
                          iconPath: "assets/icons/location_svg.svg",
                          label: "Location",
                        ),
                        SizedBox(height: 10),

                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              DashboardLabel("Longitude"),
                              TextFormField(
                                controller: _longitudeController,
                                validator: _notEmptyValidator,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: "Please Enter Longitude",
                                  counterText: '',
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              DashboardLabel("Latitude"),
                              TextFormField(
                                controller: _latitudeController,
                                validator: _notEmptyValidator,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: "Please Enter Latitude",
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
      final lat = _latitudeController.text;
      final long = _longitudeController.text;
      String geoData = "geo:$lat,$long";
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationResult(data: geoData,),
        ),
      );
    }
  }
}
