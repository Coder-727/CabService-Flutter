class Cab {
  final String cabNumber;
  final String start;
  final String destination;
  final int availableSeats;
  final String driverName;
  final String startTime;
  final String date;

  Cab({
    required this.cabNumber,
    required this.start,
    required this.destination,
    required this.availableSeats,
    required this.driverName,
    required this.startTime,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'cabNumber': cabNumber,
      'start': start,
      'destination': destination,
      'availableSeats': availableSeats,
      'driver': driverName,
      'startTime': startTime,
      'date': date,
    };
  }

  factory Cab.fromMap(Map<String, dynamic> map) {
  return Cab(
    cabNumber: map['cabNumber'] ?? '',
    start: map['start'] ?? '',
    destination: map['destination'] ?? '',
    availableSeats: map['availableSeats'] != null ? map['availableSeats'] as int : 0,
    driverName: map['driver'] != null && map['driver'] is Map ? map['driver']['name'] as String : '',
    startTime: map['startTime'] ?? '',
    date: map['date'] ?? '',
  );
}

}
