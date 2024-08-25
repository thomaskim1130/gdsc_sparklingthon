import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_sparklingthon/constants/default_colors.dart';
import 'package:gdsc_sparklingthon/models/idol.dart';
import 'package:gdsc_sparklingthon/widgets/custom_avatar.dart';

class TopThreeWidget extends StatelessWidget {
  final List<IdolModel> idolData;
  final bool green;

  TopThreeWidget(this.idolData, this.green, {super.key});

  late List<IdolModel> orderedData = [idolData[1], idolData[0], idolData[2]];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: orderedData.map((idol) {
          return Flexible(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    CustomAvatar(idol.rank == 1 ? 60 : 40,
                        AssetImage(idol.imagePath), idol),
                    Positioned(
                      top: idol.rank == 1 ? 7 : 0,
                      left: idol.rank == 1 ? 0 : 7,
                      child: green
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/leaf_123.svg', //green leaf
                                ),
                                Text(
                                  '${idol.rank}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          : SvgPicture.asset(
                              'assets/icons/LeafMyPick${idol.rank}.svg'),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  idol.koreanName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  idol.groupName,
                  style: TextStyle(
                    color: DefaultColors.grey,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${idol.votesPercentage}% (${idol.votes}표)',
                  style: TextStyle(
                    color: DefaultColors.darkGreen,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
