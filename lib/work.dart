class Work {
  final String title;
  final String description;
  final String location;
  final String salary_max;
  final String salary_min;
  final String company;
  final String contract_type;

  const Work({
    required this.title,
    required this.description,
    required this.location,
    required this.salary_min,
    required this.salary_max,
    required this.company,
    required this.contract_type,
  });

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      location: json['location'] ?? '',
      salary_min: json['salary_min'] ?? '',
      salary_max: json['salary_max'] ?? '',
      company: json['company'] ?? '',
      contract_type: json['contract_type'] ?? '',
    );
  }
}
