import 'package:flutter/material.dart';
import 'user_service.dart';

class UserPersonalDetailsPage extends StatefulWidget {
  const UserPersonalDetailsPage({super.key});

  @override
  State<UserPersonalDetailsPage> createState() => _UserPersonalDetailsPageState();
}

class _UserPersonalDetailsPageState extends State<UserPersonalDetailsPage> {
  late Future<Map<String, dynamic>> _userFuture;
  
  @override
  void initState() {
    super.initState();
    _userFuture = UserService().fetchCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal Details',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: _userFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            } else {
              final user = snapshot.data!;
              return Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: Center(
                      child: Image.asset('assets/images/profile.jpg'),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Name : ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  user['name'] as String,
                                  style: const TextStyle(fontSize: 20),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Gender : ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  user['gender'] as String,
                                  style: const TextStyle(fontSize: 20),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'EmployeeId : ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  user['employeeid'] as String,
                                  style: const TextStyle(fontSize: 20),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Designation : ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  user['designation'] as String,
                                  style: const TextStyle(fontSize: 20),
                                )
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Contact No. : ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  user['phone'] as String,
                                  style: const TextStyle(fontSize: 20),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
