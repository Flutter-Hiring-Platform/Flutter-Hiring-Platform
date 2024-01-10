import 'package:job_app/details_page.widget.dart';

import 'details.service.dart';
import 'package:flutter/material.dart';

class DetailsApiWidget extends StatelessWidget {
  const DetailsApiWidget({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        title: const Text("Details"),
      ),
      body: FutureBuilder(
        future: DetailsService.getDetails(id),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return const Center(
              child: Text("Error de téléchargement"),
            );
          }
          if(!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Detail(jobtitle: "error", description: "error",
          location: "error", typecontract: "error",
            min: "error", company: "error",
            max: "error",
          );
          // return Detail(jobtitle: snapshot.data.first.jobtitle, description: snapshot.data.first.description,
          //   location: snapshot.data.first.location, typecontract: snapshot.data.first.typecontract,
          //   min: snapshot.data.first.min, company: snapshot.data.first.company,
          //   max: snapshot.data.first.max,
          // );//! rend data non optionel
        },
      ),
    );
  }
}