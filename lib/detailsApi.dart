// import 'package:job_app/details_page.widget.dart';
//
// import 'details.service.dart';
// import 'package:flutter/material.dart';
//
// class DetailsApiWidget extends StatelessWidget {
//   const DetailsApiWidget({super.key, required this.id});
//   final String id;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.surfaceTint,
//         title: const Text("Details"),
//       ),
//       body: FutureBuilder(
//         future: DetailsService.getDetails(id),
//         builder: (context, snapshot) {
//           if(snapshot.hasError){
//             return const Center(
//               child: Text("Error de téléchargement"),
//             );
//           }
//           if(!snapshot.hasData) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           // return const Detail(jobtitle: "error", description: "error",
//           // location: "error", typecontract: "error",
//           //   min: "error", company: "error",
//           //   max: "error",
//           // );
//             return Detail(jobtitle: snapshot.data!.jobtitle, description: snapshot.data!.description,
//             location: snapshot.data!.location, typecontract: snapshot.data!.typecontract,
//             min: snapshot.data!.min, company: snapshot.data!.company,
//             max: snapshot.data!.max,
//           );//! rend data non optionel
//         },
//       ),
//     );
//   }
// }