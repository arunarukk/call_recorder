import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';



class AnimatedBar extends StatefulWidget {
  const AnimatedBar({
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedBar> createState() => _AnimatedBarState();
}

class _AnimatedBarState extends State<AnimatedBar> {
  dynamic selected;
  var heart = false;

  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
      items: [
        AnimatedBarItems(
            icon: const Icon(
              Icons.home,
            ),
            selectedIcon: const Icon(Icons.home),
            selectedColor: Colors.deepPurple,
            backgroundColor: Colors.amber,
            title: const Text('Home')),
        AnimatedBarItems(
            icon: const Icon(Icons.info),
            selectedIcon: const Icon(Icons.info),
            selectedColor: Colors.green,
            backgroundColor: Colors.amber,
            title: const Text('Info')),
        AnimatedBarItems(
            icon: const Icon(
              Icons.people,
            ),
            selectedIcon: const Icon(
              Icons.people,
            ),
            backgroundColor: Colors.amber,
            selectedColor: Colors.deepOrangeAccent,
            title: const Text('Contacts')),
        AnimatedBarItems(
            icon: const Icon(
              Icons.phone,
            ),
            selectedIcon: const Icon(
              Icons.phone,
            ),
            backgroundColor: Colors.amber,
            selectedColor: Colors.pinkAccent,
            title: const Text('Call')),
      ],
      iconSize: 32,
      barAnimation: BarAnimation.fade,
      iconStyle: IconStyle.animated,
      hasNotch: true,
      fabLocation: StylishBarFabLocation.center,
      opacity: 0.4,
      currentIndex: selected ?? 0,
      onTap: (index) {
        setState(() {
          selected = index;
        });
      },
    );
  }
}
