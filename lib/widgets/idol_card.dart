import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_sparklingthon/constants/default_colors.dart';
import 'package:gdsc_sparklingthon/models/idol.dart';
import 'package:gdsc_sparklingthon/widgets/custom_avatar.dart';

class IdolCard extends StatelessWidget {
  final IdolModel idol;
  const IdolCard(this.idol, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 90, // 전체 너비 조정
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/leaf_456.svg',
                  width: 40, // 아이콘 크기 조정
                  height: 40,
                ),
                Text(
                  '${idol.rank}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Pacifico',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            CustomAvatar(20, AssetImage(idol.imagePath), idol),
          ],
        ),
      ),
      title: Text(
        idol.koreanName,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(idol.groupName),
      trailing: Text(
        '${idol.votesPercentage}% (${idol.votes}표)',
        style: const TextStyle(
          color: DefaultColors.lightGreen,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class IdolBox extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 150,
          height: 120,
          decoration: ShapeDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/yuqi.png'),
              fit: BoxFit.cover,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text('우기 | 여자(아이들)')
      ],
    );
  }
}
