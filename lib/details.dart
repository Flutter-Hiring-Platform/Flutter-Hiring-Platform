class Details {
  String jobtitle;
  String description;
  String company;
  String location;
  String typecontract;
  String max;
  String min;

  Details(this.jobtitle, this.description, this.company, this.location, this.typecontract, this.max, this.min,);

  static Details fromJson(Map<String, dynamic> json) {
    return Details(json['jobtitle'], json['description'], json['company'], json['location'], json['typecontract'], json['max'], json['min'],);
  }
}