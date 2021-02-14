import 'package:flutter/material.dart';
import 'package:lists/mocks.dart';
import 'package:lists/models/kudos.dart';
import 'package:lists/models/reward.dart';

class KudosList extends StatelessWidget {
  static const int _backgroundWidth = 973;
  static const int _backgroundHeight = 296;
  final double _backgroundRatio = _backgroundHeight / _backgroundWidth;

  Widget _buildListSubtitle(BuildContext context, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 16.0, bottom: 10.0),
      child: Text(
        subtitle,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  Widget _buildRewardListTile(BuildContext context, int index) {
    bool hasLeftMargin = index == 0;
    Reward reward = Mocks.rewards[index];

    return Card(
      elevation: 0,
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
                style: Theme.of(context).textTheme.headline3,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildKudosListTile(BuildContext context, int index) {
    final Kudos kudos = Mocks.recentKudoses[index];

    return Card(
      elevation: 0.0,
      margin: const EdgeInsets.only(
        bottom: 12.0,
        left: 16.0,
        right: 16.0,
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
              style: Theme.of(context).textTheme.subtitle1,
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
              style: Theme.of(context).textTheme.subtitle1,
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
    final double _deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            pinned: true,
            backgroundColor: Colors.white,
            centerTitle: true,
            expandedHeight: _deviceWidth * _backgroundRatio + 20.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "KUDOS WALL",
                style: Theme.of(context).textTheme.headline1,
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
          SliverToBoxAdapter(
              child: _buildListSubtitle(context, "PICK A REWARD")),
          SliverToBoxAdapter(
            child: Container(
              height: 120.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Mocks.rewards.length,
                itemBuilder: (_, int index) =>
                    _buildRewardListTile(context, index),
              ),
            ),
          ),
          SliverToBoxAdapter(
              child: _buildListSubtitle(context, "BROWSE KUDOSES")),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) => _buildKudosListTile(context, index),
              childCount: Mocks.recentKudoses.length,
            ),
          )
        ],
      ),
    );
  }
}
