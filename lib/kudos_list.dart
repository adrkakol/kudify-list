import 'package:flutter/material.dart';

class KudosList extends StatelessWidget {
  final List<Map<String, String>> recentKudoses = [
    {
      "name": "John Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "Dizzy Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "Joey B.",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "John Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "John Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "John Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "John Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "John Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "John Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "John Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "John Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "John Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
    {
      "name": "Foo Doe",
      "description": "Thanks for helping me with the broken internet connection"
    },
  ];

  final List<Map<String, String>> rewards = [
    {"name": "Free Coffee"},
    {"name": "Dinner"},
    {"name": "Lunch"},
    {"name": "Cinema Ticket"}
  ];

  Widget _buildTile(Map<String, String> kudos) {
    return Card(
      margin: EdgeInsets.only(top: 5),
      child: ListTile(
          leading: Icon(
            Icons.account_circle_outlined,
            color: Colors.black38,
            size: 34.0,
          ),
          contentPadding:
              EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 8),
          title: Text(kudos["name"]),
          subtitle: Text(kudos["description"])),
    );
  }

  Widget _buildRewardTile(Map<String, String> reward) {
    return Container(
      width: 150.0,
      height: 400,
      margin: EdgeInsets.only(top: 5, left: 5),
      child: Card(
        child: ListTile(
          title: Text(reward["name"]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromRGBO(255, 255, 255, 0.92),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              centerTitle: true,
              expandedHeight: 240.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Browse kudoses",
                  style: TextStyle(color: Colors.black87),
                ),
                titlePadding: EdgeInsets.only(bottom: 16),
                centerTitle: true,
                background: Image.asset(
                  'assets/images/baner.png',
                  scale: 1.8,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 100.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: rewards.length,
                  itemBuilder: (context, index) {
                    return _buildRewardTile(rewards[index]);
                  },
                ),
              ),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
                return _buildTile(recentKudoses[index]);
              }, childCount: recentKudoses.length),
            )
          ],
        ));
  }
}
