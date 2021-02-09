import 'package:flutter/material.dart';
import 'package:lists/theme_colors.dart';

class KudosList extends StatelessWidget {
  final _backgroundRatio = 296 / 973; // height divided by width

  final List<Map> recentKudoses = [
    {
      "recipient": {
        "name": "Mike",
      },
      "sender": {"name": "Michalina", "avatarUrl": "assets/images/avatar1.png"},
      "description":
          "Many thanks for helping me with the broken internet connection"
    },
    {
      "recipient": {
        "name": "Karolina",
      },
      "sender": {"name": "Adi", "avatarUrl": "assets/images/avatar2.png"},
      "description": "Kudos for a well prepared designs. I really like them"
    },
    {
      "recipient": {
        "name": "Karolina",
      },
      "sender": {"name": "Karolina", "avatarUrl": "assets/images/avatar3.png"},
      "description":
          "Kudos for a great presentation during the last meeting with the team"
    },
    {
      "recipient": {
        "name": "Robert",
      },
      "sender": {"name": "Lukas", "avatarUrl": "assets/images/avatar4.png"},
      "description": "Well prepared videos! Keep it going :)"
    },
    {
      "recipient": {
        "name": "Adi",
      },
      "sender": {"name": "Thomas", "avatarUrl": "assets/images/avatar2.png"},
      "description":
          "For the delicious coffee and doughnuts we grabbed recently together"
    },
    {
      "recipient": {
        "name": "Przemek",
      },
      "sender": {"name": "Jake", "avatarUrl": "assets/images/avatar6.png"},
      "description": "KUDOS for taking the ovnership during our last meeting"
    },
    {
      "recipient": {
        "name": "Rafał",
      },
      "sender": {"name": "Elizabeth", "avatarUrl": "assets/images/avatar3.png"},
      "description": "For keeping an eye on our web page, many thanks!"
    },
  ];

  final List<Map<String, String>> rewards = [
    {"name": "Butterbeer", "image": "assets/images/beer-bottle.png"},
    {"name": "Dragon's egg", "image": "assets/images/dragon.png"},
    {"name": "Toss a coin", "image": "assets/images/coin.png"},
  ];

  Widget _buildTile(Map kudos) {
    final _userNameStyle =
        TextStyle(fontWeight: FontWeight.bold, color: ThemeColors.gray64);

    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 12, left: 16, right: 16),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: ThemeColors.gray223),
          borderRadius: BorderRadius.circular(6)),
      child: ListTile(
          leading: Image.asset(
            kudos["sender"]["avatarUrl"],
            height: 50,
          ),
          contentPadding:
              EdgeInsets.only(top: 12, bottom: 12, left: 16, right: 16),
          title: Row(children: [
            Text(
              kudos["sender"]["name"].toUpperCase(),
              style: _userNameStyle,
            ),
            Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Image.asset(
                  "assets/images/arrow.png",
                  height: 12,
                )),
            Text(kudos["recipient"]["name"].toUpperCase(),
                style: _userNameStyle),
          ]),
          subtitle: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(kudos["description"],
                  maxLines: 1, overflow: TextOverflow.ellipsis))),
    );
  }

  Widget _buildRewardTile(Map<String, String> reward, bool hasLeftMargin) {
    return Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: ThemeColors.gray223, width: 1),
            borderRadius: BorderRadius.circular(6)),
        margin: EdgeInsets.only(left: hasLeftMargin ? 16 : 0, right: 16),
        child: Container(
            width: 200.0,
            child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(children: [
                  SizedBox(height: 10),
                  Image.asset(
                    reward["image"],
                    height: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    reward["name"],
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: ThemeColors.gray64),
                  )
                ]))));
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              elevation: 0,
              pinned: true,
              backgroundColor: Colors.white,
              centerTitle: true,
              expandedHeight: _width * _backgroundRatio + 20,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "KUDOS WALL",
                  style: TextStyle(
                      color: ThemeColors.gray64,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                titlePadding: EdgeInsets.only(bottom: 8),
                centerTitle: true,
                background: Image.asset(
                  'assets/images/background.png',
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(top: 20, left: 16, bottom: 8),
              child: Text("PICK A REWARD",
                  style: TextStyle(
                    color: ThemeColors.gray64,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  )),
            )),
            SliverToBoxAdapter(
              child: Container(
                height: 120.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: rewards.length,
                  itemBuilder: (context, index) {
                    final _hasLeftPadding = index == 0;
                    return _buildRewardTile(rewards[index], _hasLeftPadding);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(top: 28, left: 16, bottom: 8),
              child: Text("BROWSE KUDOSES",
                  style: TextStyle(
                    color: ThemeColors.gray64,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  )),
            )),
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
