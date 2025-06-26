import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mood_map/core/constants/colors.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({
//     super.key,
//     this.backgroundColor = Colors.white,
//     required this.currentIndex,
//     required this.onTap,
//     this.selectedItemColor = MoodColors.primaryDarkHover,
//     this.unselectedItemColor = MoodColors.tPrimaryLightActive,
//     required this.items,
//   });

//   final Color? backgroundColor;
//   final Color? selectedItemColor;
//   final Color? unselectedItemColor;
//   final int currentIndex;
//   final List<BottomNavigationBarItem> items;
//   final void Function(int) onTap;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: backgroundColor,
//       currentIndex: currentIndex,
//       selectedItemColor: selectedItemColor,
//       unselectedItemColor: unselectedItemColor,
//       items: items,
//       onTap: onTap,
//     );
//   }
// }

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({
//     super.key,
//     this.backgroundColor,
//     required this.currentIndex,
//     required this.onTap,
//     this.selectedItemColor,
//     this.unselectedItemColor,
//     required this.items,
//   });

//   final Color? backgroundColor;
//   final Color? selectedItemColor;
//   final Color? unselectedItemColor;
//   final int currentIndex;
//   final List<BottomNavigationBarItem> items;
//   final void Function(int) onTap;

//   @override
//   Widget build(BuildContext context) {
//     final isDark = Theme.of(context).brightness == Brightness.dark;

//     return BottomNavigationBar(
//       backgroundColor: backgroundColor ?? (isDark ? const Color(0xFF222C36) : Colors.white),
//       currentIndex: currentIndex,
//       selectedItemColor: selectedItemColor ?? (isDark ? MoodColors.primaryLight : MoodColors.primaryDarkHover),
//       unselectedItemColor: unselectedItemColor ?? (isDark ? Colors.white54 : MoodColors.tPrimaryLightActive),
//       items: items,
//       onTap: onTap,
//       type: BottomNavigationBarType.fixed,
//       // لضبط الشفافية/الظل أو أي تخصيص آخر أضف هنا
//     );
//   }
// }

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    this.backgroundColor,
    required this.currentIndex,
    required this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    required this.items,
  });

  final Color? backgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? (isDark ? const Color(0xFF222C36) : Colors.white),
        boxShadow: [BoxShadow(color: isDark ? Colors.black38 : Colors.black12, blurRadius: 16, offset: const Offset(0, -4))],
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(22), topRight: Radius.circular(22)),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(items.length, (i) {
            final isSelected = currentIndex == i;
            return Expanded(
              child: InkWell(
                onTap: () {
                  onTap(i);
                  HapticFeedback.lightImpact(); // اهتزاز خفيف
                },
                borderRadius: BorderRadius.circular(26),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeOut,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? (isDark ? Colors.white10 : Colors.blue.withOpacity(0.11)) : Colors.transparent,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedScale(
                        scale: isSelected ? 1.23 : 1.0,
                        duration: const Duration(milliseconds: 230),
                        child: IconTheme(
                          data: IconThemeData(
                            color:
                                isSelected
                                    ? (selectedItemColor ?? (isDark ? MoodColors.primaryLight : MoodColors.primaryDarkHover))
                                    : (unselectedItemColor ?? (isDark ? Colors.white54 : MoodColors.tPrimaryLightActive)),
                            size: 30,
                          ),
                          child: items[i].icon,
                        ),
                      ),
                      const SizedBox(height: 1),
                      AnimatedOpacity(
                        opacity: isSelected ? 1 : 0,
                        duration: const Duration(milliseconds: 210),
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(color: selectedItemColor ?? MoodColors.primaryDark, shape: BoxShape.circle),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        items[i].label ?? "",
                        style: TextStyle(
                          color:
                              isSelected
                                  ? (selectedItemColor ?? (isDark ? MoodColors.primaryLight : MoodColors.primaryDarkHover))
                                  : (unselectedItemColor ?? (isDark ? Colors.white54 : MoodColors.tPrimaryLightActive)),
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                          fontSize: isSelected ? 14.5 : 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
