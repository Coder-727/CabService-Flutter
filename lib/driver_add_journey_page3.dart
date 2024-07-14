import 'package:flutter/material.dart';

class DriverAddJourneyPage3 extends StatelessWidget {
  final DateTime date;
  final TimeOfDay time;

  const DriverAddJourneyPage3({super.key, required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    
    String start = 'A';
    String destination = 'B';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Journey',
          style: TextStyle(fontSize: 24,
          fontWeight: FontWeight.bold,),)
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          const SizedBox(height: 30,),
          const Center(
            child: Text('Review Journey',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text('Date: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${date.day}-${date.month}-${date.year}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text('Time: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('${time.hour}:${time.minute}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text('Start: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(start),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                const Text('Destination: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(destination),
              ],
            ),
          ),
          const Padding(
            padding:  EdgeInsets.all(16.0),
            child: Row(
              children: [
                 Text('Available Seats: ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 Text('5'),
              ],
            ),
          ),
          const SizedBox(height: 60,),
          Center(
            child: ElevatedButton(onPressed: (){
              // Implement your confirmation logic here
            }, child: const Text('Confirm',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
          ),
          const Spacer(flex: 3,),
        ],
      ),
    );
  }
}
