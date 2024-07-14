import 'package:cab_cris/driver_add_journey_page2.dart';
import 'package:flutter/material.dart';

class DriverAddJourney extends StatefulWidget {
  const DriverAddJourney({super.key});

  @override
  State<DriverAddJourney> createState() => _DriverAddJourneyState();
}

class _DriverAddJourneyState extends State<DriverAddJourney> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
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
              'Choose Date:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            if (selectedDate == null)
              ElevatedButton(
                onPressed: () => _selectDate(context),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Select Date'),
              )
            else
              Text(
                '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                if (selectedDate != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DriverAddJourneyPage2(date: selectedDate!),
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
