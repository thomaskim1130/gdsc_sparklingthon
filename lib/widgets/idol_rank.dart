import 'package:flutter/material.dart';
import 'package:gdsc_sparklingthon/constants/default_colors.dart';
import 'package:gdsc_sparklingthon/models/idol.dart';
import 'package:gdsc_sparklingthon/widgets/idol_card.dart';

class IdolRankWidget extends StatelessWidget {
  final List<IdolModel> idolData;
  const IdolRankWidget(this.idolData, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for (int i = 0; i < idolData.length; i++) ...[
        IdolCard(idolData[i]),
        if (i < idolData.length - 1) // 마지막 아이템 이후에는 구분선을 추가하지 않음
          Divider(
            color: DefaultColors.darkGreen,
            thickness: 0.25,
          ),
      ],
    ]);
  }
}
