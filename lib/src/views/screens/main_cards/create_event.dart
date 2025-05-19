import 'package:flutter/material.dart';
import 'package:qr_scanner/src/views/screens/main_cards/main_results/event_result.dart';

import '../../widgets/dashboard_label.dart';
import '../../widgets/social_widget.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              DashboardLabel("Title"),
                              TextFormField(
                                controller: _titleController,
                                validator: _notEmptyValidator,
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
                              TextFormField(
                                controller: _locationController,
                                validator: _notEmptyValidator,
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
                              TextFormField(
                                controller: _descriptionController,
                                validator: _notEmptyValidator,
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
                              SizedBox(height: 10),
                              DashboardLabel("Start Date"),
                              TextFormField(
                                controller: _startDateController,
                                validator: _notEmptyValidator,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: "Please enter the date",
                                  counterText: '',
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              DashboardLabel("End Date"),
                              TextFormField(
                                controller: _endDateController,
                                validator: _notEmptyValidator,
                                keyboardType: TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                maxLength: 10,
                                decoration: InputDecoration(
                                  hintText: "Please enter the end date",
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
      String title = _titleController.text;
      String location = _locationController.text;
      String description = _descriptionController.text;
      String startDate = _startDateController.text;
      String endDate = _endDateController.text;
      String eventData = """BEGIN:VEVENT
      SUMMARY:
      $title
      LOCATION:
      $location
      DESCRIPTION:
      $description
      DTSTART:
      $startDate
      DTEND:
      $endDate""";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EventResults(data: eventData)),
      );
    }
  }
}
