import 'package:animator/animator.dart';
import 'package:flutter/material.dart';
import 'package:mood_map/features/mood_map/favorite/favorite_page.dart';

class MoodHeart extends StatelessWidget {
  const MoodHeart({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        // انتقل إلى صفحة المفضلة
        Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => FavoritesPage()), // غيّر اسم الصفحة لو عندك اسم مختلف
        );
      },
      child: SizedBox(
        height: width / 10,
        width: width / 10,
        child: Animator<double>(
          duration: Duration(milliseconds: 1000),
          cycles: 0,
          curve: Curves.bounceOut,
          tween: Tween<double>(begin: 20.0, end: 25.0),
          builder: (context, animatorState, child) => Icon(Icons.favorite, size: animatorState.value * 2, color: const Color(0xFFFF5757)),
        ),
      ),
    );
  }
}
