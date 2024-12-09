import 'package:flutter/material.dart';

class JobApplicantsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: SizedBox(
            width: 400,
            height: 400,
            child: Column(
              children: [
                // Card Title
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Jobs Applicants",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle( color: const Color(0xFF001F54),),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                // Tab Bar
                DefaultTabController(
                  length: 2,
                  child: Expanded(
                    child: Column(
                      children: [
                        TabBar(
                          indicatorColor:  const Color(0xFF001F54),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                            color: const Color(0xFF001F54),
                            borderRadius: BorderRadius.circular(0),
                          ),
                          tabs: const [
                            Tab(text: "Openings"),
                            Tab(text: "Applicants"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              // Openings Tab
                              ListView(
                                children: [
                                  _buildJobOpeningCard(
                                    icon: Icons.apple,
                                    title: "Senior iOS Developer",
                                    openings: 25,
                                  ),
                                  _buildJobOpeningCard(
                                    icon: Icons.code,
                                    title: "Junior PHP Developer",
                                    openings: 20,
                                  ),
                                  _buildJobOpeningCard(
                                    icon: Icons.web,
                                    title: "Junior React Developer",
                                    openings: 30,
                                  ),
                                  _buildJobOpeningCard(
                                    icon: Icons.storage,
                                    title: "Senior Laravel Developer",
                                    openings: 40,
                                  ),
                                ],
                              ),
                              // Applicants Tab
                              ListView(
                                children: [
                                  _buildApplicantCard(
                                    name: "Brian Villalobos",
                                    experience: "5+ Years",
                                    location: "USA",
                                    role: "UI/UX Designer",
                                    color: Colors.blue,
                                  ),
                                  _buildApplicantCard(
                                    name: "Anthony Lewis",
                                    experience: "4+ Years",
                                    location: "USA",
                                    role: "Python Developer",
                                    color: Colors.indigo,
                                  ),
                                  _buildApplicantCard(
                                    name: "Stephan Peralt",
                                    experience: "6+ Years",
                                    location: "USA",
                                    role: "Android Developer",
                                    color: Colors.pink,
                                  ),
                                  _buildApplicantCard(
                                    name: "Doglas Martini",
                                    experience: "2+ Years",
                                    location: "USA",
                                    role: "React Developer",
                                    color: Colors.teal,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildJobOpeningCard({
    required IconData icon,
    required String title,
    required int openings,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: Icon(icon, color: Colors.black),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("No of Openings: $openings"),
      trailing: IconButton(
        icon: const Icon(Icons.edit, color: Colors.grey),
        onPressed: () {},
      ),
    );
  }

  Widget _buildApplicantCard({
    required String name,
    required String experience,
    required String location,
    required String role,
    required Color color,
  }) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Dummy image
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("Exp: $experience · $location"),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          role,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
