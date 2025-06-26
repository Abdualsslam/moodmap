import 'package:flutter/material.dart';
import 'package:mood_map/core/constants/colors.dart';

// class ArrowButton extends StatelessWidget {
//   const ArrowButton({
//     super.key,
//     required this.icon,
//     required this.onTap,
//     this.flipForRtl = false, // <-- افتراضي: لا تقلب
//   });

//   final String icon;
//   final VoidCallback onTap;
//   final bool flipForRtl; // <-- جديد

//   @override
//   Widget build(BuildContext context) {
//     // اذا كنت تريد إجبار السهم على عدم الانعكاس مع اللغة ضع flipForRtl = false
//     // اذا تريد انعكاسه مع اللغة (ديناميكياً) ضع flipForRtl = true عند الاستخدام
//     final isRtl = Directionality.of(context) == TextDirection.rtl;

//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 4))],
//           shape: BoxShape.circle,
//           border: Border.all(color: MoodColors.primaryNormal, width: 2),
//           color: MoodColors.tPrimaryLight,
//         ),
//         padding: const EdgeInsets.all(30),
//         child: Transform(
//           alignment: Alignment.center,
//           // اذا flipForRtl == true && isRtl ==> قلب الصورة
//           transform: (flipForRtl && isRtl) ? (Matrix4.identity()..scale(-1.0, 1.0, 1.0)) : Matrix4.identity(),
//           child: Image.asset(icon, width: 30, height: 30, color: MoodColors.badDarker),
//         ),
//       ),
//     );
//   }
// }
class ArrowButton extends StatefulWidget {
  const ArrowButton({super.key, required this.icon, required this.onTap, this.flipForRtl = false, required this.isDark});

  final String icon;
  final VoidCallback onTap;
  final bool flipForRtl;
  final bool isDark;

  @override
  State<ArrowButton> createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  double _scale = 1.0;

  void _onTapDown(TapDownDetails d) => setState(() => _scale = 0.91);
  void _onTapUp(TapUpDetails d) => setState(() => _scale = 1.0);
  void _onTapCancel() => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final borderColor = widget.isDark ? MoodColors.primaryDark : MoodColors.primaryNormal;
    final backgroundColor = widget.isDark ? MoodColors.tPrimaryDark : MoodColors.tPrimaryLight;
    final iconColor = widget.isDark ? MoodColors.primaryLight : MoodColors.badDarker;

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 130),
        curve: Curves.easeInOut,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 2),
            shape: BoxShape.circle,
            color: backgroundColor,
            boxShadow: [BoxShadow(color: widget.isDark ? Colors.black45 : Colors.black12, blurRadius: 12, offset: const Offset(0, 4))],
          ),
          padding: const EdgeInsets.all(30),
          child: Transform(
            alignment: Alignment.center,
            transform: (widget.flipForRtl && isRtl) ? (Matrix4.identity()..scale(-1.0, 1.0, 1.0)) : Matrix4.identity(),
            child: Image.asset(widget.icon, width: 30, height: 30, color: iconColor),
          ),
        ),
      ),
    );
  }
}
