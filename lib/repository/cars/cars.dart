class Cars {
  final int number;
  final String date;
  final String state;

  Cars({required this.number, required this.date, required this.state});

  factory Cars.fromJson(Map<String, dynamic> json) {
    return Cars(
      number: json['number'] as int,
      date: json['date'] as String,
      state: json['state'] as String,
    );
  }
}
