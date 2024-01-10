
import 'package:flutter/material.dart';
import 'package:job_app/personalData.dart';
import 'package:job_app/personalData.widget.dart';
import 'package:job_app/personalService.dart';

class PersonalWidget extends StatelessWidget {
  const PersonalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceTint,
        title: const Text("Personal"),
      ),
      body: FutureBuilder(
        future: PersonalService.getPersonalData("659da12e30abd7ce6d7221dd"),
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
          return PersonalDataWidget(userid: snapshot.data!.first.userId,
          email: snapshot.data!.first.email,
          pwd: snapshot.data!.first.password,);  //! rend data non optionel
        },
      ),
    );
  }
}