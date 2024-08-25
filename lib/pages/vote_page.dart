import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_sparklingthon/constants/default_colors.dart';
import 'package:gdsc_sparklingthon/providers/voted_provider.dart';
import 'package:provider/provider.dart';

class VotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VotedProvider votedProvider = context.read<VotedProvider>();
    return Scaffold(
      backgroundColor: DefaultColors.lightPink,
      appBar: AppBar(
        backgroundColor: DefaultColors.lightPink,
        titleSpacing: 0, //votedProvider.resetVote()
        title: SvgPicture.asset(
          'assets/icons/logo_white.svg',
        ),
        centerTitle: false,
        actions: [
          Image.asset('assets/icons/heart_empty.png'),
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
              Row(
                children: [
                  Text(
                    '오늘의 Pick',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6),
              Text(
                '2024년 8월 25일 일요일', //TODO : DB연동
                style: TextStyle(
                  color: DefaultColors.darkPink,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Divider(
                height: 0.25,
                color: DefaultColors.darkGreen,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => votedProvider.voteFor('winter', context),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 150,
                                  height: 120,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/winter.png'),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/icons/Vector.svg',
                                  alignment: Alignment.topLeft,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text('윈터 | aespa')
                          ],
                        ),
                      ),
                      GestureDetector(
                          onTap: () => votedProvider.voteFor('yuqi', context),
                          child: Column(
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
                          )),
                      GestureDetector(
                          onTap: () => votedProvider.voteFor('hanni', context),
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 120,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/hanni.png'),
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
                              Text('하니 | NewJeans')
                            ],
                          )),
                      GestureDetector(
                          onTap: () => votedProvider.voteFor('haewon', context),
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 120,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/haewon.png'),
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
                              Text('해원 | NMIXX')
                            ],
                          )),
                      GestureDetector(
                          onTap: () =>
                              votedProvider.voteFor('giselle', context),
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 120,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/giselle.png'),
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
                              Text('지젤 | aespa')
                            ],
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () =>
                              votedProvider.voteFor('jiheonbaek', context),
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 120,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/jiheonbaek.png'),
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
                              Text('백지헌 | fromis_9')
                            ],
                          )),
                      GestureDetector(
                          onTap: () => votedProvider.voteFor('anton', context),
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 120,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/anton.png'),
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
                              Text('앤톤 | RIIZE')
                            ],
                          )),
                      GestureDetector(
                          onTap: () =>
                              votedProvider.voteFor('eunwoocha', context),
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 120,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/eunwoocha.png'),
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
                              Text('차은우 | 아스트로')
                            ],
                          )),
                      GestureDetector(
                          onTap: () => votedProvider.voteFor('karina', context),
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 120,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/karina.png'),
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
                              Text('카리나 | aespa')
                            ],
                          )),
                      GestureDetector(
                          onTap: () =>
                              votedProvider.voteFor('ningning', context),
                          child: Column(
                            children: [
                              Container(
                                width: 150,
                                height: 120,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/ningning.png'),
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
                              Text('닝닝 | aespa')
                            ],
                          )),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
