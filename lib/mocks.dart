import 'models/kudos.dart';
import 'models/reward.dart';

class Mocks {
  static final List<Reward> rewards = [
    Reward("Dragon's egg", "assets/images/dragon.png"),
    Reward("Butterbeer", "assets/images/beer-bottle.png"),
    Reward("Toss a coin", "assets/images/coin.png"),
    Reward("Cinema tickets", "assets/images/tickets.png"),
    Reward("Large coffee", "assets/images/coffee.png"),
  ];

  static final List<Kudos> recentKudoses = [
    Kudos(
      "Mike",
      "Michalina",
      "assets/images/avatar1.png",
      "Many thanks for helping me with the broken internet connection",
    ),
    Kudos(
      "Karolina",
      "Adi",
      "assets/images/avatar2.png",
      "Kudos for a well prepared designs. I really like them",
    ),
    Kudos(
      "Karolina",
      "Karolina",
      "assets/images/avatar3.png",
      "Kudos for a great presentation during the last meeting with the team",
    ),
    Kudos(
      "Robert",
      "Lukas",
      "assets/images/avatar4.png",
      "Well prepared videos! Keep it going :)",
    ),
    Kudos(
      "Adi",
      "Thomas",
      "assets/images/avatar2.png",
      "For the delicious coffee and doughnuts we've had recently together",
    ),
    Kudos(
      "Przemek",
      "Jake",
      "assets/images/avatar6.png",
      "Thanks for an awesome presentation during our monthly talks",
    ),
    Kudos(
      "Rafał",
      "Elizabeth",
      "assets/images/avatar3.png",
      "For keeping an eye on our web page, many thanks!",
    ),
    Kudos(
      "Thomas",
      "Karolina",
      "assets/images/avatar3.png",
      "Thanks for letting me know about the recent changes in our work environment",
    ),
    Kudos(
      "Rafał",
      "Robert",
      "assets/images/avatar2.png",
      "Great job with the latest update of our web page",
    ),
  ];
}
