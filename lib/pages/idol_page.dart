import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_sparklingthon/constants/default_colors.dart';
import 'package:gdsc_sparklingthon/models/idol.dart';
import 'package:gdsc_sparklingthon/providers/voted_provider.dart';
import 'package:provider/provider.dart';

class IdolPage extends StatelessWidget {
  final IdolModel idol;
  const IdolPage(this.idol, {super.key});

  @override
  Widget build(BuildContext context) {
    VotedProvider votedProvider = context.read<VotedProvider>();
    return Scaffold(
        backgroundColor: DefaultColors.lightPink,
        appBar: AppBar(
          backgroundColor: DefaultColors.lightPink,
          titleSpacing: 0, //votedProvider.resetVote()
          title:
              SvgPicture.asset('assets/icons/logo_white.svg', fit: BoxFit.fill),
          centerTitle: false,
          actions: [
            votedProvider.votedToday
                ? Image.asset('assets/icons/heart_filled.png')
                : Image.asset('assets/icons/heart_empty.png'),
            Container(
              width: 20,
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.0), // 둥근 모서리 적용
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ListView(
                  padding: EdgeInsets.all(24),
                  children: [
                    Image.asset('assets/images/${idol.id}.png'),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      '${idol.koreanName}  |  ${idol.groupName}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 325,
                      height: 99,
                      child: Center(
                        child: Text(
                          '안녕하세요, ${idol.koreanName}입니다!\n8월도 화이팅합시다\nGDSC 사랑해요!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      decoration: ShapeDecoration(
                        color: Color(0xFFE6E7E7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset('assets/images/StatGraphics.png')
                  ],
                ))));
  }
}
