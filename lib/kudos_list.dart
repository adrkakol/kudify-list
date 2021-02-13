import 'package:flutter/material.dart';
import 'package:lists/mocks.dart';
import 'package:lists/models/kudos.dart';
import 'package:lists/models/reward.dart';
import 'package:lists/theme_colors.dart';

class KudosList extends StatelessWidget {
  static const int _backgroundWidth = 973;
  static const int _backgroundHeight = 296;
  final double _backgroundRatio = _backgroundHeight / _backgroundWidth;

  final BorderSide _tileBorder = BorderSide(
    color: ThemeColors.tileBorderColor,
  );

  Widget _buildListSubtitle(String subtitle) {
    const TextStyle _subHeaderTextStyle = TextStyle(
      color: ThemeColors.mainFontColor,
      decoration: TextDecoration.none,
      fontSize: 14.0,
      fontWeight: FontWeight.w800,
    );

    return Padding(
      padding: EdgeInsets.only(top: 30.0, left: 16.0, bottom: 10.0),
      child: Text(subtitle, style: _subHeaderTextStyle),
    );
  }

  Widget _buildRewardListTile(Reward reward, bool hasLeftMargin) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: _tileBorder,
        borderRadius: BorderRadius.circular(6.0),
      ),
      margin: EdgeInsets.only(
        left: hasLeftMargin ? 16.0 : 0.0,
        right: 16.0,
      ),
      child: Container(
        width: 150.0,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              Image.asset(
                reward.imageUrl,
                height: 50.0,
              ),
              SizedBox(height: 10.0),
              Text(
                reward.name,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.mainFontColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKudosListTile(Kudos kudos) {
    const TextStyle _personNameTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: ThemeColors.mainFontColor,
    );

    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(
        bottom: 12.0,
        left: 16.0,
        right: 16.0,
      ),
      shape: RoundedRectangleBorder(
        side: _tileBorder,
        borderRadius: BorderRadius.circular(6),
      ),
      child: ListTile(
        leading: Image.asset(
          kudos.sender.avatarUrl,
          height: 50.0,
        ),
        contentPadding: const EdgeInsets.only(
          top: 12.0,
          bottom: 12.0,
          left: 16.0,
          right: 16.0,
        ),
        title: Row(
          children: [
            Text(
              kudos.sender.name.toUpperCase(),
              style: _personNameTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Image.asset(
                "assets/images/arrow.png",
                height: 12.0,
              ),
            ),
            Text(
              kudos.recipient.name.toUpperCase(),
              style: _personNameTextStyle,
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            kudos.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
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
            expandedHeight: _width * _backgroundRatio + 20.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "KUDOS WALL",
                style: const TextStyle(
                  color: ThemeColors.mainFontColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0,
                ),
              ),
              titlePadding: const EdgeInsets.only(bottom: 8.0),
              centerTitle: true,
              background: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SliverToBoxAdapter(child: _buildListSubtitle("PICK A REWARD")),
          SliverToBoxAdapter(
            child: Container(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Mocks.rewards.length,
                itemBuilder: (_, index) {
                  bool hasLeftMargin = index == 0;
                  Reward reward = Mocks.rewards[index];

                  return _buildRewardListTile(reward, hasLeftMargin);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(child: _buildListSubtitle("BROWSE KUDOSES")),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) => _buildKudosListTile(Mocks.recentKudoses[index]),
              childCount: Mocks.recentKudoses.length,
            ),
          )
        ],
      ),
    );
  }
}
