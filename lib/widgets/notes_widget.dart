import 'package:flutter/material.dart';
import 'package:notes_app/constants/my_app_icons.dart';

class NotesWidget extends StatelessWidget {
  final String title;
  final String bodyText;

  const NotesWidget({super.key, required this.title, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row with pin
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Transform.rotate(
                  angle: 0.80,
                  child: const Icon(MyAppIcons.pin, size: 18),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Body text — natural height but capped to N lines
            Text(
              bodyText,
              style: const TextStyle(fontSize: 14, height: 1.4),
              maxLines: 10, // <-- adjust this cap as you prefer (6..12)
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 12),

            // Footer (date)
            const Text(
              '28/7/2022',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
