# Animation List

A simple animation listview widget.<br>
When it is built, list item is shown by sliding and bouncing.
<br><br>


# Preview
<img src="https://user-images.githubusercontent.com/24351423/179394703-39124ab6-619c-404f-9a38-a284a7fd4a92.gif" width="300"> <img src="https://user-images.githubusercontent.com/24351423/179394698-902ec69e-79e5-4777-9499-f4cca2684745.gif" width="300">







# Installation

Add `animation_list: ^2.2.0` to your `pubspec.yaml` dependecies. And import it:

```
import 'package:animation_list/animation_list.dart';
```
<br>

# How to use
Simply add a Animation List widget with required params.

```
final List<Map<String, dynamic>> data = [
    {
      'title': '1111',
      'backgroundColor': Colors.grey,
    },
    {
      'title': '2222',
      'backgroundColor': Colors.red,
    },
    {
      'title': '3333',
      'backgroundColor': Colors.yellow,
    },
    {
      'title': '4444',
      'backgroundColor': Colors.blue,
    },
    {
      'title': '5555',
      'backgroundColor': Colors.green,
    },
    {
      'title': '6666',
      'backgroundColor': Colors.orange,
    },
    {
      'title': '7777',
      'backgroundColor': Colors.brown,
    },
    {
      'title': '8888',
      'backgroundColor': Colors.purple,
    },
  ];

  Widget _buildTile(String title, Color backgroundColor) {
    return Container(
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: backgroundColor,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimationList(
            children: data.map((item) {
              return _buildTile(item['title'], item['backgroundColor']);
            }).toList()),
            duration: 1000,
            reBounceDepth: 10.0,
      ),
    );
  }
```
<br>

# Properties
| Attribute | Data type | Description | Default |
|--|--|--|--|
| key | Key | Controls how one widget replaces another widget in the tree | - |
| controller | ScrollController | An object that can be used to control the position to which this scroll view is scrolled | - |
| primary | bool | Whether this is the primary scroll view associated with the parent PrimaryScrollController | - |
| physics | ScrollPhysics | How the scroll view should respond to user input | - |
| shrinkWrap | bool | Whether the extent of the scroll view in the scrollDirection should be determined by the contents being viewed | false |
| padding | EdgeInsetsGeometry | The amount of space by which to inset the children | - |
| cacheExtent | double | The viewport has an area before and after the visible area to cache items that are about to become visible when the user scrolls | - |
| children | List<Widget> | The children are required to fill the ListView | <Widget>[] |
| semanticChildCount | int | The number of children that will contribute semantic information | - |
| dragStartBehavior | DragStartBehavior | Determines the way that drag start behavior is handled | DragStartBehavior.start |
| keyboardDismissBehavior | Key | ScrollViewKeyboardDismissBehavior the defines how this ScrollView will dismiss the keyboard automatically | ScrollViewKeyboardDismissBehavior.manual |
| restorationId | String | Restoration ID to save and restore the scroll offset of the scrollable | - |
| clipBehavior | Clip | The content will be clipped (or not) according to this option | Clip.hardEdge |
| duration | int | The milliseconds the animation runs  | 1300 |
| reBounceDepth | double | A value of bounce depth | 10.0 |
