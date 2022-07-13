import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shaale_task/styles/app_text_styles.dart';

class AndroidClassicAlertDialog extends ConsumerWidget {

  final Widget childWidget;

  const AndroidClassicAlertDialog({Key? key, required this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return AlertDialog(
      content: childWidget,
      actions: [
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('OK',style: AppTextStyles.s14(fontType: FontType.MEDIUM),)
        ),
      ],
    );
  }
}
