import 'package:cab_cris/driver_add_journey_page3.dart';
import 'package:flutter/material.dart';

class DriverAddJourneyPage2 extends StatefulWidget {
  final DateTime date;

  const DriverAddJourneyPage2({super.key, required this.date});

  @override
  State<DriverAddJourneyPage2> createState() => _DriverAddJourneyPage2State();
}

class _DriverAddJourneyPage2State extends State<DriverAddJourneyPage2> {
  TimeOfDay? selectedTime;

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Journey',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Choose Time:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            if (selectedTime == null)
              ElevatedButton(
                onPressed: () => _selectTime(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Select Time'),
              )
            else
              Text(
                '${selectedTime!.hour}:${selectedTime!.minute}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (selectedTime != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DriverAddJourneyPage3(
                      date: widget.date,
                      time: selectedTime!,
                    ),
                  ));
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
