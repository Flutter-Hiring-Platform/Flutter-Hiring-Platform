import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_app/home_page.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key, required this.title,
    required this.jobtitle, required this.description,
    required this.location, required this.company,
    required this.typecontract, required this.min,
    required this.max});
  final String title;
  final String jobtitle;
  final String description;
  final String location;
  final String company;
  final String typecontract;
  final String min;
  final String max;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text(title)),
        leading: const BackButton(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              SizedBox(
              width: 600,
              height: 500,
              child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 60,

                        ),
                        const Text('Job Title: '),
                        Text(jobtitle)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget> [
                              const Row(
                                  children: <Widget> [
                                    Text('Job Description: '),
                                  ],
                              ),
                              Row(
                                children: <Widget> [
                                 SizedBox(
                                   width: 400,
                                   child: Text(description),
                                 )
                                ],
                              ),
                            ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            const Text('Company: '),
                            Text(company),
                            const Text(''),
                            const Text(''),
                            const Text('Job location: '),
                            Text(location),

                          ],
                        ),
                      ],
                    ),
                    Row(
                        children: <Widget>[
                          const Text('Contract Type: '),
                          Text(typecontract),
                        ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Text('Salary Min: '),
                                Text(min),
                                const Text(' - Max: '),
                                Text(max),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => TodoWidget()));
                        },
                        child: const Text("Apply"),
                    ),
                    TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'LinkedIn')));
                        },
                        child: const Text('Go to Home page')
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
