import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomCupertinoActionSheet extends HookConsumerWidget {
  const CustomCupertinoActionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          child: Text('編集を破棄'),
          onPressed: () => {
            Navigator.of(context).popUntil((route) => route.isFirst),
          },
        ),
      ],
      cancelButton: CupertinoButton(
        child: Text('キャンセル'),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
