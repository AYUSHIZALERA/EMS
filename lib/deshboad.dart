import 'package:flutter/material.dart';
import 'package:ems/widget/DashboardCards.dart';
import 'package:ems/widget/ProjectStatusCard.dart';
import 'package:ems/widget/State_wise_cliient.dart';
import 'package:ems/widget/todo_task.dart'; // Import your widgets

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  bool isSidebarExpanded = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            // Sidebar (Vertical bar)
            Container(
              color: const Color(0xFF001F54),
              width: isSidebarExpanded ? 250 : 70,
              child: Column(
                children: [
                  if (isSidebarExpanded)
                    Column(
                      children: [
                        Image.asset("assets/LOGO.png", width: 100, height: 100),
                        Image.asset("assets/profile.jpg", width: 60, height: 60),
                        const Text(
                          "Ayushi Zalera",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: Colors.white),
                        ),
                        const Text(
                          "Admin",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 20),
                        _buildSidebarItem(Icons.dashboard, "Dashboard", () {}),
                        _buildSidebarItem(Icons.settings, "Settings", () {}),
                      ],
                    )
                  else
                    Column(
                      children: [
                        Image.asset(
                          "assets/LOGO.png",
                          width: 50,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) => const Icon(
                            Icons.error,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Icon(Icons.dashboard, color: Colors.white),
                        const SizedBox(height: 16),
                        const Icon(Icons.settings, color: Colors.white),
                      ],
                    ),
                ],
              ),
            ),

            // Main Content Area
            Expanded(
              child: Column(
                children: [
                  // Top Blue Bar
                  Container(
                    color: const Color(0xFF001F54),
                    height: 60,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              isSidebarExpanded = !isSidebarExpanded;
                            });
                          },
                        ),
                        const Spacer(),
                        const Icon(Icons.notifications, color: Colors.white),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                              'https://via.placeholder.com/150'), // Replace with profile picture
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Ayushi Zalera',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),

                  // Main Dashboard Content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // Dashboard Cards
                            SizedBox(
                              height: 250,
                              child: DashboardCards(),
                            ),
                            const SizedBox(height: 20),

                            // Row with ProjectStatusCard, StateWiseClientCard, and TodoWidget
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 410,
                                    height: 440,
                                    child: ProjectStatusCard(),
                                  ),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 410,
                                    height: 440,
                                    child: StateWiseClientCard(),
                                  ),
                                  const SizedBox(width: 20),
                                  SizedBox(
                                    width: 410,
                                    height: 440,
                                    child: TodoWidget(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}