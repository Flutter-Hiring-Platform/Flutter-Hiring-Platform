class Work {
  final String title;
  final String description;
  final String location;
  final String salary_max;
  final String salary_min;
  final String company;
  final String contract_type;

  const Work({ required this.title, required this.description, required this.location, required this.salary_min, required this.salary_max, required this.company, required this.contract_type});

  factory Work.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
         'title': String title,
          'description': String description,
          'location': String location,
          'salary_min': String salary_min,
          'salary_max': String salary_max,
          'company': String company,
          'contract_type': String contract_type,
      
      } =>
        Work(
          title: title,
          description: description,
          location: location,
          salary_min: salary_min,
          salary_max: salary_max,
          company: company,
          contract_type: contract_type,
        ),
      _ => throw const FormatException('Failed to load job.'),
    };
  }
}