import 'package:flutter/material.dart';

class DashboardCards extends StatelessWidget {
  const DashboardCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine screen size
          final isSmallScreen = constraints.maxWidth < 600;
          final isMediumScreen = constraints.maxWidth >= 600 && constraints.maxWidth < 1200;

          // Small Screen: Column Layout
          if (isSmallScreen) {
            return SingleChildScrollView(
              child: Column(
                children: _buildCardList(),
              ),
            );
          }

          // Medium Screen: Grid Layout
          else if (isMediumScreen) {
            return GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              padding: const EdgeInsets.all(16.0),
              children: _buildCardList(),
            );
          }

          // Large Screen: Row Layout
          else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _buildCardList(),
              ),
            );
          }
        },
      ),
    );
  }

  // Method to generate a list of cards
  List<Widget> _buildCardList() {
    final List<Map<String, dynamic>> cardData = [
      {
        "color": Colors.blue,
        "title": "New Customers",
        "value": "154",
        "percentage": "+0%",
        "progress": 0.4,
        "icon": Icons.person,
      },
      {
        "color": Colors.purple,
        "title": "Inquiry",
        "value": "524",
        "percentage": "+21%",
        "progress": 0.7,
        "icon": Icons.public,
      },
      {
        "color": Colors.teal,
        "title": "New Projects",
        "value": "102",
        "percentage": "+10%",
        "progress": 0.6,
        "icon": Icons.work,
      },
      {
        "color": Colors.orange,
        "title": "Earning",
        "value": "2,453",
        "percentage": "+8%",
        "progress": 0.8,
        "icon": Icons.monetization_on,
      },
    ];

    return cardData.map((data) {
      return _buildCard(
        color: data["color"],
        title: data["title"],
        value: data["value"],
        percentage: data["percentage"],
        progress: data["progress"],
        icon: data["icon"],
      );
    }).toList();
  }

  // Widget for a single card
  Widget _buildCard({
    required Color color,
    required String title,
    required String value,
    required String percentage,
    required double progress,
    required IconData icon,
  }) {
    return Container(
      width: 250, // Fixed width for consistency in grid/row layouts
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: color.withOpacity(0.2),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: progress,
            color: color,
            backgroundColor: color.withOpacity(0.2),
            minHeight: 4,
          ),
          const SizedBox(height: 6),
          Text(
            "$percentage Since last month",
            style: TextStyle(
              fontSize: 12,
              color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
