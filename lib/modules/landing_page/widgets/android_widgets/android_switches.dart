import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shaale_task/modules/landing_page/providers/landing_provider.dart';

class AndroidClassicSwitch extends ConsumerWidget {
  const AndroidClassicSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var landingChangeNotifierProvider = ref.watch(landingChangeNotifier);
    return Switch(
        value: landingChangeNotifierProvider.isSwitchOn,
        onChanged: (value){
          landingChangeNotifierProvider.toggleSwitch(value);
        }
    );
  }
}
