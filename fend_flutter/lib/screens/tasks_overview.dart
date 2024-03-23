import 'package:fend_flutter/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksOverview extends StatefulWidget{
  @override
  State<TasksOverview> createState() => _TasksOverviewState();
}

class _TasksOverviewState extends State<TasksOverview> {
  final networkImage =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWoXOj6dfCvRGhoatDxpGlIRPBb9k5Dr35z9dgRaiQ_g&s";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(kTitle),
        backgroundColor: Colors.pinkAccent,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white
              // image: DecorationImage(
              //   image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWoXOj6dfCvRGhoatDxpGlIRPBb9k5Dr35z9dgRaiQ_g&s"),
              //   fit: BoxFit.cover,
              // ),
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Fruits
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Call of Duty',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all",
                        style: TextStyle(color: Colors.pink[300]),
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width:
                          MediaQuery.of(context).size.width / 3, // Card width
                      child: Card(
                        color: Colors.pink[200],
                        // elevation: 4.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Task",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Text(
                                codTasks[index].details,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Reward",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Text(
                                codTasks[index].reward,
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),


              //2nd

              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Valorant',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all",
                        style: TextStyle(color: Colors.pink[300]),
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width:
                          MediaQuery.of(context).size.width / 3, // Card width
                      child: Card(
                        color: Colors.pink[200],
                        // elevation: 4.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Task",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Text(
                                "Burn 1000 calories",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Reward",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Text(
                                "VIP member access",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

               //3rd

               Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'DOTA',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all",
                        style: TextStyle(color: Colors.pink[300]),
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width:
                          MediaQuery.of(context).size.width / 3, // Card width
                      child: Card(
                        color: Colors.pink[200],
                        // elevation: 4.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Task",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Text(
                                "Read 24 pages from Pride and Prejudice",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Reward",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                              Text(
                                "75 mangnum skillset",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
