import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../riverpod/fipe_info_riverpod/fipe_info_provider.dart';

class FipeInfoPage extends HookConsumerWidget {

  const FipeInfoPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context, WidgetRef ref) {
   final fipeInfo = ref.watch(fipeInfoNotifierProvider);
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Visibility(
              visible: fipeInfo.isNotEmpty,
              replacement: Text(''),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(fipeInfo[index].brand),
                      Text(fipeInfo[index].model),
                      Text(fipeInfo[index].modelYear.toString()),
                      Text(fipeInfo[index].codeFipe),
                      Text(fipeInfo[index].referenceMonth),
                      Text(fipeInfo[index].price),
                    ],
                  );
                },
              )),
       );
  }
}