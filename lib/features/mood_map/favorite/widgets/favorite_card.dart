import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mood_map/core/constants/colors.dart';
import 'package:mood_map/core/constants/icons.dart';
import 'package:mood_map/features/data/models/favorite_model.dart';
import 'package:mood_map/l10n/app_localizations.dart';
import 'package:share_plus/share_plus.dart';

// class FavoriteQuoteCard extends StatelessWidget {
//   const FavoriteQuoteCard({super.key, required this.quote, required this.onRemove});
//   final FavoriteQuote quote;
//   final VoidCallback onRemove;

//   void _copyQuote(BuildContext context) {
//     Clipboard.setData(ClipboardData(text: quote.text));
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.quoteCopied)));
//   }

//   void _shareQuote(BuildContext context) {
//     Share.share(quote.text, subject: AppLocalizations.of(context)!.shareQuoteSubject);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(24),
//           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 3))],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // سطر الأيقونات العلوية (قلب حذف/تبديل، إلخ)
//             Row(
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.favorite, color: Colors.red),
//                   onPressed: onRemove, // لإزالة الاقتباس من المفضلة
//                   tooltip: AppLocalizations.of(context)!.removeFromFavorites,
//                 ),
//                 const Spacer(),
//                 // يمكنك إضافة تاريخ الإضافة أو زر share هنا إذا رغبت
//               ],
//             ),
//             // const SizedBox(height: 10),
//             // نص الاقتباس
//             Text('"${quote.text}"', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//             // const SizedBox(height: 16),
//             // زر النسخ والمشاركة/التحميل
//             Row(
//               children: [
//                 // زر النسخ
//                 InkWell(
//                   onTap: () => _copyQuote(context),
//                   borderRadius: BorderRadius.circular(40),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(MoodIcons.copy, color: MoodColors.primaryNormalActive, width: 25, height: 25),
//                   ),
//                 ),
//                 // زر المشاركة
//                 SizedBox(width: 16),
//                 InkWell(
//                   onTap: () => _shareQuote(context),
//                   borderRadius: BorderRadius.circular(40),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Image.asset(
//                       MoodIcons.download, // يمكنك تغيير الأيقونة إلى share إذا أحببت
//                       color: MoodColors.primaryNormalActive,
//                       width: 25,
//                       height: 25,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class FavoriteQuoteCard extends StatelessWidget {
  const FavoriteQuoteCard({super.key, required this.quote, required this.onRemove});

  final FavoriteQuote quote;
  final VoidCallback onRemove;

  void _copyQuote(BuildContext context) {
    Clipboard.setData(ClipboardData(text: quote.text));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(AppLocalizations.of(context)!.quoteCopied)));
  }

  void _shareQuote(BuildContext context) {
    Share.share(quote.text, subject: AppLocalizations.of(context)!.shareQuoteSubject);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF23283A) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: isDark ? Colors.black54.withOpacity(0.09) : Colors.black12, blurRadius: 10, offset: const Offset(0, 3)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // سطر الأيقونات العلوية
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite, color: Colors.red),
                  onPressed: onRemove,
                  tooltip: AppLocalizations.of(context)!.removeFromFavorites,
                ),
                const Spacer(),
                // بإمكانك إضافة تاريخ الاقتباس أو share
              ],
            ),
            Text(
              '"${quote.text}"',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: isDark ? Colors.white : Colors.black87),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => _copyQuote(context),
                  borderRadius: BorderRadius.circular(40),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      MoodIcons.copy,
                      color: isDark ? MoodColors.primaryLight : MoodColors.primaryNormalActive,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  onTap: () => _shareQuote(context),
                  borderRadius: BorderRadius.circular(40),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      MoodIcons.download,
                      color: isDark ? MoodColors.primaryLight : MoodColors.primaryNormalActive,
                      width: 25,
                      height: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
