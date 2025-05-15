import 'package:flutter/material.dart';

Future<void> showSubCommentBottomSheet(
  BuildContext context,
  String parentCommentId,
) async {
  final _controller = TextEditingController();

  final submitted = await showModalBottomSheet<bool>(
    context: context,
    isScrollControlled:
        true, // Allows the sheet to take full height when needed
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).viewInsets.bottom, // Accounts for keyboard
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Write your reply...',
                  border: OutlineInputBorder(),
                ),
                maxLines: 4,
                minLines: 1,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false), // Cancel
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      if (_controller.text.trim().isNotEmpty) {
                        Navigator.pop(context, true); // Submit
                      }
                    },
                    child: const Text('Post'),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );

  // Handle after sheet dismissal
  if (submitted == true) {
    // await _postSubComment(parentCommentId, _controller.text.trim());
    _controller.dispose();
  }
}
