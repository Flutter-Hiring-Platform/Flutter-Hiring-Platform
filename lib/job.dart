class Job{
  int id;
  String title;
  String company;
  String description;
  String location;
  int salary;
  String category;
  String contractType;
  String createDate;

  Job(this.id, this.title, this.company, this.description, this.location, this.salary, this.category, this.contractType, this.createDate);
  // command + m for generate

  static Job fromJSON(Map<String, dynamic> json){
    return Job(
      json['id'],
      json['title'],
      json['company'],
      json['description'],
      json['location'],
      json['salary'],
      json['category'],
      json['contractType'],
      json['createDate']
    );
  }
}