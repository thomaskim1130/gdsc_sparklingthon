import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gdsc_sparklingthon/constants/default_colors.dart';
import 'package:gdsc_sparklingthon/models/idol.dart';
import 'package:gdsc_sparklingthon/providers/voted_provider.dart';
import 'package:gdsc_sparklingthon/widgets/custom_avatar.dart';
import 'package:gdsc_sparklingthon/widgets/top_three.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VotedProvider votedProvider = context.read<VotedProvider>();
    bool _isPressed = true;
    return Scaffold(
      backgroundColor: DefaultColors.lightGreen,
      appBar: AppBar(
        backgroundColor: DefaultColors.lightGreen,
        titleSpacing: 0,
        title: IconButton(
          iconSize: 90,
          icon: SvgPicture.asset(
            'assets/icons/logo_white.svg',
          ),
          onPressed: () => {votedProvider.resetVote()},
        ),
        centerTitle: false,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Row(children: [
              SizedBox(
                child: Image.asset(
                  votedProvider.votedToday
                      ? 'assets/icons/heart_filled.png'
                      : 'assets/icons/heart_empty.png',
                  width: 200,
                ),
                width: 92,
                height: 86,
              ),
              Column(
                children: [
                  Text(
                    '윈터짱짱맨',
                    style: TextStyle(
                        fontSize: 20,
                        color: DefaultColors.background,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'kingwinter@kaist.ac.kr',
                    style: TextStyle(
                        fontSize: 15,
                        color: DefaultColors.background,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              SvgPicture.asset('assets/icons/EditNickname.svg')
            ]),
            Flexible(
              child: ListView(children: [
                Row(
                  children: [
                    Text(
                      '나의 8월 분리수거',
                      style: TextStyle(
                          fontSize: 20,
                          color: DefaultColors.background,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                Image.asset('assets/images/PieChart.png'),
                Container(
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
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      //padding: EdgeInsets.all(24),
                      children: [
                        Row(
                          children: [
                            Text(
                              '나의 최애',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 150,
                            ),
                            Switch(
                                value: _isPressed,
                                onChanged: (value) =>
                                    {_isPressed = !_isPressed})
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(children: [
                          CustomAvatar(
                              36.0,
                              AssetImage('assets/images/winter.png'),
                              IdolModel(
                                  id: 'winter',
                                  groupName: 'aespa',
                                  koreanName: '윈터',
                                  votes: '123',
                                  votesPercentage: '40',
                                  rank: 1)),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text(
                                '윈터',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'aespa',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SvgPicture.asset('assets/icons/EditFav.svg')
                        ]),
                        SizedBox(height: 20),
                        Row(children: [
                          Text(
                            '8월 My Pick',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ]),
                        TopThreeWidget([
                          IdolModel(
                              id: 'winter',
                              groupName: 'aespa',
                              koreanName: '윈터',
                              votes: '123',
                              votesPercentage: '40',
                              rank: 1),
                          IdolModel(
                              id: 'karina',
                              groupName: 'aespa',
                              koreanName: '카리나',
                              votes: '100',
                              votesPercentage: '34',
                              rank: 2),
                          IdolModel(
                              id: 'ningning',
                              groupName: 'aespa',
                              koreanName: '닝닝',
                              votes: '83',
                              votesPercentage: '26',
                              rank: 3),
                        ], false)
                      ],
                    ),
                  ),
                ),
              ]),
            )
          ])),
    );
  }
}
