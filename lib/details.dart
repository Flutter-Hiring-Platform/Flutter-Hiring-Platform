class Details {
  final String jobtitle;
  final String description;
  final String company;
  final String location;
  final String typecontract;
  final String max;
  final String min;

  const Details({
    required this.jobtitle,
    required this.description,
    required this.company,
    required this.location,
    required this.typecontract,
    required this.max,
    required this.min,
  });

  // static Details fromJson(Map<String, dynamic> json) {
  //   return Details(json['jobtitle'], json['description'], json['company'], json['location'], json['typecontract'], json['max'], json['min'],);
  // }

  factory Details.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'jobtitle': String jobtitle,
        'description': String description,
        'location': String location,
        'company': String company,
        'typecontract': String typecontract,
        'min': String min,
        'max': String max,
      } =>
        Details(
          jobtitle: jobtitle,
          description: description,
          location: location,
          company: company,
          typecontract: typecontract,
          min: min,
          max: max,
        ),
      _ => throw const FormatException('Failed to load User.'),
    };
  }
}
