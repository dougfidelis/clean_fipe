import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../riverpod/fipe_info_riverpod/fipe_info_provider.dart';

class FipeInfoPage extends HookConsumerWidget {
  const FipeInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fipeInfo = ref.watch(fipeInfoNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Column(
          children: [
            Text(fipeInfo!.brand),
            Text(fipeInfo.model),
            Text(fipeInfo.modelYear.toString()),
            Text(fipeInfo.codeFipe),
            Text(fipeInfo.referenceMonth),
            Text(fipeInfo.price),
          ],
        ));
  }
}
