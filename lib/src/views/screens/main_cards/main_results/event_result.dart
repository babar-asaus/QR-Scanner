import 'package:flutter/material.dart';

class EventResults extends StatefulWidget {
  final String data;
   const EventResults({super.key, required this.data});

  @override
  State<EventResults> createState() => _EventResultsState();
}

class _EventResultsState extends State<EventResults> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.data),
      ),
    );
  }
}
