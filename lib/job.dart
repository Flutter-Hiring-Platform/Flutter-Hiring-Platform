class Job{
  String title;
  String company;
  String description;
  String location;
  // String category;
  // String contractType;
  // String createDate;

  Job(this.title, this.company, this.description, this.location);
  // , this.description, this.location, this.category, this.contractType, this.createDate);
  // Job(this.title);
  // command + m for generate

  // static Job fromJSON(Map<String, dynamic> json){
  //   return Job(
  //     json['title'],
  //     json['company']['display_name'],
  //     json['description'],
  //     json['location']['display_name'],
  //     json['salary_max'],
  //     json['category']['label'],
  //     json['contract_type'],
  //     json['create']
  //   );
  // }
  factory Job.fromJSON(Map<String, dynamic> json) {
    return Job(
      json['title'],
      json['company']['display_name'],

      json['description'],
      json['location']['display_name'],
      // // json['salary_max'],
      // json['category']['label'],
      // json['contract_type'],
      // json['created'],
    );
  }
}