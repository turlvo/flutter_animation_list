# Animation List

A simple animation listview widget.<br>
When it is built, list item is shown by sliding and bouncing.
<br><br>


# Preview
![Screen Recording 2021-11-29 at 11 12 09 PM (2)](https://user-images.githubusercontent.com/24351423/143973177-3c01bef5-82f2-4e7f-b14a-867292841b64.gif)![Screen Recording 2021-11-30 at 11 11 26 AM](https://user-images.githubusercontent.com/24351423/143973378-bfffa7e9-07be-4625-851e-36b9324f9576.gif)






# Installation

Add `animation_list: ^2.1.0` to your `pubspec.yaml` dependecies. And import it:

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
      ),
    );
  }
```
<br>

# Params
```
AnimationList(
    children: children,
    duration: 1000,
    reBounceDepth: 10,
)
```
