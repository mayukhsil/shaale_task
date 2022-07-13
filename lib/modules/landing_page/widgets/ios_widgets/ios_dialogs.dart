import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shaale_task/styles/app_text_styles.dart';

class IOSClassicAlertDialog extends ConsumerWidget {

  final Widget childWidget;

  const IOSClassicAlertDialog({Key? key, required this.childWidget}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return CupertinoAlertDialog(
      content: childWidget,
      actions: [
        CupertinoButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('OK',style: AppTextStyles.s14(fontType: FontType.MEDIUM),)
        ),
      ],
    );
  }
}
