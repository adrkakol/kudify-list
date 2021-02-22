# lists

List project for a blog episode.
Shows usage of silver lists and silver app bar.

TODO subjects to mention in the post:

1. types of builders
https://api.flutter.dev/flutter/widgets/SliverChildListDelegate-class.html
for expicitly stated number of items

instead: SliverChildBuilderDelegate https://api.flutter.dev/flutter/widgets/SliverChildBuilderDelegate-class.html for long lists

"Many slivers lazily construct their box children to avoid creating more children than are visible through the Viewport"


2. Automatic initialisers in dart:
https://dart.academy/creating-objects-and-classes-in-dart-and-flutter/

```
class Point {
  int x;
  int y;
  
  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }
}

// VS

class Point {
  int x;
  int y;

  Point(this.x, this.y);
}
```

3. Story about theming with ThemeData
https://flutter.dev/docs/cookbook/design/themes